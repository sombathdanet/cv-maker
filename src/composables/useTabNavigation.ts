import { ref, type Ref } from 'vue'

/**
 * Return type for useTabNavigation composable
 */
export interface UseTabNavigationReturn {
  activeTab: Ref<'edit' | 'design'>
  previousTab: Ref<'edit' | 'design' | null>
  tabHistory: Ref<Array<'edit' | 'design'>>
  setActiveTab: (tab: 'edit' | 'design') => void
}

/**
 * Composable for tab navigation state management.
 * Manages active tab state and provides tab switching functionality.
 * 
 * @param initialTab - Initial active tab (default: 'edit')
 * @returns Tab state management object
 * 
 * @precondition initialTab is either 'edit' or 'design'
 * @postcondition Returns tab state management object
 * @postcondition activeTab initialized to initialTab value
 * @postcondition Tab history initialized with initialTab
 * @postcondition setActiveTab function available for tab switching
 */
export function useTabNavigation(
  initialTab: 'edit' | 'design' = 'edit'
): UseTabNavigationReturn {
  // Reactive state
  const activeTab = ref<'edit' | 'design'>(initialTab)
  const previousTab = ref<'edit' | 'design' | null>(null)
  const tabHistory = ref<Array<'edit' | 'design'>>([initialTab])

  /**
   * Set the active tab and update navigation history.
   * 
   * @param tab - Tab to activate ('edit' or 'design')
   * 
   * @precondition tab is either 'edit' or 'design'
   * @postcondition activeTab is updated to tab
   * @postcondition previousTab is set to previous activeTab value
   * @postcondition tab is added to tabHistory
   */
  const setActiveTab = (tab: 'edit' | 'design') => {
    // Prevent redundant updates
    if (activeTab.value === tab) {
      return
    }

    // Update previous tab
    previousTab.value = activeTab.value

    // Update active tab
    activeTab.value = tab

    // Add to history
    tabHistory.value.push(tab)

    // Scroll content panel to top (if element exists)
    const contentPanel = document.querySelector('.content-panel')
    if (contentPanel) {
      contentPanel.scrollTo({
        top: 0,
        behavior: 'smooth'
      })
    }
  }

  return {
    activeTab,
    previousTab,
    tabHistory,
    setActiveTab
  }
}
