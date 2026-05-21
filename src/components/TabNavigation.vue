<template>
  <div class="tab-navigation" role="tablist">
    <div class="flex items-center bg-white border border-slate-200 rounded-full p-1 shadow-sm">
      <button
        v-for="tab in tabs"
        :key="tab.id"
        :class="[
          'relative px-6 py-1.5 text-sm font-medium rounded-full transition-all duration-200',
          modelValue === tab.id
            ? 'bg-white text-slate-800 shadow-[0_1px_3px_rgba(0,0,0,0.1)]'
            : 'text-slate-500 hover:text-slate-700'
        ]"
        :aria-selected="modelValue === tab.id"
        :tabindex="modelValue === tab.id ? 0 : -1"
        role="tab"
        @click="handleTabClick(tab.id)"
        @keydown="handleKeyDown"
      >
        <span v-if="tab.icon" class="mr-2">{{ tab.icon }}</span>
        <span>{{ tab.label }}</span>
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
/**
 * Tab interface
 */
export interface Tab {
  id: 'edit' | 'design'
  label: string
  icon?: string
}

/**
 * Component props
 */
interface Props {
  tabs: Tab[]
  modelValue: 'edit' | 'design'
}

/**
 * Component emits
 */
interface Emits {
  (e: 'update:modelValue', value: 'edit' | 'design'): void
}

const props = defineProps<Props>()
const emit = defineEmits<Emits>()

/**
 * Handle tab click event
 */
const handleTabClick = (tabId: 'edit' | 'design') => {
  emit('update:modelValue', tabId)
}

/**
 * Handle keyboard navigation
 */
const handleKeyDown = (event: KeyboardEvent) => {
  const currentIndex = props.tabs.findIndex(tab => tab.id === props.modelValue)
  
  if (event.key === 'ArrowRight') {
    event.preventDefault()
    const nextIndex = (currentIndex + 1) % props.tabs.length
    emit('update:modelValue', props.tabs[nextIndex].id)
  } else if (event.key === 'ArrowLeft') {
    event.preventDefault()
    const prevIndex = (currentIndex - 1 + props.tabs.length) % props.tabs.length
    emit('update:modelValue', props.tabs[prevIndex].id)
  } else if (event.key === 'Enter' || event.key === ' ') {
    event.preventDefault()
    // Already on the focused tab, no action needed
  }
}
</script>
