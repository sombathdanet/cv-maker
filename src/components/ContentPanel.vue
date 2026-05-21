<template>
  <div class="content-panel">
    <Transition name="fade" mode="out-in">
      <component :is="currentComponent" :key="activeTab" />
    </Transition>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import EditTab from './EditTab.vue'
import DesignTab from './DesignTab.vue'

interface Props {
  activeTab: 'edit' | 'design'
}

const props = defineProps<Props>()

const currentComponent = computed(() => {
  return props.activeTab === 'edit' ? EditTab : DesignTab
})
</script>

<style scoped>
.content-panel {
  height: 100%;
  overflow-y: auto;
  background: #f9fafb;
}

/* Fade transition */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.2s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
