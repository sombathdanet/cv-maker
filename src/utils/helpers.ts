/**
 * Debounces a function call, delaying execution until after wait milliseconds
 * have elapsed since the last time the debounced function was invoked.
 * 
 * @template T - Function type
 * @param func - The function to debounce
 * @param wait - The number of milliseconds to delay
 * @returns Debounced version of the function
 * 
 * @precondition func is a valid function
 * @precondition wait is a positive number (milliseconds)
 * @postcondition Returns debounced version of func
 * @postcondition Function execution delayed by wait milliseconds
 * @postcondition Multiple rapid calls result in single execution
 */
export function debounce<T extends (...args: any[]) => any>(
  func: T,
  wait: number
): (...args: Parameters<T>) => void {
  let timeout: ReturnType<typeof setTimeout> | null = null

  return function (this: any, ...args: Parameters<T>) {
    const context = this

    if (timeout) {
      clearTimeout(timeout)
    }

    timeout = setTimeout(() => {
      func.apply(context, args)
      timeout = null
    }, wait)
  }
}

/**
 * Calculates the breakpoint category based on screen width.
 * 
 * @param width - Screen width in pixels
 * @returns Breakpoint category: 'mobile', 'tablet', or 'desktop'
 * 
 * @precondition width is a positive number
 * @postcondition Returns valid breakpoint string
 * @postcondition 'mobile' ⟺ width < 768
 * @postcondition 'tablet' ⟺ 768 ≤ width < 1024
 * @postcondition 'desktop' ⟺ width ≥ 1024
 */
export function calculateBreakpoint(width: number): 'mobile' | 'tablet' | 'desktop' {
  if (width < 768) {
    return 'mobile'
  } else if (width >= 768 && width < 1024) {
    return 'tablet'
  } else {
    return 'desktop'
  }
}

/**
 * Calculates the scale factor to fit preview content within container
 * while maintaining aspect ratio.
 * 
 * @param containerWidth - Container width in pixels
 * @param containerHeight - Container height in pixels
 * @param previewWidth - Preview content width (default: 794px for A4)
 * @param previewHeight - Preview content height (default: 1123px for A4)
 * @returns Scale factor between 0.1 and 2.0
 * 
 * @precondition containerWidth > 0
 * @precondition containerHeight > 0
 * @precondition previewWidth > 0
 * @precondition previewHeight > 0
 * @postcondition Returns scale factor between 0.1 and 2.0
 * @postcondition Scale maintains aspect ratio
 * @postcondition Preview fits within container bounds
 */
export function calculatePreviewScale(
  containerWidth: number,
  containerHeight: number,
  previewWidth: number = 794,
  previewHeight: number = 1123
): number {
  // Calculate scale factors for both dimensions
  const scaleX = containerWidth / previewWidth
  const scaleY = containerHeight / previewHeight

  // Use minimum scale to ensure preview fits
  let scale = Math.min(scaleX, scaleY)

  // Apply constraints: scale must be between 0.1 and 2.0
  scale = Math.max(0.1, Math.min(2.0, scale))

  return scale
}
