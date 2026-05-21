# Resume Builder App — Agent IDE Spec (Vue.js)

## Overview

Build a **single-page resume editor** inspired by resume.io. The app has:
- **Two tabs**: `Edit` (fill in resume content) and `Design` (pick a template/theme)
- A **live preview** of the resume rendered in real time
- An **Export PDF** button that downloads the resume as a PDF

> Stack: **Vue 3 (Composition API) + Vite + Tailwind CSS**. PDF export via `html2pdf.js`.  
> All state lives in memory (+ localStorage) — no backend, no auth.

---

## File Structure

```
/
├── index.html
├── vite.config.js
├── package.json
├── tailwind.config.js
├── src/
│   ├── main.js                     ← createApp(App).mount('#app')
│   ├── App.vue                     ← root layout, tab switcher
│   ├── composables/
│   │   └── useResume.js            ← shared reactive state
│   ├── components/
│   │   ├── EditTab.vue             ← all resume form sections
│   │   ├── DesignTab.vue           ← template + color + font picker
│   │   └── ResumePreview.vue       ← live A4 resume render (export target)
│   ├── templates/
│   │   ├── TemplateClassic.vue
│   │   ├── TemplateModern.vue
│   │   ├── TemplateMinimal.vue
│   │   ├── TemplateBold.vue
│   │   ├── TemplateElegant.vue
│   │   └── TemplateCompact.vue
│   └── utils/
│       └── exportPdf.js            ← html2pdf.js wrapper
```

---

## Layout

```
┌─────────────────────────────────────────────────────────┐
│  HEADER: "Resume Builder"           [⬇ Export PDF]       │
├──────────────┬──────────────────────────────────────────┤
│  LEFT PANEL  │           RIGHT PANEL                    │
│  (400px)     │        (live preview)                    │
│              │                                          │
│ [Edit][Design]│   ┌──────────────────────────────────┐  │
│              │   │                                  │  │
│  Tab content │   │    Resume rendered as A4 card    │  │
│  (scrollable)│   │                                  │  │
│              │   └──────────────────────────────────┘  │
└──────────────┴──────────────────────────────────────────┘
```

- Left panel: fixed width `400px`, scrollable vertically
- Right panel: fills remaining width, centers the resume preview
- Resume preview: fixed `794px × 1123px` (A4 at 96dpi), scaled down with `transform: scale()` to fit panel
- Header is sticky at top
- On screens < 900px: stack vertically (editor top, preview below)

---

## Shared State — `useResume.js` composable

Use Vue 3 `reactive()` and `watch()` for global state shared across all components.

```js
// src/composables/useResume.js
import { reactive, watch } from 'vue'

const LS_KEY = 'resume_builder_state'

function loadFromStorage() {
  try {
    const saved = localStorage.getItem(LS_KEY)
    return saved ? JSON.parse(saved) : null
  } catch { return null }
}

const saved = loadFromStorage()

export const resumeData = reactive(saved?.resumeData ?? {
  personal: {
    fullName: '', jobTitle: '', email: '', phone: '',
    location: '', linkedin: '', website: '', summary: '',
  },
  experience: [
    { id: 1, title: '', company: '', location: '', startDate: '', endDate: '', current: false, description: '' }
  ],
  education: [
    { id: 1, degree: '', school: '', location: '', startDate: '', endDate: '', gpa: '' }
  ],
  skills: [],           // string[]
  languages: [
    { id: 1, language: '', proficiency: 'Fluent' }
  ],
  certifications: [
    { id: 1, name: '', issuer: '', date: '' }
  ],
})

export const design = reactive(saved?.design ?? {
  template: 'modern',   // 'classic' | 'modern' | 'minimal' | 'bold' | 'elegant' | 'compact'
  accentColor: '#0f3460',
  font: 'Inter',
})

// Debounced autosave
let saveTimer = null
watch([resumeData, design], () => {
  clearTimeout(saveTimer)
  saveTimer = setTimeout(() => {
    localStorage.setItem(LS_KEY, JSON.stringify({ resumeData, design }))
  }, 500)
}, { deep: true })
```

> All components import `resumeData` and `design` directly — no prop drilling needed.

---

## Tab: Edit (`EditTab.vue`)

### Pattern
Every field uses `v-model` directly on `resumeData.*`. Reactive updates auto-propagate to the preview.

### Sections (collapsible accordion — open by default)

