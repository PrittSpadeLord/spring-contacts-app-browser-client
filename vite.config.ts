import { defineConfig } from 'rolldown-vite'
import vue from '@vitejs/plugin-vue'
import htmlMinifier  from 'vite-plugin-html-minifier'

export default defineConfig({
    plugins: [
        vue(),
        htmlMinifier()
    ],
    build: {
        outDir: 'dist',
        sourcemap: false
    }
})

//stuff related to code splitting and lazy loading here