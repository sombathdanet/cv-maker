# Tasks: Responsive Tabs Feature

## Task 1: Create useResponsive Composable

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 2 hours

### Description
Create a Vue 3 composable that detects screen breakpoints and provides responsive state to components.

### Acceptance Criteria
- [ ] Create `src/composables/useResponsive.ts` file
- [ ] Implement breakpoint detection (mobile < 768px, tablet 768-1024px, desktop ≥ 1024px)
- [ ] Track screen width and height reactively
- [ ] Calculate layout mode (stacked vs side-by-side) based on breakpoint
- [ ] Debounce window resize events (150ms)
- [ ] Provide computed properties: isMobile, isTablet, isDesktop
- [ ] Clean up event listeners on unmount
- [ ] Export TypeScript interfaces for return type

### Dependencies
- None

### Technical Notes
```typescript
// Expected interface
interface UseResponsiveReturn {
  breakpoint: Ref<'mobile' | 'tablet' | 'desktop'>
  isMobile: ComputedRef<boolean>
  isTablet: ComputedRef<boolean>
  isDesktop: ComputedRef<boolean>
  screenWidth: Ref<number>
  layoutMode: ComputedRef<'stacked' | 'side-by-side'>
}
```

---

## Task 2: Create useTabNavigation Composable

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 1.5 hours

### Description
Create a Vue 3 composable that manages tab state and provides tab switching functionality.

### Acceptance Criteria
- [ ] Create `src/composables/useTabNavigation.ts` file
- [ ] Track active tab state ('edit' | 'design')
- [ ] Track previous tab for navigation history
- [ ] Maintain tab history array
- [ ] Implement setActiveTab() function
- [ ] Prevent redundant updates when clicking active tab
- [ ] Initialize with 'edit' as default tab
- [ ] Export TypeScript interfaces

### Dependencies
- None

### Technical Notes
```typescript
// Expected interface
interface UseTabNavigationReturn {
  activeTab: Ref<'edit' | 'design'>
  previousTab: Ref<'edit' | 'design' | null>
  tabHistory: Ref<Array<'edit' | 'design'>>
  setActiveTab: (tab: 'edit' | 'design') => void
}
```

---

## Task 3: Create Pinia Design Store

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 2 hours

### Description
Create a Pinia store to manage design state (template selection, colors, fonts) with localStorage persistence.

### Acceptance Criteria
- [ ] Create `src/stores/design.ts` file
- [ ] Define DesignState interface with TypeScript
- [ ] Implement state: template, accentColor, font, fontSize, lineHeight, margins
- [ ] Implement actions: setTemplate, setAccentColor, setFont
- [ ] Implement getters for computed values
- [ ] Add localStorage persistence with debouncing (500ms)
- [ ] Load initial state from localStorage
- [ ] Handle localStorage errors gracefully
- [ ] Validate template ID before setting

### Dependencies
- Pinia installed and configured

### Technical Notes
```typescript
// Expected state structure
interface DesignState {
  template: string
  accentColor: string
  font: string
  fontSize: number
  lineHeight: number
  margins: { top: number; right: number; bottom: number; left: number }
}
```

---

## Task 4: Create TabNavigation Component

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 2 hours

### Description
Create a reusable tab navigation component with accessibility support and keyboard navigation.

### Acceptance Criteria
- [ ] Create `src/components/TabNavigation.vue` file
- [ ] Accept tabs array and modelValue props
- [ ] Emit update:modelValue on tab click
- [ ] Apply active state styling to selected tab
- [ ] Implement keyboard navigation (arrow keys, Enter)
- [ ] Add ARIA attributes (role="tab", aria-selected)
- [ ] Support optional icon display
- [ ] Add smooth transition animations
- [ ] Style with Tailwind CSS
- [ ] Make responsive for mobile devices

### Dependencies
- Task 2 (useTabNavigation composable)

### Technical Notes
```typescript
interface Tab {
  id: 'edit' | 'design'
  label: string
  icon?: string
}
```

---

## Task 5: Create ContentPanel Component

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 1.5 hours

### Description
Create a component that dynamically renders active tab content with transition animations.

### Acceptance Criteria
- [ ] Create `src/components/ContentPanel.vue` file
- [ ] Accept activeTab prop
- [ ] Dynamically render EditTab or DesignTab based on activeTab
- [ ] Apply fade/slide transition between tab switches
- [ ] Provide consistent padding and spacing
- [ ] Make scrollable vertically
- [ ] Handle loading states
- [ ] Style with Tailwind CSS

