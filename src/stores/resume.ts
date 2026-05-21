import { defineStore } from 'pinia'
import { ref } from 'vue'

export interface Education {
  id: string
  school: string
  degree: string
  field: string
  startDate: string
  endDate: string
  description: string
}

export interface Experience {
  id: string
  company: string
  position: string
  location: string
  startDate: string
  endDate: string
  current: boolean
  description: string
}

export interface Skill {
  id: string
  name: string
  level: string
  description?: string
}

export interface Language {
  id: string
  name: string
  level: string
}

export interface ResumeData {
  personalInfo: {
    fullName: string
    email: string
    phone: string
    location: string
    title: string
    summary: string
    linkedin: string
    website: string
    photo: string // Base64 encoded photo
    // Extended personal data
    gender?: string
    dateOfBirth?: string
    placeOfBirth?: string
    nationality?: string
    maritalStatus?: string
    height?: string
    weight?: string
    applyFor?: string
  }
  education: Education[]
  experience: Experience[]
  hardSkills: Skill[]
  softSkills: Skill[]
  languages: Language[]
}

export const useResumeStore = defineStore('resume', () => {
  const resumeData = ref<ResumeData>({
    personalInfo: {
      fullName: '',
      email: '',
      phone: '',
      location: '',
      title: '',
      summary: '',
      linkedin: '',
      website: '',
      photo: ''
    },
    education: [],
    experience: [],
    hardSkills: [],
    softSkills: [],
    languages: []
  })

  const addEducation = () => {
    resumeData.value.education.push({
      id: Date.now().toString(),
      school: '',
      degree: '',
      field: '',
      startDate: '',
      endDate: '',
      description: ''
    })
  }

  const removeEducation = (id: string) => {
    resumeData.value.education = resumeData.value.education.filter(e => e.id !== id)
  }

  const addExperience = () => {
    resumeData.value.experience.push({
      id: Date.now().toString(),
      company: '',
      position: '',
      location: '',
      startDate: '',
      endDate: '',
      current: false,
      description: ''
    })
  }

  const removeExperience = (id: string) => {
    resumeData.value.experience = resumeData.value.experience.filter(e => e.id !== id)
  }

  const addHardSkill = () => {
    resumeData.value.hardSkills.push({
      id: Date.now().toString(),
      name: '',
      level: 'Intermediate',
      description: ''
    })
  }

  const removeHardSkill = (id: string) => {
    resumeData.value.hardSkills = resumeData.value.hardSkills.filter(s => s.id !== id)
  }

  const addSoftSkill = () => {
    resumeData.value.softSkills.push({
      id: Date.now().toString(),
      name: '',
      level: 'Intermediate',
      description: ''
    })
  }

  const removeSoftSkill = (id: string) => {
    resumeData.value.softSkills = resumeData.value.softSkills.filter(s => s.id !== id)
  }

  const addLanguage = () => {
    resumeData.value.languages.push({
      id: Date.now().toString(),
      name: '',
      level: 'Native'
    })
  }

  const removeLanguage = (id: string) => {
    resumeData.value.languages = resumeData.value.languages.filter(l => l.id !== id)
  }

  return {
    resumeData,
    addEducation,
    removeEducation,
    addExperience,
    removeExperience,
    addHardSkill,
    removeHardSkill,
    addSoftSkill,
    removeSoftSkill,
    addLanguage,
    removeLanguage
  }
})

