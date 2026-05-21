# Resume Builder

A modern, professional resume builder application built with Vue.js 3, TypeScript, and Pinia. Create beautiful resumes with a live preview and export them to PDF.

## Features

- ✨ **Live Preview**: See your resume update in real-time as you type
- 📝 **Comprehensive Forms**: Add personal info, work experience, education, and skills
- 📄 **PDF Export**: Download your resume as a high-quality PDF
- 🎨 **Professional Design**: Clean, modern resume template
- 💾 **State Management**: Uses Pinia for efficient data management
- 📱 **Responsive**: Works on desktop and tablet devices

## Technologies Used

- **Vue.js 3** - Progressive JavaScript framework
- **TypeScript** - Type-safe development
- **Pinia** - State management
- **Vue Router** - Navigation
- **jsPDF** - PDF generation
- **html2canvas** - HTML to canvas conversion
- **Vite** - Fast build tool

## Getting Started

### Prerequisites

- Node.js (v16 or higher)
- npm or yarn

### Installation

1. Navigate to the project directory:
```bash
cd resume-builder
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm run dev
```

4. Open your browser and visit: `http://localhost:5173`

## Usage

1. **Personal Information**: Fill in your name, title, contact details, and professional summary
2. **Work Experience**: Add your work history with company, position, dates, and descriptions
3. **Education**: Include your educational background
4. **Skills**: List your skills with proficiency levels
5. **Export**: Click the "Export to PDF" button to download your resume

## Build for Production

```bash
npm run build
```

The built files will be in the `dist` directory.

## Project Structure

```
resume-builder/
├── src/
│   ├── components/
│   │   └── ResumePreview.vue    # Resume preview component
│   ├── stores/
│   │   └── resume.ts            # Pinia store for resume data
│   ├── views/
│   │   └── HomeView.vue         # Main application view
│   ├── router/
│   │   └── index.ts             # Vue Router configuration
│   ├── App.vue                  # Root component
│   └── main.ts                  # Application entry point
├── public/                      # Static assets
└── package.json                 # Dependencies and scripts
```

## Features in Detail

### Personal Information
- Full name
- Professional title
- Email, phone, location
- LinkedIn and website links
- Professional summary

### Work Experience
- Company name
- Position/job title
- Location
- Start and end dates
- "Currently working here" option
- Detailed description

### Education
- School/university name
- Degree type
- Field of study
- Start and end dates
- Additional details

### Skills
- Skill name
- Proficiency level (Beginner, Intermediate, Advanced, Expert)

## Customization

You can customize the resume template by editing:
- `src/components/ResumePreview.vue` - Resume layout and styling
- `src/views/HomeView.vue` - Form layout and fields
- `src/stores/resume.ts` - Data structure

## License

MIT License - feel free to use this project for personal or commercial purposes.

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests.