### Dependencies
- Task 6 (EditTab component)
- Task 7 (DesignTab component)

---

## Task 6: Create EditTab Component

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 4 hours

### Description
Create the Edit tab component that consolidates all resume form sections.

### Acceptance Criteria
- [ ] Create `src/components/EditTab.vue` file
- [ ] Integrate with existing resume data store/composable
- [ ] Display all form sections: Personal Info, Experience, Education, Skills, Languages, Certifications
- [ ] Implement accordion/collapsible sections
- [ ] Support add/remove for repeatable sections
- [ ] Bind all fields with v-model to store
- [ ] Add form validation with inline error display
- [ ] Make responsive for mobile devices
- [ ] Style with Tailwind CSS
- [ ] Auto-save changes to store

### Dependencies
- Existing resume data store/composable

### Technical Notes
- Reuse existing form field components if available
- Ensure real-time preview updates work correctly

---

## Task 7: Create DesignTab Component

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 3 hours

### Description
Create the Design tab component with template selection grid and visual previews.

### Acceptance Criteria
- [ ] Create `src/components/DesignTab.vue` file
- [ ] Display template grid (2 columns on mobile, 3+ on desktop)
- [ ] Show template thumbnail, name, and description
- [ ] Highlight selected template visually
- [ ] Handle template click to update design store
- [ ] Validate template ID before applying
- [ ] Show error notification for invalid templates
- [ ] Add hover effects on template cards
- [ ] Make responsive for all screen sizes
- [ ] Style with Tailwind CSS

### Dependencies
- Task 3 (Pinia design store)
- Template thumbnail images

### Technical Notes
```typescript
// Template data structure
const templates = [
  { id: 'classic', name: 'Classic', description: '...', thumbnail: '...', category: 'classic' },
  { id: 'modern', name: 'Modern', description: '...', thumbnail: '...', category: 'modern' },
  // ... more templates
]
```

---

## Task 8: Create PreviewPanel Component

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 2.5 hours

### Description
Create a component that wraps ResumePreview with responsive scaling logic.

### Acceptance Criteria
- [ ] Create `src/components/PreviewPanel.vue` file
- [ ] Wrap existing ResumePreview component
- [ ] Calculate scale factor based on container dimensions
- [ ] Apply CSS transform scale to maintain A4 aspect ratio
- [ ] Constrain scale between 0.1 and 2.0
- [ ] Recalculate scale on window resize (debounced 150ms)
- [ ] Center preview in container
- [ ] Handle null container ref gracefully
- [ ] Add smooth scaling transitions
- [ ] Style with Tailwind CSS

### Dependencies
- Task 1 (useResponsive composable)
- Existing ResumePreview component

### Technical Notes
```typescript
// A4 dimensions at 96dpi
const A4_WIDTH = 794
const A4_HEIGHT = 1123
```

---

## Task 9: Create ResponsiveLayout Component

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 3 hours

### Description
Create the main layout component that orchestrates responsive behavior and panel visibility.

### Acceptance Criteria
- [ ] Create `src/components/ResponsiveLayout.vue` file
- [ ] Use useResponsive composable for breakpoint detection
- [ ] Use useTabNavigation composable for tab state
- [ ] Render TabNavigation component
- [ ] Render ContentPanel component
- [ ] Render PreviewPanel component (conditionally on desktop)
- [ ] Apply stacked layout for mobile/tablet
- [ ] Apply side-by-side layout for desktop
- [ ] Handle panel visibility transitions
- [ ] Make both panels independently scrollable
- [ ] Style with Tailwind CSS

### Dependencies
- Task 1 (useResponsive composable)
- Task 2 (useTabNavigation composable)
- Task 4 (TabNavigation component)
- Task 5 (ContentPanel component)
- Task 8 (PreviewPanel component)

---

## Task 10: Update HomeView to Use ResponsiveLayout

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 1 hour

### Description
Integrate the new ResponsiveLayout component into the existing HomeView.

### Acceptance Criteria
- [ ] Import ResponsiveLayout component in HomeView.vue
- [ ] Replace existing layout with ResponsiveLayout
- [ ] Remove old tab switching logic if present
- [ ] Ensure routing still works correctly
- [ ] Test on all breakpoints
- [ ] Verify preview updates work

### Dependencies
- Task 9 (ResponsiveLayout component)

---

## Task 11: Create Utility Functions

**Status:** pending  
**Priority:** medium  
**Estimated Effort:** 1 hour