#### 1. Personal Info
| Field | `v-model` |
|-------|-----------|
| Full Name | `resumeData.personal.fullName` |
| Job Title | `resumeData.personal.jobTitle` |
| Email | `resumeData.personal.email` |
| Phone | `resumeData.personal.phone` |
| Location | `resumeData.personal.location` |
| LinkedIn URL | `resumeData.personal.linkedin` |
| Website | `resumeData.personal.website` |
| Profile Summary | `resumeData.personal.summary` (textarea, 4 rows) |

#### 2. Work Experience *(repeatable)*
```vue
<div v-for="(exp, i) in resumeData.experience" :key="exp.id">
  <!-- fields: title, company, location, startDate, endDate, current (checkbox), description -->
  <button @click="resumeData.experience.splice(i, 1)">Remove</button>
</div>
<button @click="resumeData.experience.push({ id: Date.now(), title: '', ... })">+ Add Experience</button>
```

#### 3. Education *(repeatable)*
Fields: degree, school, location, startDate, endDate, gpa (optional)

#### 4. Skills — tag pill input
```vue
<div>
  <span v-for="(skill, i) in resumeData.skills" :key="i">
    {{ skill }} <button @click="resumeData.skills.splice(i, 1)">×</button>
  </span>
  <input @keydown.enter.prevent="addSkill" v-model="skillInput" placeholder="Type skill + Enter" />
</div>
```

#### 5. Languages *(optional, repeatable)*
Fields: language, proficiency (select: Beginner / Intermediate / Fluent / Native)

#### 6. Certifications *(optional, repeatable)*
Fields: name, issuer, date

---

## Tab: Design (`DesignTab.vue`)

### Template Picker — 2-column grid of 6 cards
```vue
<div
  v-for="tpl in templates"
  :key="tpl.id"
  :class="['tpl-card', { selected: design.template === tpl.id }]"
  @click="design.template = tpl.id"
>
  <div class="tpl-thumb" :style="{ background: tpl.thumbColor }"></div>
  <span>{{ tpl.name }}</span>
</div>
```

| id | name | description |
|----|------|-------------|
| `classic` | Classic | Single column, serif, black/white |
| `modern` | Modern | Two-column sidebar, accent color left |
| `minimal` | Minimal | Clean lines, sans-serif, lots of space |
| `bold` | Bold | Dark header block, strong typography |
| `elegant` | Elegant | Thin lines, italic accents, muted palette |
| `compact` | Compact | Dense layout, fits more content |

### Color Accent Picker
```vue
<div
  v-for="color in accentColors"
  :key="color"
  :style="{ background: color, outline: design.accentColor === color ? '2px solid #000' : 'none' }"
  @click="design.accentColor = color"
/>
```

Swatches: `#1a1a2e #16213e #0f3460 #e94560 #2b2d42 #457b9d #2d6a4f #b5838d`

### Font Picker
```vue
<select v-model="design.font">
  <option>Inter</option>
  <option>Merriweather</option>
  <option>Playfair Display</option>
  <option>Roboto Mono</option>
</select>
```

Load the selected font dynamically:
```js
watch(() => design.font, (font) => {
  const id = 'google-font-link'
  let link = document.getElementById(id) || document.createElement('link')
  link.id = id
  link.rel = 'stylesheet'
  link.href = `https://fonts.googleapis.com/css2?family=${font.replace(/ /g, '+')}:wght@400;600&display=swap`
  document.head.appendChild(link)
}, { immediate: true })
```

---

## Resume Preview (`ResumePreview.vue`)

```vue
<template>
  <div class="preview-wrapper" ref="wrapper">
    <div
      id="resume-preview"
      :style="{
        width: '794px',
        height: '1123px',
        transform: `scale(${scale})`,
        transformOrigin: 'top left',
        fontFamily: design.font,
        '--accent': design.accentColor,
      }"
    >
      <component
        :is="currentTemplate"
        :data="resumeData"
        :accent="design.accentColor"
      />
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { resumeData, design } from '@/composables/useResume'
import TemplateClassic from '@/templates/TemplateClassic.vue'
import TemplateModern  from '@/templates/TemplateModern.vue'
// ... other templates

const templateMap = {
  classic: TemplateClassic,
  modern:  TemplateModern,
  // ...
}

const currentTemplate = computed(() => templateMap[design.template])

