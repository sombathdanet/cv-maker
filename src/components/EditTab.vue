<template>
  <div class="edit-tab bg-white min-h-screen pb-10">
    <!-- Progress bar mock (from screenshot) -->
    <div class="mb-6 px-6 pt-4">
      <div class="flex items-center text-sm mb-2 text-slate-500 font-medium">
        <div class="bg-green-500 text-white text-[10px] font-bold px-1.5 py-0.5 rounded mr-2">85%</div>
        CV completeness
      </div>
      <div class="h-1 bg-slate-200 rounded-full w-full">
        <div class="h-full bg-green-500 rounded-full" style="width: 85%"></div>
      </div>
    </div>

    <!-- Personal Detail Section -->
    <section class="mb-4 mx-6 border rounded-lg border-slate-200 overflow-hidden shadow-sm">
      <div class="flex justify-between items-center px-6 py-4 bg-white cursor-pointer border-b border-slate-200">
        <h2 class="text-[17px] font-bold text-slate-800">Personal Detail</h2>
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-slate-400" viewBox="0 0 20 20" fill="currentColor">
          <path fill-rule="evenodd" d="M14.707 12.707a1 1 0 01-1.414 0L10 9.414l-3.293 3.293a1 1 0 01-1.414-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 010 1.414z" clip-rule="evenodd" />
        </svg>
      </div>
      
      <div class="p-6 bg-white">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6">
          <!-- Left Column -->
          <div class="space-y-6">
            <div class="form-field">
              <label class="block text-[13px] text-slate-500 mb-1.5">Job Title</label>
              <input type="text" v-model="resumeStore.resumeData.personalInfo.title" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
            <div class="form-field">
              <label class="block text-[13px] text-slate-500 mb-1.5">First Name & Surname (Full Name)</label>
              <input type="text" v-model="resumeStore.resumeData.personalInfo.fullName" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
            <div class="form-field">
              <label class="block text-[13px] text-slate-500 mb-1.5">Email</label>
              <input type="email" v-model="resumeStore.resumeData.personalInfo.email" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
            <div class="form-field">
              <label class="block text-[13px] text-slate-500 mb-1.5">LinkedIn URL</label>
              <input type="url" v-model="resumeStore.resumeData.personalInfo.linkedin" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
            <div class="form-field">
              <label class="block text-[13px] text-slate-500 mb-1.5">City, County (Location)</label>
              <input type="text" v-model="resumeStore.resumeData.personalInfo.location" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
          </div>

          <!-- Right Column -->
          <div class="space-y-6">
            <div class="flex items-start mb-6">
              <div class="w-[72px] h-[72px] bg-blue-50 rounded overflow-hidden mr-4 flex-shrink-0 relative group border border-slate-200">
                <img v-if="photoUrl" :src="photoUrl" class="w-full h-full object-cover" />
                <div v-else class="w-full h-full flex items-center justify-center text-blue-500">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-blue-400" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd" />
                  </svg>
                </div>
              </div>
              <div class="flex flex-col justify-center space-y-2 py-2">
                <label for="photo-upload" class="text-[14px] text-blue-500 hover:text-blue-600 flex items-center cursor-pointer font-medium">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                  </svg>
                  Edit photo
                </label>
                <input id="photo-upload" type="file" accept="image/*" class="hidden" @change="handlePhotoUpload" />
                
                <button v-if="photoUrl" @click="removePhoto" class="text-[14px] text-slate-500 hover:text-red-500 flex items-center">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                  </svg>
                  Delete
                </button>
              </div>
            </div>
            
            <div class="form-field mt-[1.3rem]">
              <label class="block text-[13px] text-slate-500 mb-1.5">Website</label>
              <input type="url" v-model="resumeStore.resumeData.personalInfo.website" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
            <div class="form-field">
              <label class="block text-[13px] text-slate-500 mb-1.5">Phone</label>
              <input type="tel" v-model="resumeStore.resumeData.personalInfo.phone" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
          </div>
        </div>
        
        <div class="mt-6">
          <button @click="showExtendedDetails = !showExtendedDetails" class="text-blue-500 text-[14px] font-medium flex items-center cursor-pointer hover:text-blue-600 inline-flex">
            {{ showExtendedDetails ? 'Hide' : 'Add more' }} details
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 ml-1 transition-transform" :class="{ 'rotate-180': showExtendedDetails }" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
            </svg>
          </button>
        </div>

        <!-- Extended Personal Details (Collapsible) -->
        <div v-if="showExtendedDetails" class="mt-6 pt-6 border-t border-slate-200">
          <h3 class="text-[15px] font-semibold text-slate-700 mb-4">Additional Personal Information</h3>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6">
            <div class="form-field">
              <label class="block text-[13px] text-slate-500 mb-1.5">Apply For</label>
              <input type="text" v-model="resumeStore.resumeData.personalInfo.applyFor" placeholder="e.g., Dealer Gaming" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
            <div class="form-field">
              <label class="block text-[13px] text-slate-500 mb-1.5">Gender</label>
              <select v-model="resumeStore.resumeData.personalInfo.gender" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none">
                <option value="">Select...</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
              </select>
            </div>
            <div class="form-field">
              <label class="block text-[13px] text-slate-500 mb-1.5">Date of Birth</label>
              <input type="date" v-model="resumeStore.resumeData.personalInfo.dateOfBirth" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
            <div class="form-field">
              <label class="block text-[13px] text-slate-500 mb-1.5">Place of Birth</label>
              <input type="text" v-model="resumeStore.resumeData.personalInfo.placeOfBirth" placeholder="e.g., Krek Commune, Ponhea Krek District" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
            <div class="form-field">
              <label class="block text-[13px] text-slate-500 mb-1.5">Nationality</label>
              <input type="text" v-model="resumeStore.resumeData.personalInfo.nationality" placeholder="e.g., Cambodia" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
            <div class="form-field">
              <label class="block text-[13px] text-slate-500 mb-1.5">Marital Status</label>
              <select v-model="resumeStore.resumeData.personalInfo.maritalStatus" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none">
                <option value="">Select...</option>
                <option value="Single">Single</option>
                <option value="Married">Married</option>
                <option value="Divorced">Divorced</option>
                <option value="Widowed">Widowed</option>
              </select>
            </div>
            <div class="form-field">
              <label class="block text-[13px] text-slate-500 mb-1.5">Height</label>
              <input type="text" v-model="resumeStore.resumeData.personalInfo.height" placeholder="e.g., 1.60 m" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
            <div class="form-field">
              <label class="block text-[13px] text-slate-500 mb-1.5">Weight</label>
              <input type="text" v-model="resumeStore.resumeData.personalInfo.weight" placeholder="e.g., 50 kg" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Professional Summary Section -->
    <section class="mb-4 mx-6 border rounded-lg border-slate-200 overflow-hidden shadow-sm">
      <div class="flex justify-between items-center px-6 py-4 bg-white cursor-pointer border-b border-slate-200">
        <div>
          <h2 class="text-[17px] font-bold text-slate-800">Professional Summary</h2>
          <p class="text-[13px] text-slate-400 mt-1">Write 2-4 short, energetic sentences about how great you are. Mention the role and what you did. What were the big achievements? Describe your motivation and list your skills.</p>
        </div>
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-slate-400 flex-shrink-0 ml-4" viewBox="0 0 20 20" fill="currentColor">
          <path fill-rule="evenodd" d="M14.707 12.707a1 1 0 01-1.414 0L10 9.414l-3.293 3.293a1 1 0 01-1.414-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 010 1.414z" clip-rule="evenodd" />
        </svg>
      </div>
      <div class="p-6 bg-white">
        <!-- Rich text toolbar mock -->
        <div class="border border-slate-200 rounded-t-md bg-[#f9fafb] p-2 flex items-center gap-1 border-b border-slate-200">
           <button class="p-1 hover:bg-slate-200 rounded text-slate-700 font-bold w-7 h-7 flex items-center justify-center text-[15px] font-serif">B</button>
           <button class="p-1 hover:bg-slate-200 rounded text-slate-700 italic w-7 h-7 flex items-center justify-center text-[15px] font-serif">I</button>
           <button class="p-1 hover:bg-slate-200 rounded text-slate-700 underline w-7 h-7 flex items-center justify-center text-[15px] font-serif">U</button>
           <button class="p-1 hover:bg-slate-200 rounded text-slate-700 line-through w-7 h-7 flex items-center justify-center text-[15px] font-serif">S</button>
           <div class="w-px h-4 bg-slate-300 mx-2"></div>
           <button class="p-1 hover:bg-slate-200 rounded text-slate-700 w-7 h-7 flex items-center justify-center text-[15px]">
             <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" /></svg>
           </button>
           <button class="p-1 hover:bg-slate-200 rounded text-slate-700 w-7 h-7 flex items-center justify-center text-[15px]">
             <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1" /></svg>
           </button>
           <div class="w-px h-4 bg-slate-300 mx-2"></div>
           <button class="p-1 hover:bg-slate-200 rounded text-slate-700 font-bold w-7 h-7 flex items-center justify-center text-[15px]">A</button>
           <div class="flex-grow"></div>
           <button class="text-blue-600 text-[13px] font-medium flex items-center gap-1.5 hover:bg-blue-50 px-3 py-1.5 rounded-full bg-white border border-blue-200">
             <svg xmlns="http://www.w3.org/2000/svg" class="h-3.5 w-3.5" viewBox="0 0 20 20" fill="currentColor"><path fill-rule="evenodd" d="M11.3 1.046A1 1 0 0112 2v5h4a1 1 0 01.82 1.573l-7 10A1 1 0 018 18v-5H4a1 1 0 01-.82-1.573l7-10a1 1 0 011.12-.38z" clip-rule="evenodd" /></svg>
             Get help with writing
           </button>
        </div>
        <textarea v-model="resumeStore.resumeData.personalInfo.summary" class="w-full bg-[#f3f4f6] border-none rounded-b-md px-4 py-4 text-[15px] text-slate-800 min-h-[160px] focus:ring-2 focus:ring-blue-500 outline-none resize-y"></textarea>
      </div>
    </section>

    <!-- Work Experience Section -->
    <section class="mb-4 mx-6 border rounded-lg border-slate-200 overflow-hidden shadow-sm">
      <div class="flex justify-between items-center px-6 py-4 bg-white cursor-pointer border-b border-slate-200">
        <h2 class="text-[17px] font-bold text-slate-800">Employment History</h2>
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-slate-400" viewBox="0 0 20 20" fill="currentColor">
          <path fill-rule="evenodd" d="M14.707 12.707a1 1 0 01-1.414 0L10 9.414l-3.293 3.293a1 1 0 01-1.414-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 010 1.414z" clip-rule="evenodd" />
        </svg>
      </div>
      <div class="p-6 bg-white space-y-6">
        <div v-for="(exp, index) in resumeStore.resumeData.experience" :key="exp.id" class="border border-slate-200 rounded-lg p-5 group relative shadow-sm">
          <div class="absolute top-4 right-4 hidden group-hover:flex gap-2">
            <button @click="resumeStore.removeExperience(exp.id)" class="text-slate-400 hover:text-red-500">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" /></svg>
            </button>
          </div>
          
          <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6 mb-4">
            <div>
              <label class="block text-[13px] text-slate-500 mb-1.5">Job Title</label>
              <input type="text" v-model="exp.position" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
            <div>
              <label class="block text-[13px] text-slate-500 mb-1.5">Employer</label>
              <input type="text" v-model="exp.company" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
            <div>
               <div class="grid grid-cols-2 gap-4">
                 <div>
                   <label class="block text-[13px] text-slate-500 mb-1.5">Start Date</label>
                   <input type="month" v-model="exp.startDate" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
                 </div>
                 <div>
                   <label class="block text-[13px] text-slate-500 mb-1.5">End Date</label>
                   <input type="month" v-model="exp.endDate" :disabled="exp.current" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none disabled:opacity-50" />
                 </div>
               </div>
               <div class="mt-3 flex items-center">
                 <input type="checkbox" v-model="exp.current" class="mr-2 h-4 w-4 rounded border-slate-300 text-blue-500 focus:ring-blue-500" />
                 <span class="text-[14px] text-slate-600">I currently work here</span>
               </div>
            </div>
            <div>
              <label class="block text-[13px] text-slate-500 mb-1.5">City</label>
              <input type="text" v-model="exp.location" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
          </div>
          <div class="mt-6">
            <label class="block text-[13px] text-slate-500 mb-1.5">Description</label>
            <textarea v-model="exp.description" rows="4" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none resize-y"></textarea>
          </div>
        </div>
        
        <button @click="resumeStore.addExperience" class="text-blue-500 hover:text-blue-600 font-medium text-[14px] flex items-center">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" /></svg>
          Add employment
        </button>
      </div>
    </section>

    <!-- Education Section -->
    <section class="mb-4 mx-6 border rounded-lg border-slate-200 overflow-hidden shadow-sm">
      <div class="flex justify-between items-center px-6 py-4 bg-white cursor-pointer border-b border-slate-200">
        <h2 class="text-[17px] font-bold text-slate-800">Education</h2>
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-slate-400" viewBox="0 0 20 20" fill="currentColor">
          <path fill-rule="evenodd" d="M14.707 12.707a1 1 0 01-1.414 0L10 9.414l-3.293 3.293a1 1 0 01-1.414-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 010 1.414z" clip-rule="evenodd" />
        </svg>
      </div>
      <div class="p-6 bg-white space-y-6">
        <div v-for="(edu, index) in resumeStore.resumeData.education" :key="edu.id" class="border border-slate-200 rounded-lg p-5 group relative shadow-sm">
          <div class="absolute top-4 right-4 hidden group-hover:flex gap-2">
            <button @click="resumeStore.removeEducation(edu.id)" class="text-slate-400 hover:text-red-500">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" /></svg>
            </button>
          </div>
          
          <div class="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-6 mb-4">
            <div>
              <label class="block text-[13px] text-slate-500 mb-1.5">School</label>
              <input type="text" v-model="edu.school" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
            <div>
              <label class="block text-[13px] text-slate-500 mb-1.5">Degree</label>
              <input type="text" v-model="edu.degree" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
            <div>
               <div class="grid grid-cols-2 gap-4">
                 <div>
                   <label class="block text-[13px] text-slate-500 mb-1.5">Start Date</label>
                   <input type="month" v-model="edu.startDate" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
                 </div>
                 <div>
                   <label class="block text-[13px] text-slate-500 mb-1.5">End Date</label>
                   <input type="month" v-model="edu.endDate" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
                 </div>
               </div>
            </div>
            <div>
              <label class="block text-[13px] text-slate-500 mb-1.5">Field of Study</label>
              <input type="text" v-model="edu.field" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
          </div>
          <div class="mt-6">
            <label class="block text-[13px] text-slate-500 mb-1.5">Description</label>
            <textarea v-model="edu.description" rows="2" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none resize-y"></textarea>
          </div>
        </div>
        
        <button @click="resumeStore.addEducation" class="text-blue-500 hover:text-blue-600 font-medium text-[14px] flex items-center">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" /></svg>
          Add education
        </button>
      </div>
    </section>

    <!-- Hard Skills Section -->
    <section class="mb-4 mx-6 border rounded-lg border-slate-200 overflow-hidden shadow-sm">
      <div class="flex justify-between items-center px-6 py-4 bg-white cursor-pointer border-b border-slate-200">
        <div>
           <h2 class="text-[17px] font-bold text-slate-800">Hard Skills</h2>
           <p class="text-[13px] text-slate-400 mt-1">Technical skills and knowledge directly related to the job.</p>
        </div>
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-slate-400 flex-shrink-0 ml-4" viewBox="0 0 20 20" fill="currentColor">
          <path fill-rule="evenodd" d="M14.707 12.707a1 1 0 01-1.414 0L10 9.414l-3.293 3.293a1 1 0 01-1.414-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 010 1.414z" clip-rule="evenodd" />
        </svg>
      </div>
      <div class="p-6 bg-white space-y-4">
        <div v-for="skill in resumeStore.resumeData.hardSkills" :key="skill.id" class="border border-slate-200 rounded-lg p-5 relative shadow-sm">
          <div class="absolute top-4 right-4 flex gap-2">
            <button @click="resumeStore.removeHardSkill(skill.id)" class="text-slate-400 hover:text-red-500">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" /></svg>
            </button>
          </div>
          
          <div class="flex flex-col gap-4">
            <div class="flex gap-4 items-start w-full pr-8">
              <div class="flex-grow">
                <input type="text" v-model="skill.name" placeholder="Skill name" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
              </div>
              <div class="w-48">
                 <select v-model="skill.level" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none appearance-none">
                   <option>Beginner</option>
                   <option>Intermediate</option>
                   <option>Advanced</option>
                   <option>Expert</option>
                 </select>
              </div>
            </div>
            
            <div class="w-full">
              <textarea v-model="skill.description" placeholder="Description (e.g., * Fluent in tool X...)" rows="2" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none resize-y"></textarea>
            </div>
          </div>
        </div>
        
        <button @click="resumeStore.addHardSkill" class="text-blue-500 hover:text-blue-600 font-medium text-[14px] flex items-center pt-2">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" /></svg>
          Add hard skill
        </button>
      </div>
    </section>

    <!-- Soft Skills Section -->
    <section class="mb-4 mx-6 border rounded-lg border-slate-200 overflow-hidden shadow-sm">
      <div class="flex justify-between items-center px-6 py-4 bg-white cursor-pointer border-b border-slate-200">
        <div>
           <h2 class="text-[17px] font-bold text-slate-800">Soft Skills</h2>
           <p class="text-[13px] text-slate-400 mt-1">Interpersonal skills like communication, leadership, etc.</p>
        </div>
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-slate-400 flex-shrink-0 ml-4" viewBox="0 0 20 20" fill="currentColor">
          <path fill-rule="evenodd" d="M14.707 12.707a1 1 0 01-1.414 0L10 9.414l-3.293 3.293a1 1 0 01-1.414-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 010 1.414z" clip-rule="evenodd" />
        </svg>
      </div>
      <div class="p-6 bg-white space-y-4">
        <div v-for="skill in resumeStore.resumeData.softSkills" :key="skill.id" class="border border-slate-200 rounded-lg p-5 relative shadow-sm">
          <div class="absolute top-4 right-4 flex gap-2">
            <button @click="resumeStore.removeSoftSkill(skill.id)" class="text-slate-400 hover:text-red-500">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" /></svg>
            </button>
          </div>
          
          <div class="flex flex-col gap-4">
            <div class="flex gap-4 items-start w-full pr-8">
              <div class="flex-grow">
                <input type="text" v-model="skill.name" placeholder="Skill name" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
              </div>
              <div class="w-48">
                 <select v-model="skill.level" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none appearance-none">
                   <option>Beginner</option>
                   <option>Intermediate</option>
                   <option>Advanced</option>
                   <option>Expert</option>
                 </select>
              </div>
            </div>
            
            <div class="w-full">
              <textarea v-model="skill.description" placeholder="Description (e.g., * Demonstrated leadership by...)" rows="2" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none resize-y"></textarea>
            </div>
          </div>
        </div>
        
        <button @click="resumeStore.addSoftSkill" class="text-blue-500 hover:text-blue-600 font-medium text-[14px] flex items-center pt-2">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" /></svg>
          Add soft skill
        </button>
      </div>
    </section>

    <!-- Languages Section -->
    <section class="mb-4 mx-6 border rounded-lg border-slate-200 overflow-hidden shadow-sm">
      <div class="flex justify-between items-center px-6 py-4 bg-white cursor-pointer border-b border-slate-200">
        <div>
           <h2 class="text-[17px] font-bold text-slate-800">Languages</h2>
           <p class="text-[13px] text-slate-400 mt-1">List languages you speak and your proficiency level.</p>
        </div>
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-slate-400 flex-shrink-0 ml-4" viewBox="0 0 20 20" fill="currentColor">
          <path fill-rule="evenodd" d="M14.707 12.707a1 1 0 01-1.414 0L10 9.414l-3.293 3.293a1 1 0 01-1.414-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 010 1.414z" clip-rule="evenodd" />
        </svg>
      </div>
      <div class="p-6 bg-white space-y-4">
        <div v-for="lang in resumeStore.resumeData.languages" :key="lang.id" class="border border-slate-200 rounded-lg p-5 relative shadow-sm">
          <div class="absolute top-4 right-4 flex gap-2">
            <button @click="resumeStore.removeLanguage(lang.id)" class="text-slate-400 hover:text-red-500">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" /></svg>
            </button>
          </div>
          
          <div class="flex gap-4 items-start w-full pr-8">
            <div class="flex-grow">
              <input type="text" v-model="lang.name" placeholder="Language (e.g., English)" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
            <div class="w-48">
              <input type="text" v-model="lang.level" placeholder="Level (e.g., Native, or (Good,Write,Read))" class="w-full bg-[#f3f4f6] hover:bg-[#e5e7eb] transition-colors border-none rounded-md px-4 py-3 text-[15px] text-slate-800 focus:ring-2 focus:ring-blue-500 outline-none" />
            </div>
          </div>
        </div>
        
        <button @click="resumeStore.addLanguage" class="text-blue-500 hover:text-blue-600 font-medium text-[14px] flex items-center pt-2">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" /></svg>
          Add language
        </button>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, watch } from 'vue'
