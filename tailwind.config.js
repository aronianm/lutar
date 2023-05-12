module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.{js, jsx, vue}',
  
    'node_modules/preline/dist/*.js',
    "./src/**/*.{html,js}",
  ],
  theme: {
    extend: {},
  },
  darkMode: 'class',
  daisyui: {
    themes: ['light'],
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/line-clamp'),
    require("daisyui"),
    require('flowbite/plugin'),
    require('preline/plugin'),
  ]
}
