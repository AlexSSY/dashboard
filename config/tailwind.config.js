const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*.{erb,rb}',
    './app/helpers/**/*.rb'
  ],
  darkMode: "class",
  theme: {
    extend: {
      fontFamily: {
        sans: ['Roboto', 'sans-serif'],     // Default font stack for body text
        heading: ['Poppins', 'sans-serif'] // Custom font stack for headings
      },
      colors: {
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