import { useResumeStore } from '@/stores/resume'

const resumeStore = useResumeStore()
const photoUrl = ref<string>('')
const showExtendedDetails = ref(false)

// Load photo from store on mount
onMounted(() => {
  if (resumeStore.resumeData.personalInfo.photo) {
    photoUrl.value = resumeStore.resumeData.personalInfo.photo
  }
  
  // Auto-expand extended details if any field has data
  const p = resumeStore.resumeData.personalInfo
  if (p.applyFor || p.gender || p.dateOfBirth || p.placeOfBirth || 
      p.nationality || p.maritalStatus || p.height || p.weight) {
    showExtendedDetails.value = true
  }
})

// Watch for photo changes and sync to store
watch(photoUrl, (newPhoto) => {
  resumeStore.resumeData.personalInfo.photo = newPhoto
})

const handlePhotoUpload = (event: Event) => {
  const target = event.target as HTMLInputElement
  const file = target.files?.[0]
  
  if (!file) return
  
  // Check file size (max 2MB)
  if (file.size > 2 * 1024 * 1024) {
    alert('File size must be less than 2MB')
    return
  }
  
  // Check file type
  if (!file.type.startsWith('image/')) {
    alert('Please upload an image file')
    return
  }
  
  // Read file and convert to base64
  const reader = new FileReader()
  reader.onload = (e) => {
    photoUrl.value = e.target?.result as string
  }
  reader.readAsDataURL(file)
}

const removePhoto = () => {
  photoUrl.value = ''
  const input = document.getElementById('photo-upload') as HTMLInputElement
  if (input) {
    input.value = ''
  }
}
</script>
