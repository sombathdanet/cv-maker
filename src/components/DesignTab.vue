<template>
  <div class="design-tab">
    <h2 class="section-title">Choose a Template</h2>
    <p class="section-description">Select a professional template for your resume</p>

    <div class="template-grid">
      <div
        v-for="template in templates"
        :key="template.id"
        :class="['template-card', { selected: selectedTemplate === template.id }]"
        @click="selectTemplate(template.id)"
      >
        <div class="template-thumbnail">
          <div :class="['template-preview', `preview-${template.id}`]">
            <div class="preview-header"></div>
            <div class="preview-content">
              <div class="preview-line"></div>
              <div class="preview-line short"></div>
              <div class="preview-line"></div>
            </div>
          </div>
        </div>
        <div class="template-info">
          <h3 class="template-name">{{ template.name }}</h3>
          <p class="template-description">{{ template.description }}</p>
        </div>
        <div v-if="selectedTemplate === template.id" class="selected-badge">
          ✓ Selected
        </div>
      </div>
    </div>

    <!-- Color Picker Section -->
    <div class="color-section">
      <h3 class="subsection-title">Accent Color</h3>
      <div class="color-swatches">
        <div
          v-for="color in accentColors"
          :key="color"
          :class="['color-swatch', { active: designStore.accentColor === color }]"
          :style="{ backgroundColor: color }"
          @click="designStore.setAccentColor(color)"
        >
          <span v-if="designStore.accentColor === color" class="check-icon">✓</span>
        </div>
      </div>
    </div>

    <!-- Font Picker Section -->
    <div class="font-section">
      <h3 class="subsection-title">Font Family</h3>
      <select v-model="selectedFont" class="font-select" @change="changeFont">
        <option value="Inter">Inter</option>
        <option value="Roboto">Roboto</option>
        <option value="Merriweather">Merriweather</option>
        <option value="Playfair Display">Playfair Display</option>
        <option value="Lato">Lato</option>
      </select>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, watch } from 'vue'
import { useDesignStore, availableTemplates } from '@/stores/design'

const designStore = useDesignStore()

const templates = availableTemplates

const selectedTemplate = computed(() => designStore.template)
const selectedFont = ref(designStore.font)

const accentColors = [
  '#1a1a2e',
  '#16213e',
  '#0f3460',
  '#e94560',
  '#2b2d42',
  '#457b9d',
  '#2d6a4f',
  '#b5838d'
]

const selectTemplate = (templateId: string) => {
  designStore.setTemplate(templateId)
}

const changeFont = () => {
  designStore.setFont(selectedFont.value)
  
  // Load Google Font dynamically
  const fontLink = document.getElementById('google-font-link') as HTMLLinkElement
  if (fontLink) {
    fontLink.href = `https://fonts.googleapis.com/css2?family=${selectedFont.value.replace(/ /g, '+')}:wght@400;600;700&display=swap`
  } else {
    const link = document.createElement('link')
    link.id = 'google-font-link'
    link.rel = 'stylesheet'
    link.href = `https://fonts.googleapis.com/css2?family=${selectedFont.value.replace(/ /g, '+')}:wght@400;600;700&display=swap`
    document.head.appendChild(link)
  }
}

// Load initial font
watch(() => designStore.font, (newFont) => {
  selectedFont.value = newFont
}, { immediate: true })
</script>

<style scoped>
.design-tab {
  padding: 1.5rem;
  max-width: 900px;
}

.section-title {
  font-size: 1.5rem;
  font-weight: 600;
  color: #1f2937;
  margin: 0 0 0.5rem 0;
}

.section-description {
  color: #6b7280;
  margin: 0 0 1.5rem 0;
}

.template-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 1.5rem;
  margin-bottom: 2rem;
}

.template-card {
  background: white;
  border: 2px solid #e5e7eb;
  border-radius: 8px;
  padding: 1rem;
  cursor: pointer;
  transition: all 0.2s ease;
  position: relative;
}

.template-card:hover {
  border-color: #3b82f6;
  box-shadow: 0 4px 12px rgba(59, 130, 246, 0.15);
  transform: translateY(-2px);
}

.template-card.selected {
  border-color: #3b82f6;
  background: #eff6ff;
}

.template-thumbnail {
  width: 100%;
  aspect-ratio: 3/4;
  background: #f9fafb;
  border-radius: 4px;
  overflow: hidden;
  margin-bottom: 0.75rem;
}

.template-preview {
  width: 100%;
  height: 100%;
  padding: 0.75rem;
}

.preview-header {
  height: 20%;
  background: #d1d5db;
  border-radius: 2px;
  margin-bottom: 0.5rem;
}

.preview-content {
  display: flex;
  flex-direction: column;
  gap: 0.25rem;
}

.preview-line {
  height: 0.5rem;
  background: #e5e7eb;
  border-radius: 2px;
}

.preview-line.short {
  width: 60%;
}

.preview-classic .preview-header {
  background: #1a1a2e;
}

.preview-modern .preview-header {
  background: #457b9d;
}

.preview-minimal .preview-header {
  background: #2b2d42;
}

.template-info {
  text-align: center;
}

.template-name {
  font-size: 1rem;
  font-weight: 600;
  color: #1f2937;
  margin: 0 0 0.25rem 0;
}

.template-description {
  font-size: 0.75rem;
  color: #6b7280;
  margin: 0;
}

.selected-badge {
  position: absolute;
  top: 0.5rem;
  right: 0.5rem;
  background: #3b82f6;
  color: white;
  padding: 0.25rem 0.5rem;
  border-radius: 4px;
  font-size: 0.75rem;
  font-weight: 600;
}

.color-section,
.font-section {
  margin-bottom: 2rem;
  padding: 1.5rem;
  background: white;
  border-radius: 8px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.subsection-title {
  font-size: 1rem;
  font-weight: 600;
  color: #1f2937;
  margin: 0 0 1rem 0;
}

.color-swatches {
  display: flex;
  gap: 0.75rem;
  flex-wrap: wrap;
}

.color-swatch {
  width: 3rem;
  height: 3rem;
  border-radius: 50%;
  cursor: pointer;
  border: 3px solid transparent;
  transition: all 0.2s ease;
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  font-weight: bold;
}

.color-swatch:hover {
  transform: scale(1.1);
}

.color-swatch.active {
  border-color: #1f2937;
  box-shadow: 0 0 0 2px white, 0 0 0 4px #1f2937;
}

.check-icon {
  font-size: 1.25rem;
}

.font-select {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #d1d5db;
  border-radius: 4px;
  font-size: 1rem;
  background: white;
  cursor: pointer;
}

.font-select:focus {
  outline: none;
  border-color: #3b82f6;
  ring: 2px;
  ring-color: #3b82f6;
}

/* Mobile responsive */
@media (max-width: 767px) {
  .design-tab {
    padding: 1rem;
  }

  .template-grid {
    grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
    gap: 1rem;
  }

  .color-swatches {
    gap: 0.5rem;
  }

  .color-swatch {
    width: 2.5rem;
    height: 2.5rem;
  }
}
</style>
