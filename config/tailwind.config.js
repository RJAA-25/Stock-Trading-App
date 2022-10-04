const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,html}",
    "./app/views/**/**/*.{erb,html}",
  ],
  theme: {
    extend: {
      // fontFamily: {
      //   sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      // },
    },
  },
  daisyui: {
    themes: [
      {
        eluderTheme: {
          "primary": "#44403c",
          "secondary": "#a8a29e",
          "accent": "#7dd3fc",
          "neutral": "#1c1917",
          "base-100": "#f3f4f6",
          "info": "#cbd5e1",
          "success": "#86efac",
          "warning": "#fde047",
          "error": "#fca5a5",
        },
      },
    ],
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("daisyui"),
  ],
};
