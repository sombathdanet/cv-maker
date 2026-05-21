<template>
  <div class="resume-template">
    <!-- Left Column (Dark Blue) -->
    <div class="left-column">
      <div class="profile-header">
        <div class="photo-container" v-if="store.resumeData.personalInfo.photo">
          <img :src="store.resumeData.personalInfo.photo" alt="Profile Photo" class="profile-photo" />
        </div>
        <h1 class="name">{{ store.resumeData.personalInfo.fullName || 'Your Name' }}</h1>
        <div class="divider" v-if="store.resumeData.personalInfo.fullName || store.resumeData.personalInfo.title"></div>
        <p class="title">{{ store.resumeData.personalInfo.title || 'Professional Title' }}</p>
      </div>

      <div class="left-section" v-if="hasContactInfo">
        <h2 class="left-section-title">Personal Detail</h2>
        <div class="contact-details">
          <p v-if="store.resumeData.personalInfo.applyFor">
            <strong>Apply for:</strong><br/>
            {{ store.resumeData.personalInfo.applyFor }}
          </p>
          <p v-if="store.resumeData.personalInfo.location">
            <strong>Current Address:</strong><br/>
            {{ store.resumeData.personalInfo.location }}
          </p>
          <p v-if="store.resumeData.personalInfo.phone" class="contact-link">
            <strong>Tel:</strong> {{ store.resumeData.personalInfo.phone }}
          </p>
          <p v-if="store.resumeData.personalInfo.email" class="contact-link">
            {{ store.resumeData.personalInfo.email }}
          </p>
          <p v-if="store.resumeData.personalInfo.linkedin" class="contact-link">
            {{ store.resumeData.personalInfo.linkedin.replace(/^https?:\/\//, '') }}
          </p>
          <p v-if="store.resumeData.personalInfo.website" class="contact-link">
            {{ store.resumeData.personalInfo.website.replace(/^https?:\/\//, '') }}
          </p>
        </div>
      </div>

      <div class="left-section" v-if="hasExtendedPersonalData">
        <h2 class="left-section-title">PERSONAL DATA</h2>
        <div class="contact-details">
          <p v-if="store.resumeData.personalInfo.fullName">
            <strong>Name:</strong> {{ store.resumeData.personalInfo.fullName }}
          </p>
          <p v-if="store.resumeData.personalInfo.gender">
            <strong>Sex:</strong> {{ store.resumeData.personalInfo.gender }}
          </p>
          <p v-if="store.resumeData.personalInfo.dateOfBirth">
            <strong>Date of birth:</strong> {{ formatFullDate(store.resumeData.personalInfo.dateOfBirth) }}
          </p>
          <p v-if="store.resumeData.personalInfo.placeOfBirth">
            <strong>Place of birth:</strong> {{ store.resumeData.personalInfo.placeOfBirth }}
          </p>
          <p v-if="store.resumeData.personalInfo.nationality">
            <strong>Nationality:</strong> {{ store.resumeData.personalInfo.nationality }}
          </p>
          <p v-if="store.resumeData.personalInfo.maritalStatus">
            <strong>Marital Status:</strong> {{ store.resumeData.personalInfo.maritalStatus }}
          </p>
          <p v-if="store.resumeData.personalInfo.height">
            <strong>Height:</strong> {{ store.resumeData.personalInfo.height }}
          </p>
          <p v-if="store.resumeData.personalInfo.weight">
            <strong>Weight:</strong> {{ store.resumeData.personalInfo.weight }}
          </p>
        </div>
      </div>

      <div class="left-section" v-if="store.resumeData.hardSkills.length > 0">
        <h2 class="left-section-title">Hard Skills</h2>
        <div class="skills-list">
          <div v-for="skill in store.resumeData.hardSkills" :key="skill.id" class="skill-item-container">
            <p class="skill-item font-bold">{{ skill.name }}</p>
            <div class="skill-description" v-if="skill.description" v-html="formatDescription(skill.description)"></div>
          </div>
        </div>
      </div>

      <div class="left-section" v-if="store.resumeData.softSkills.length > 0">
        <h2 class="left-section-title">Soft Skills</h2>
        <div class="skills-list">
          <div v-for="skill in store.resumeData.softSkills" :key="skill.id" class="skill-item-container">
            <p class="skill-item font-bold">{{ skill.name }}</p>
            <div class="skill-description" v-if="skill.description" v-html="formatDescription(skill.description)"></div>
          </div>
        </div>
      </div>

      <div class="left-section" v-if="store.resumeData.languages.length > 0">
        <h2 class="left-section-title">Languages</h2>
        <div class="skills-list">
          <p v-for="lang in store.resumeData.languages" :key="lang.id" class="skill-item">
            {{ lang.name }}<template v-if="lang.level">{{ lang.level.startsWith('(') ? lang.level : `(${lang.level})` }}</template>
          </p>
        </div>
      </div>
    </div>

    <!-- Right Column (White) -->
    <div class="right-column">
      <div class="right-section" v-if="store.resumeData.personalInfo.summary">
        <h2 class="right-section-title">Profile</h2>
        <div class="section-content">
          <div class="summary-text" v-html="formatDescription(store.resumeData.personalInfo.summary)"></div>
        </div>
      </div>

      <div class="right-section" v-if="store.resumeData.experience.length > 0">
        <h2 class="right-section-title">Employment History</h2>
        <div class="experience-list">
          <div v-for="exp in store.resumeData.experience" :key="exp.id" class="experience-item">
            <h3 class="item-title">{{ exp.company || 'Company' }}{{ exp.location ? `, ${exp.location}` : '' }}</h3>
            <div class="item-date">
              {{ formatDate(exp.startDate) }} — {{ exp.current ? 'Present' : formatDate(exp.endDate) }}
            </div>
            <h4 class="item-subtitle" v-if="exp.position">{{ exp.position }}</h4>
            <div class="item-description" v-if="exp.description" v-html="formatDescription(exp.description)"></div>
          </div>
        </div>
      </div>

      <div class="right-section" v-if="store.resumeData.education.length > 0">
        <h2 class="right-section-title">Education</h2>
        <div class="education-list">
          <div v-for="edu in store.resumeData.education" :key="edu.id" class="education-item">
            <h3 class="item-title">{{ edu.degree || 'Degree' }}{{ edu.field ? `, ${edu.field}` : '' }}<span v-if="edu.school">, {{ edu.school }}</span></h3>
            <div class="item-date">
              {{ formatDate(edu.startDate) }} — {{ formatDate(edu.endDate) }}
            </div>
            <div class="item-description" v-if="edu.description" v-html="formatDescription(edu.description)"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useResumeStore } from '@/stores/resume'

const store = useResumeStore()

const hasContactInfo = computed(() => {
  const p = store.resumeData.personalInfo
  return p.email || p.phone || p.location || p.linkedin || p.website || p.applyFor
})

const hasExtendedPersonalData = computed(() => {
  const p = store.resumeData.personalInfo
  return p.gender || p.dateOfBirth || p.placeOfBirth || p.nationality || 
         p.maritalStatus || p.height || p.weight
})

const formatDate = (dateString: string) => {
  if (!dateString) return ''
  const date = new Date(dateString + '-01')
  return date.toLocaleDateString('en-US', { month: 'short', year: 'numeric' })
}

const formatFullDate = (dateString: string) => {
  if (!dateString) return ''
  const date = new Date(dateString)
  return date.toLocaleDateString('en-US', { day: '2-digit', month: '2-digit', year: 'numeric' })
}

// Format description with basic markdown support for bold and bullet lists
const formatDescription = (text: string) => {
  if (!text) return ''
  let formatted = text.replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
  
  const lines = formatted.split('\n')
  let inList = false
  let result = []
  
  for (const line of lines) {
    const trimmed = line.trim()
    if (trimmed.startsWith('- ') || trimmed.startsWith('* ')) {
      if (!inList) {
        result.push('<ul>')
        inList = true
      }
      result.push(`<li>${trimmed.substring(2)}</li>`)
    } else {
      if (inList) {
        result.push('</ul>')
        inList = false
      }
      if (trimmed !== '') {
        result.push(`<p>${trimmed}</p>`)
      }
    }
  }
  if (inList) {
    result.push('</ul>')
  }
  
  return result.join('')
}
</script>

<style scoped>
.resume-template {
  display: flex;
  min-height: 1123px; /* A4 height at 96dpi */
  max-height: 1123px;
  height: 1123px;
  width: 794px; /* A4 width at 96dpi */
  background: white;
  color: #333;
  font-family: Arial, Helvetica, sans-serif;
  line-height: 1.5;
  overflow: hidden;
  position: relative;
}

/* Left Column */
.left-column {
  width: 33%;
  background-color: #1a365d; /* Dark blue background */
  color: white;
  padding: 2rem 1.5rem;
  display: flex;
  flex-direction: column;
  overflow-y: auto;
  overflow-x: hidden;
  /* Custom scrollbar for left column */
  scrollbar-width: thin;
  scrollbar-color: rgba(255, 255, 255, 0.3) transparent;
}

.left-column::-webkit-scrollbar {
  width: 4px;
}

.left-column::-webkit-scrollbar-track {
  background: transparent;
}

.left-column::-webkit-scrollbar-thumb {
  background: rgba(255, 255, 255, 0.3);
  border-radius: 2px;
}

.left-column::-webkit-scrollbar-thumb:hover {
  background: rgba(255, 255, 255, 0.5);
}

.profile-header {
  text-align: center;
  margin-bottom: 1.5rem;
}

.photo-container {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  overflow: hidden;
  margin: 0 auto 1rem auto;
  background-color: rgba(255, 255, 255, 0.1);
}

.profile-photo {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.name {
  font-family: Georgia, 'Times New Roman', Times, serif;
  font-size: 1.5rem;
  font-weight: bold;
  margin: 0 0 0.75rem 0;
  line-height: 1.2;
}

.divider {
  width: 40px;
  height: 1px;
  background-color: rgba(255, 255, 255, 0.4);
  margin: 0 auto 0.75rem auto;
}

.title {
  font-size: 0.7rem;
  text-transform: uppercase;
  letter-spacing: 1px;
  margin: 0;
  color: rgba(255, 255, 255, 0.9);
}

.left-section {
  margin-bottom: 1.5rem;
}

.left-section-title {
  font-family: Georgia, 'Times New Roman', Times, serif;
  font-size: 0.95rem;
  font-weight: bold;
  margin: 0 0 0.75rem 0;
  color: white;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.contact-details p {
  font-size: 0.75rem;
  margin: 0 0 0.6rem 0;
  line-height: 1.4;
  color: rgba(255, 255, 255, 0.9);
  word-wrap: break-word;
}

.contact-details p strong {
  font-weight: 600;
  color: white;
  display: inline-block;
  margin-bottom: 0.1rem;
}

.contact-link {
  text-decoration: underline;
  text-decoration-color: rgba(255, 255, 255, 0.5);
  text-underline-offset: 2px;
}

.skills-list {
  margin-bottom: 1.5rem;
}

.skill-item-container {
  margin-bottom: 1.2rem;
}

.skill-item {
  font-size: 0.9rem;
  margin: 0 0 0.3rem 0;
  color: white;
  line-height: 1.4;
}

.skill-description {
  font-size: 0.8rem;
  color: rgba(255, 255, 255, 0.85);
  line-height: 1.4;
}

.skill-description :deep(ul) {
  margin: 0.3rem 0;
  padding-left: 1.25rem;
  list-style-type: disc;
}

.skill-description :deep(li) {
  margin-bottom: 0.2rem;
}

.skill-description :deep(p) {
  margin: 0 0 0.3rem 0;
}

/* Right Column */
.right-column {
  width: 67%;
  background-color: white;
  padding: 2rem 2rem;
  display: flex;
  flex-direction: column;
  overflow-y: auto;
  overflow-x: hidden;
  /* Custom scrollbar for right column */
  scrollbar-width: thin;
  scrollbar-color: rgba(26, 54, 93, 0.3) transparent;
}

.right-column::-webkit-scrollbar {
  width: 4px;
}

.right-column::-webkit-scrollbar-track {
  background: transparent;
}

.right-column::-webkit-scrollbar-thumb {
  background: rgba(26, 54, 93, 0.3);
  border-radius: 2px;
}

.right-column::-webkit-scrollbar-thumb:hover {
  background: rgba(26, 54, 93, 0.5);
}

.right-section {
  margin-bottom: 1.5rem;
}

.right-section-title {
  font-family: Georgia, 'Times New Roman', Times, serif;
  font-size: 1.2rem;
  font-weight: bold;
  color: #1a1a1a;
  margin: 0 0 0.8rem 0;
}

.summary-text {
  font-size: 0.85rem;
  color: #333;
  line-height: 1.5;
}

.experience-item,
.education-item {
  margin-bottom: 1.2rem;
}

.item-title {
  font-family: Georgia, 'Times New Roman', Times, serif;
  font-size: 1rem;
  font-weight: bold;
  color: #1a1a1a;
  margin: 0 0 0.25rem 0;
}

.item-date {
  font-size: 0.7rem;
  text-transform: uppercase;
  color: #888;
  letter-spacing: 0.5px;
  margin-bottom: 0.4rem;
  font-weight: 500;
}

.item-subtitle {
  font-size: 0.85rem;
  font-weight: bold;
  color: #333;
  margin: 0 0 0.4rem 0;
}

.item-description {
  font-size: 0.85rem;
  color: #333;
  line-height: 1.5;
}

.item-description :deep(ul) {
  margin: 0.3rem 0 0.3rem 0;
  padding-left: 1.25rem;
  list-style-type: disc;
}

.item-description :deep(li) {
  margin-bottom: 0.2rem;
}

.item-description :deep(p) {
  margin: 0 0 0.3rem 0;
}

/* Print layout optimizations */
@media print {
  .resume-template {
    width: 210mm;
    min-height: 297mm;
  }
}
</style>
