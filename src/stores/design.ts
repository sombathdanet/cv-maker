import { defineStore } from 'pinia'
import { ref, watch } from 'vue'

/**
 * Design state interface
 */
export interface DesignState {
  template: string
  accentColor: string
  font: string
  fontSize: number
  lineHeight: number
  margins: {
    top: number
    right: number
    bottom: number
    left: number
  }
}

/**
 * Template definition interface
 */
export interface TemplateDefinition {
  id: string
  name: string
  description: string
  thumbnail: string
  category: 'classic' | 'modern' | 'creative'
  isPremium: boolean
  componentName: string
  defaultColors: {
    primary: string
    secondary: string
    accent: string
  }
  supportedSections: string[]
}

/**
 * Available resume templates
 */
export const availableTemplates: TemplateDefinition[] = [
  {
    id: 'classic',
    name: 'Classic',
    description: 'Traditional single-column layout with serif fonts',
    thumbnail: '/templates/classic-thumb.png',
    category: 'classic',
    isPremium: false,
    componentName: 'TemplateClassic',
    defaultColors: {
      primary: '#1a1a2e',
      secondary: '#16213e',
      accent: '#0f3460'
    },
    supportedSections: ['personal', 'experience', 'education', 'skills', 'languages', 'certifications']
  },
  {
    id: 'modern',
    name: 'Modern',
    description: 'Two-column layout with sidebar and accent colors',
    thumbnail: '/templates/modern-thumb.png',
    category: 'modern',
    isPremium: false,
    componentName: 'TemplateModern',
    defaultColors: {
      primary: '#457b9d',
      secondary: '#1d3557',
      accent: '#e63946'
    },
    supportedSections: ['personal', 'experience', 'education', 'skills', 'languages', 'certifications']
  },
  {
    id: 'minimal',
    name: 'Minimal',
    description: 'Clean lines with lots of whitespace',
    thumbnail: '/templates/minimal-thumb.png',
    category: 'modern',
    isPremium: false,
    componentName: 'TemplateMinimal',
    defaultColors: {
      primary: '#2b2d42',
      secondary: '#8d99ae',
      accent: '#ef233c'
    },
    supportedSections: ['personal', 'experience', 'education', 'skills']
  }
]

const STORAGE_KEY = 'resume_design_state'

/**
 * Load design state from localStorage
 */
function loadFromStorage(): Partial<DesignState> | null {
  try {
    const saved = localStorage.getItem(STORAGE_KEY)
    return saved ? JSON.parse(saved) : null
  } catch (error) {
    console.warn('Failed to load design state from localStorage:', error)
    return null
  }
}

/**
 * Save design state to localStorage
 */
function saveToStorage(state: DesignState): void {
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(state))
  } catch (error) {
    console.warn('Failed to save design state to localStorage:', error)
    // Show warning banner to user (implement in UI)
  }
}

/**
 * Pinia store for design configuration
 */
export const useDesignStore = defineStore('design', () => {
  // Load saved state or use defaults
  const saved = loadFromStorage()

  // State
  const template = ref(saved?.template ?? 'modern')
  const accentColor = ref(saved?.accentColor ?? '#0f3460')
  const font = ref(saved?.font ?? 'Inter')
  const fontSize = ref(saved?.fontSize ?? 12)
  const lineHeight = ref(saved?.lineHeight ?? 1.5)
  const margins = ref(saved?.margins ?? {
    top: 20,
    right: 20,
    bottom: 20,
    left: 20
  })

  // Actions
  function setTemplate(templateId: string) {
    // Validate template exists
    const templateDef = availableTemplates.find(t => t.id === templateId)
    if (!templateDef) {
      console.error(`Template ${templateId} not found`)
      return
    }

    template.value = templateId

    // Optionally apply template default colors
    if (templateDef.defaultColors) {
      accentColor.value = templateDef.defaultColors.primary
    }
  }

  function setAccentColor(color: string) {
    // Validate hex color format
    if (!/^#[0-9A-F]{6}$/i.test(color)) {
      console.error(`Invalid hex color: ${color}`)
      return
    }
    accentColor.value = color
  }

  function setFont(fontFamily: string) {
    font.value = fontFamily
  }

  function setFontSize(size: number) {
    // Validate font size range
    if (size < 8 || size > 16) {
      console.error(`Font size must be between 8 and 16px`)
      return
    }
    fontSize.value = size
  }

  function setLineHeight(height: number) {
    // Validate line height range
    if (height < 1.0 || height > 2.0) {
      console.error(`Line height must be between 1.0 and 2.0`)
      return
    }
    lineHeight.value = height
  }

  function setMargins(newMargins: Partial<DesignState['margins']>) {
    margins.value = { ...margins.value, ...newMargins }
  }

  // Watch for changes and save to localStorage (debounced)
  let saveTimer: ReturnType<typeof setTimeout> | null = null
  watch(
    [template, accentColor, font, fontSize, lineHeight, margins],
    () => {
      if (saveTimer) {
        clearTimeout(saveTimer)
      }
      saveTimer = setTimeout(() => {
        saveToStorage({
          template: template.value,
          accentColor: accentColor.value,
          font: font.value,
          fontSize: fontSize.value,
          lineHeight: lineHeight.value,
          margins: margins.value
        })
      }, 500)
    },
    { deep: true }
  )

  return {
    // State
    template,
    accentColor,
    font,
    fontSize,
    lineHeight,
    margins,
    // Actions
    setTemplate,
    setAccentColor,
    setFont,
    setFontSize,
    setLineHeight,
    setMargins
  }
})