const wrapper = ref(null)
const scale   = ref(1)

const updateScale = () => {
  if (wrapper.value) scale.value = wrapper.value.offsetWidth / 794
}

onMounted(() => { updateScale(); window.addEventListener('resize', updateScale) })
onUnmounted(() => window.removeEventListener('resize', updateScale))
</script>
```

---

## Template Components

Each template is a Vue SFC that receives `{ data, accent }` props and renders a styled A4 resume.

### Props (all templates share the same interface)
```js
defineProps({
  data:   Object,  // resumeData
  accent: String,  // hex color string
})
```

### Template rendering rules

| Template | Layout |
|----------|--------|
| `classic` | Single column. Name centered at top. `<hr>` between sections. Serif font. |
| `modern` | Flexbox row. Left sidebar (30%) with accent bg: photo, contact, skills, languages. Right (70%): experience + education. |
| `minimal` | Single column. Name top-left. Thin `border-bottom` on section headers. Lots of whitespace. |
| `bold` | Full-width dark header (`background: accent`) with name + title in white. Sections below in light bg. |
| `elegant` | Name centered in italic. Section headers in accent color with thin underline. Muted tone overall. |
| `compact` | Two columns for experience + education. Smaller base font (10px). Tighter line height (1.4). |

Use `var(--accent)` (CSS variable set on `#resume-preview`) or the `accent` prop directly for colored elements.

---

## Export PDF (`utils/exportPdf.js`)

Install: `npm install html2pdf.js`

```js
// src/utils/exportPdf.js
import html2pdf from 'html2pdf.js'

export function exportToPdf(filename = 'resume') {
  const element = document.getElementById('resume-preview')
  const opt = {
    margin:       0,
    filename:     `${filename}.pdf`,
    image:        { type: 'jpeg', quality: 0.98 },
    html2canvas:  { scale: 2, useCORS: true },
    jsPDF:        { unit: 'px', format: [794, 1123], orientation: 'portrait' },
  }
  return html2pdf().set(opt).from(element).save()
}
```

In `App.vue`:
```vue
<button @click="handleExport" :disabled="exporting">
  <span v-if="exporting">Generating…</span>
  <span v-else>⬇ Export PDF</span>
</button>

<script setup>
import { ref } from 'vue'
import { exportToPdf } from '@/utils/exportPdf'
import { resumeData } from '@/composables/useResume'

const exporting = ref(false)
const handleExport = async () => {
  exporting.value = true
  await exportToPdf(resumeData.personal.fullName || 'resume')
  exporting.value = false
}
</script>
```

---

## Dependencies

```json
{
  "dependencies": {
    "vue": "^3.4.0",
    "html2pdf.js": "^0.10.1"
  },
  "devDependencies": {
    "@vitejs/plugin-vue": "^5.0.0",
    "vite": "^5.0.0",
    "tailwindcss": "^3.4.0",
    "autoprefixer": "^10.4.0",
    "postcss": "^8.4.0"
  }
}
```

`vite.config.js`:
```js
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
export default defineConfig({
  plugins: [vue()],
  resolve: { alias: { '@': '/src' } },
})
```

---

## UX Details

- **Accordion sections**: each Edit section has a header with a `▾` chevron toggle; open by default
- **Empty state**: if a repeatable list is empty, show `"+ Add your first entry"` placeholder
- **Skills input**: pressing `Enter` adds the typed value as a pill; `×` on each pill removes it
- **Current job**: checking "I currently work here" hides the End Date field
- **Preview scale**: `scale = panelWidth / 794`; wrap in a container with `overflow: hidden` and `height: scale * 1123px` to avoid layout bleed
- **Autosave**: debounced 500ms via `watch` in `useResume.js`, persists to localStorage

---

## Acceptance Criteria

- [ ] Two tabs (Edit / Design) switch without losing state
- [ ] All form fields update the live preview in real time via Vue reactivity
- [ ] Template selection swaps the rendered template component immediately
- [ ] Accent color and font changes reflect in the preview immediately
- [ ] Export PDF downloads a properly formatted A4 PDF
- [ ] Skills can be added as tags (Enter key) and removed with ×
- [ ] Repeatable sections support add and remove entries
- [ ] State persists in localStorage across page refreshes
- [ ] Preview scales to fit the right panel at all viewport sizes
- [ ] Export button shows a loading state while generating
