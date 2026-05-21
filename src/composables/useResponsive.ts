import { ref, computed, onMounted, onUnmounted, type Ref, type ComputedRef } from 'vue'
import { debounce, calculateBreakpoint } from '@/utils/helpers'

/**
 * Return type for useResponsive composable
 */
export interface UseResponsiveReturn {
  breakpoint: Ref<'mobile' | 'tablet' | 'desktop'>
  isMobile: ComputedRef<boolean>
  isTablet: ComputedRef<boolean>
  isDesktop: ComputedRef<boolean>
  screenWidth: Ref<number>
  screenHeight: Ref<number>
  layoutMode: ComputedRef<'stacked' | 'side-by-side'>
}

/**
 * Composable for responsive layout management.
 * Detects screen breakpoints and provides reactive responsive state.
 * 
 * @returns Reactive responsive state object
 * 
 * @precondition Function called within Vue component setup context
 * @precondition Window object is available
 * @postcondition Returns reactive responsive state object
 * @postcondition Breakpoint is correctly initialized
 * @postcondition Resize listener is attached
 * @postcondition Cleanup function registered for unmount
 */
export function useResponsive(): UseResponsiveReturn {
  // Reactive state
  const screenWidth = ref(typeof window !== 'undefined' ? window.innerWidth : 1024)
  const screenHeight = ref(typeof window !== 'undefined' ? window.innerHeight : 768)
  const breakpoint = ref<'mobile' | 'tablet' | 'desktop'>(
    calculateBreakpoint(screenWidth.value)
  )

  // Computed properties
  const isMobile = computed(() => breakpoint.value === 'mobile')
  const isTablet = computed(() => breakpoint.value === 'tablet')
  const isDesktop = computed(() => breakpoint.value === 'desktop')
  
  const layoutMode = computed<'stacked' | 'side-by-side'>(() => {
    return breakpoint.value === 'desktop' ? 'side-by-side' : 'stacked'
  })

  /**
   * Handle window resize event
   */
  const handleResize = () => {
    screenWidth.value = window.innerWidth
    screenHeight.value = window.innerHeight
    breakpoint.value = calculateBreakpoint(screenWidth.value)
  }

  // Debounce resize handler to prevent excessive recalculations
  const debouncedResize = debounce(handleResize, 150)

  // Lifecycle hooks
  onMounted(() => {
    if (typeof window !== 'undefined') {
      // Initialize with current dimensions
      handleResize()
      
      // Attach resize listener
      window.addEventListener('resize', debouncedResize)
    }
  })

  onUnmounted(() => {
    if (typeof window !== 'undefined') {
      window.removeEventListener('resize', debouncedResize)
    }
  })

  return {
    breakpoint,
    isMobile,
    isTablet,
    isDesktop,
    screenWidth,
    screenHeight,
    layoutMode
  }
}