### Description
Create utility functions for debouncing and other common operations.

### Acceptance Criteria
- [ ] Create `src/utils/helpers.ts` file (if not exists)
- [ ] Implement debounce function with TypeScript generics
- [ ] Implement calculateBreakpoint function
- [ ] Implement calculatePreviewScale function
- [ ] Add JSDoc comments with preconditions/postconditions
- [ ] Export all utility functions
- [ ] Add unit tests for each function

### Dependencies
- None

### Technical Notes
```typescript
function debounce<T extends (...args: any[]) => any>(
  func: T,
  wait: number
): (...args: Parameters<T>) => void

function calculateBreakpoint(width: number): 'mobile' | 'tablet' | 'desktop'

function calculatePreviewScale(
  containerWidth: number,
  containerHeight: number,
  previewWidth?: number,
  previewHeight?: number
): number
```

---

## Task 12: Add Template Thumbnails

**Status:** pending  
**Priority:** medium  
**Estimated Effort:** 2 hours

### Description
Create or source thumbnail images for all resume templates.

### Acceptance Criteria
- [ ] Create thumbnail images for 6 templates (Classic, Modern, Minimal, Bold, Elegant, Compact)
- [ ] Optimize images for web (< 50KB each)
- [ ] Store in `public/templates/` directory
- [ ] Use consistent dimensions (e.g., 300x400px)
- [ ] Add alt text for accessibility
- [ ] Consider using placeholder images initially

### Dependencies
- None

### Technical Notes
- Can use screenshot tool to capture template previews
- Consider using SVG for smaller file sizes
- Ensure images are responsive

---

## Task 13: Configure Tailwind CSS Breakpoints

**Status:** pending  
**Priority:** medium  
**Estimated Effort:** 0.5 hours

### Description
Configure Tailwind CSS with custom breakpoints matching the design requirements.

### Acceptance Criteria
- [ ] Update `tailwind.config.js` with custom breakpoints
- [ ] Add mobile breakpoint (max: 767px)
- [ ] Add tablet breakpoint (min: 768px, max: 1023px)
- [ ] Add desktop breakpoint (min: 1024px)
- [ ] Test breakpoints in browser DevTools
- [ ] Document breakpoint usage in code comments

### Dependencies
- None

### Technical Notes
```javascript
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      screens: {
        'mobile': { 'max': '767px' },
        'tablet': { 'min': '768px', 'max': '1023px' },
        'desktop': { 'min': '1024px' }
      }
    }
  }
}
```

---

## Task 14: Write Unit Tests for Composables

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 3 hours

### Description
Write comprehensive unit tests for useResponsive and useTabNavigation composables.

### Acceptance Criteria
- [ ] Create test file `src/composables/__tests__/useResponsive.spec.ts`
- [ ] Test breakpoint calculation for boundary values (767, 768, 1023, 1024)
- [ ] Test layoutMode derivation from breakpoints
- [ ] Test resize event debouncing
- [ ] Test cleanup on unmount
- [ ] Create test file `src/composables/__tests__/useTabNavigation.spec.ts`
- [ ] Test initial tab state
- [ ] Test tab switching updates activeTab
- [ ] Test previousTab tracking
- [ ] Test tab history accumulation
- [ ] Achieve > 85% code coverage

### Dependencies
- Task 1 (useResponsive composable)
- Task 2 (useTabNavigation composable)
- Vitest and Vue Test Utils installed

---

## Task 15: Write Unit Tests for Utility Functions

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 2 hours

### Description
Write unit tests for utility functions including debounce, calculateBreakpoint, and calculatePreviewScale.

### Acceptance Criteria
- [ ] Create test file `src/utils/__tests__/helpers.spec.ts`
- [ ] Test debounce function with various wait times
- [ ] Test calculateBreakpoint with edge cases
- [ ] Test calculatePreviewScale with various container sizes
- [ ] Test scale bounds (min 0.1, max 2.0)
- [ ] Test aspect ratio preservation
- [ ] Achieve > 90% code coverage

### Dependencies
- Task 11 (utility functions)
- Vitest installed

---

## Task 16: Write Component Tests

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 4 hours

### Description
Write unit tests for TabNavigation, ContentPanel, and other components.

### Acceptance Criteria
- [ ] Create test file for TabNavigation component
- [ ] Test tab button rendering
- [ ] Test active tab styling
- [ ] Test click event emission
- [ ] Test keyboard navigation
- [ ] Test ARIA attributes
- [ ] Create test file for ContentPanel component
- [ ] Test dynamic component rendering
- [ ] Test transition animations
- [ ] Create test file for DesignTab component
- [ ] Test template grid rendering
- [ ] Test template selection
- [ ] Achieve > 80% component coverage

