<template>
  <div ref="containerRef" class="preview-panel">
    <div class="preview-wrapper" :style="wrapperStyle">
      <div
        id="resume-preview"
        class="resume-preview"
        :style="previewStyle"
      >
        <ResumePreview />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { useResponsive } from '@/composables/useResponsive'
import { debounce, calculatePreviewScale } from '@/utils/helpers'
import { useDesignStore } from '@/stores/design'
import ResumePreview from './ResumePreview.vue'

const A4_WIDTH = 794
const A4_HEIGHT = 1123

const containerRef = ref<HTMLElement | null>(null)
const scale = ref(1)

const { isMobile } = useResponsive()
const designStore = useDesignStore()

const updateScale = () => {
  if (!containerRef.value) return

  const containerWidth = containerRef.value.clientWidth
  const containerHeight = containerRef.value.clientHeight

  scale.value = calculatePreviewScale(containerWidth, containerHeight, A4_WIDTH, A4_HEIGHT)
}

const debouncedUpdate = debounce(updateScale, 150)

onMounted(() => {
  updateScale()
  if (typeof window !== 'undefined') {
    window.addEventListener('resize', debouncedUpdate)
  }
})

onUnmounted(() => {
  if (typeof window !== 'undefined') {
    window.removeEventListener('resize', debouncedUpdate)
  }
})

const wrapperStyle = computed(() => ({
  width: `${A4_WIDTH * scale.value}px`,
  height: `${A4_HEIGHT * scale.value}px`,
}))

const previewStyle = computed(() => ({
  width: `${A4_WIDTH}px`,
  height: `${A4_HEIGHT}px`,
  transform: `scale(${scale.value})`,
  transformOrigin: 'top left',
  fontFamily: designStore.font,
  '--accent-color': designStore.accentColor,
}))
</script>

<style scoped>
.preview-panel {
  width: 100%;
  height: 100%;
  overflow: auto;
  display: flex;
  justify-content: center;
  align-items: flex-start;
  padding: 2rem 1rem;
  background: #e5e7eb;
}

.preview-wrapper {
  background: white;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.resume-preview {
  background: white;
  overflow: hidden;
}

/* Mobile responsive */
@media (max-width: 767px) {
  .preview-panel {
    padding: 1rem 0.5rem;
  }
}
</style>
