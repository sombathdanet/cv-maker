<template>
  <div :class="['responsive-layout', layoutMode, 'bg-[#f8f9fa]']">
    <!-- Header -->
    <header class="app-header h-16 flex items-center justify-between px-6 bg-white border-b border-slate-200 sticky top-0 z-10">
      <div class="flex items-center text-[14px] text-slate-600 font-medium">
        <div class="flex items-center gap-2 cursor-pointer hover:bg-slate-50 px-2 py-1 rounded">
          <span class="text-lg leading-none">🇰🇭</span>
          <span>Cambodia</span>
        </div>
        <span class="mx-3 text-slate-300">|</span>
        <div class="flex items-center gap-2 cursor-pointer hover:bg-slate-50 px-2 py-1 rounded">
          <span class="text-lg leading-none">🇬🇧</span>
          <span>English (UK)</span>
        </div>
      </div>
      
      <div class="header-actions flex items-center gap-4">
        <!-- Render TabNavigation here for desktop, or keep it responsive -->
        <TabNavigation
          v-model="activeTab"
          :tabs="tabs"
        />
        
        <button class="preview-toggle-btn desktop:hidden" @click="togglePreview">
          {{ showPreview ? 'Edit' : 'Preview' }}
        </button>
      </div>
    </header>

    <!-- Main Content Area -->
    <div class="main-content flex flex-1 overflow-hidden">
      <!-- Left Panel: Editor -->
      <div v-show="!showPreview || isDesktop" class="editor-panel flex-1 bg-white border-r border-slate-200 overflow-y-auto">
        <div class="max-w-4xl mx-auto py-8">
          <ContentPanel :active-tab="activeTab" />
        </div>
      </div>

      <!-- Right Panel: Preview -->
      <div v-show="showPreview || isDesktop" class="preview-panel-container flex-1 bg-slate-600 overflow-y-auto relative">
        <div class="preview-header sticky top-0 z-10 flex justify-between items-center p-3 bg-slate-800 text-white shadow-md">
          <div class="text-sm font-medium px-4">Live Preview</div>
          <button class="export-btn flex items-center gap-2 bg-blue-500 hover:bg-blue-600 text-white px-4 py-1.5 rounded text-sm font-medium transition-colors" @click="handleExport" :disabled="exporting">
            <svg v-if="!exporting" xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" /></svg>
            <span v-if="exporting">Exporting...</span>
            <span v-else>Download PDF</span>
          </button>
        </div>
        <div class="p-8 flex justify-center min-h-full">
          <PreviewPanel class="shadow-2xl" />
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import html2canvas from 'html2canvas'
import jsPDF from 'jspdf'
import { useResponsive } from '@/composables/useResponsive'
import { useTabNavigation } from '@/composables/useTabNavigation'
import TabNavigation from './TabNavigation.vue'
import ContentPanel from './ContentPanel.vue'
import PreviewPanel from './PreviewPanel.vue'

const { layoutMode, isDesktop } = useResponsive()
const { activeTab } = useTabNavigation('edit')

const tabs = [
  { id: 'edit' as const, label: 'Edit' },
  { id: 'design' as const, label: 'Design' }
]

const showPreview = ref(false)
const exporting = ref(false)

const togglePreview = () => {
  showPreview.value = !showPreview.value
}

const handleExport = async () => {
  if (exporting.value) return
  exporting.value = true
  
  try {
    const element = document.getElementById('resume-preview')
    if (!element) {
      throw new Error('Preview element not found')
    }

    const canvas = await html2canvas(element, {
      scale: 2, // High resolution
      useCORS: true, // Allow loading external images like profile photo
      backgroundColor: '#ffffff',
      onclone: (clonedDoc) => {
        const clonedElement = clonedDoc.getElementById('resume-preview')
        if (clonedElement) {
          // Remove the CSS transform scale so we capture it at its true 794x1123 size
          clonedElement.style.transform = 'none'
          clonedElement.style.width = '794px'
          clonedElement.style.height = '1123px'
        }
      }
    })

    const imgData = canvas.toDataURL('image/jpeg', 1.0)
    
    // A4 size in mm is 210 x 297
    const pdf = new jsPDF({
      orientation: 'portrait',
      unit: 'mm',
      format: 'a4'
    })
    
    pdf.addImage(imgData, 'JPEG', 0, 0, 210, 297)
    pdf.save('My_Resume.pdf')
    
  } catch (error) {
    console.error('Error generating PDF:', error)
    alert('Failed to generate PDF. Please try again.')
  } finally {
    exporting.value = false
  }
}
</script>

<style scoped>
.responsive-layout {
  display: flex;
  flex-direction: column;
  height: 100vh;
}

/* Stacked layout (mobile/tablet) */
.responsive-layout.stacked .main-content {
  flex-direction: column;
}

.responsive-layout.stacked .editor-panel {
  width: 100%;
  height: 100%;
}

.responsive-layout.stacked .preview-panel-container {
  width: 100%;
  height: 100%;
  background: #475569; /* slate-600 */
}

/* Side-by-side layout (desktop) */
.responsive-layout.side-by-side .main-content {
  flex-direction: row;
}

.responsive-layout.side-by-side .editor-panel {
  flex: 1.1; /* slightly wider editor */
  min-width: 500px;
}

.responsive-layout.side-by-side .preview-panel-container {
  flex: 0.9;
}

.preview-toggle-btn {
  padding: 0.5rem 1rem;
  background: #6b7280;
  color: white;
  border: none;
  border-radius: 6px;
  font-size: 0.875rem;
  font-weight: 500;
  cursor: pointer;
  transition: background 0.2s;
}

.preview-toggle-btn:hover {
  background: #4b5563;
}

/* Hide preview toggle on desktop */
@media (min-width: 1024px) {
  .preview-toggle-btn {
    display: none;
  }
}

/* Mobile adjustments */
@media (max-width: 767px) {
  .app-header {
    padding: 0.75rem 1rem;
    flex-direction: column;
    height: auto;
    gap: 1rem;
  }
}
</style>