### Dependencies
- Task 4, 5, 7 (components)
- Vue Test Utils installed

---

## Task 17: Write E2E Tests

**Status:** pending  
**Priority:** medium  
**Estimated Effort:** 4 hours

### Description
Write end-to-end tests for critical user flows using Playwright.

### Acceptance Criteria
- [ ] Set up Playwright if not already configured
- [ ] Write test: Responsive layout flow (desktop → tablet → mobile)
- [ ] Write test: Tab navigation flow (Edit → Design → Edit)
- [ ] Write test: Template selection flow
- [ ] Write test: Preview scaling on resize
- [ ] Write test: State persistence in localStorage
- [ ] All tests pass on CI/CD pipeline

### Dependencies
- All component tasks completed
- Playwright installed

### Technical Notes
```typescript
// Example E2E test structure
test('responsive layout adapts to screen size', async ({ page }) => {
  await page.goto('/')
  await page.setViewportSize({ width: 1920, height: 1080 })
  // Assert side-by-side layout
  await page.setViewportSize({ width: 768, height: 1024 })
  // Assert stacked layout
})
```

---

## Task 18: Accessibility Audit and Fixes

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 2 hours

### Description
Conduct accessibility audit and fix any violations to meet WCAG 2.1 Level AA standards.

### Acceptance Criteria
- [ ] Run axe DevTools on all pages
- [ ] Fix all critical and serious accessibility violations
- [ ] Ensure all interactive elements have accessible labels
- [ ] Test with keyboard navigation only
- [ ] Test with screen reader (VoiceOver or NVDA)
- [ ] Verify color contrast ratios meet WCAG AA standards
- [ ] Add skip links if needed
- [ ] Document accessibility features

### Dependencies
- All component tasks completed

### Technical Notes
- Use @axe-core/vue for automated testing
- Manual testing required for full compliance

---

## Task 19: Performance Optimization

**Status:** pending  
**Priority:** medium  
**Estimated Effort:** 3 hours

### Description
Optimize performance to meet target metrics (< 2s load, 60fps animations).

### Acceptance Criteria
- [ ] Implement code splitting for template components
- [ ] Lazy load DesignTab component
- [ ] Optimize bundle size (analyze with vite-bundle-visualizer)
- [ ] Implement virtual scrolling for template grid (if > 50 templates)
- [ ] Use CSS transforms for animations (GPU-accelerated)
- [ ] Add will-change CSS property to animated elements
- [ ] Measure and optimize Largest Contentful Paint (LCP)
- [ ] Measure and optimize Cumulative Layout Shift (CLS)
- [ ] Run Lighthouse audit and achieve score > 90

### Dependencies
- All component tasks completed

### Technical Notes
```typescript
// Example code splitting
const DesignTab = defineAsyncComponent(() => import('./components/DesignTab.vue'))
```

---

## Task 20: Browser Compatibility Testing

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 2 hours

### Description
Test application on all supported browsers and fix compatibility issues.

### Acceptance Criteria
- [ ] Test on Chrome 90+ (Windows, macOS, Android)
- [ ] Test on Firefox 88+ (Windows, macOS)
- [ ] Test on Safari 14+ (macOS, iOS)
- [ ] Test on Edge 90+ (Windows)
- [ ] Fix any browser-specific issues
- [ ] Add polyfills if needed
- [ ] Document browser support in README

### Dependencies
- All component tasks completed

### Technical Notes
- Use BrowserStack or similar for cross-browser testing
- Test on real devices when possible

---

## Task 21: Mobile Device Testing

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 2 hours

### Description
Test application on real mobile devices and fix mobile-specific issues.

### Acceptance Criteria
- [ ] Test on iPhone (iOS 14+)
- [ ] Test on Android phone (Android 10+)
- [ ] Test on iPad (iOS 14+)
- [ ] Test on Android tablet
- [ ] Verify touch interactions work correctly
- [ ] Verify tap targets are at least 44x44px
- [ ] Fix any mobile-specific layout issues
- [ ] Test in both portrait and landscape orientations

### Dependencies
- All component tasks completed

---

## Task 22: Documentation

**Status:** pending  
**Priority:** medium  
**Estimated Effort:** 2 hours

### Description
Create comprehensive documentation for the responsive tabs feature.

### Acceptance Criteria
- [ ] Add JSDoc comments to all composables
- [ ] Add JSDoc comments to all utility functions
- [ ] Document component props and emits
- [ ] Create README section explaining responsive behavior
- [ ] Document breakpoint values and layout modes
- [ ] Add code examples for common use cases
- [ ] Document accessibility features
- [ ] Update project README with new features

### Dependencies
- All implementation tasks completed

---

## Task 23: Code Review and Refactoring

**Status:** pending  
**Priority:** medium  
**Estimated Effort:** 2 hours

### Description
Conduct code review and refactor for code quality and maintainability.

### Acceptance Criteria
- [ ] Review all code for TypeScript best practices
- [ ] Ensure consistent naming conventions
- [ ] Remove any console.log statements
- [ ] Check for code duplication and extract common logic
- [ ] Verify error handling is comprehensive
- [ ] Ensure all functions have proper type annotations
- [ ] Run ESLint and fix all warnings
- [ ] Run Prettier to format code consistently

### Dependencies
- All implementation tasks completed

---

## Task 24: Final Integration Testing

**Status:** pending  
**Priority:** high  
**Estimated Effort:** 2 hours

### Description
Perform final integration testing to ensure all features work together correctly.

### Acceptance Criteria
- [ ] Test complete user flow: load app → edit resume → select template → export PDF
- [ ] Test on all breakpoints (mobile, tablet, desktop)
- [ ] Verify state persistence across page refreshes
- [ ] Test error scenarios (localStorage unavailable, invalid template)
- [ ] Verify all acceptance criteria from requirements are met
- [ ] Test with real resume data
- [ ] Verify no console errors or warnings
- [ ] Get stakeholder approval

### Dependencies
- All previous tasks completed

---

## Summary

**Total Tasks:** 24  
**Estimated Total Effort:** 54 hours (approximately 7 working days)

### Task Dependencies Graph

```
Task 1 (useResponsive) ─┬─→ Task 8 (PreviewPanel) ─┐
                        └─→ Task 9 (ResponsiveLayout) ─→ Task 10 (Update HomeView)
                                                        
Task 2 (useTabNavigation) ─→ Task 4 (TabNavigation) ─┘

Task 3 (Design Store) ─→ Task 7 (DesignTab) ─┐
                                              ├─→ Task 5 (ContentPanel) ─┘
Task 6 (EditTab) ─────────────────────────────┘

Task 11 (Utilities) ─→ Task 1, Task 8

Task 12 (Thumbnails) ─→ Task 7

Task 13 (Tailwind Config) ─→ All component tasks

Tasks 14-17 (Testing) ─→ Depend on implementation tasks

Tasks 18-21 (QA) ─→ Depend on all implementation tasks

Tasks 22-24 (Documentation & Final) ─→ Depend on all previous tasks
```

### Recommended Implementation Order

**Phase 1: Foundation (Tasks 1-3, 11, 13)**
1. Task 13: Configure Tailwind CSS Breakpoints
2. Task 11: Create Utility Functions
3. Task 1: Create useResponsive Composable
4. Task 2: Create useTabNavigation Composable
5. Task 3: Create Pinia Design Store

**Phase 2: Components (Tasks 4-9)**
6. Task 4: Create TabNavigation Component
7. Task 6: Create EditTab Component
8. Task 12: Add Template Thumbnails
9. Task 7: Create DesignTab Component
10. Task 5: Create ContentPanel Component
11. Task 8: Create PreviewPanel Component
12. Task 9: Create ResponsiveLayout Component

**Phase 3: Integration (Task 10)**
13. Task 10: Update HomeView to Use ResponsiveLayout

**Phase 4: Testing (Tasks 14-17)**
14. Task 14: Write Unit Tests for Composables
15. Task 15: Write Unit Tests for Utility Functions
16. Task 16: Write Component Tests
17. Task 17: Write E2E Tests

**Phase 5: Quality Assurance (Tasks 18-21)**
18. Task 18: Accessibility Audit and Fixes
19. Task 19: Performance Optimization
20. Task 20: Browser Compatibility Testing
21. Task 21: Mobile Device Testing

**Phase 6: Finalization (Tasks 22-24)**
22. Task 22: Documentation
23. Task 23: Code Review and Refactoring
24. Task 24: Final Integration Testing

---

## Notes

- All tasks should be completed in order within each phase
- Testing tasks can be done in parallel with implementation
- QA tasks should be done after all implementation is complete
- Each task should include a pull request for code review
- Update task status as: pending → in_progress → completed
