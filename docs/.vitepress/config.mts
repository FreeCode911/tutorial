import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'LykCloud Tutorials',
  description: 'Category-based guides for SSH, remote desktop setup, server fixes, and hosting tools.',
  themeConfig: {
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Tutorials', link: '/tutorials' },
      { text: 'Discord', link: 'https://discord.gg/5qbfgzjx7V' },
      { text: 'GitHub', link: 'https://github.com/FreeCode911' }
    ],

    sidebar: [
      {
        text: 'Start Here',
        items: [
          { text: 'Home', link: '/' },
          { text: 'Tutorial Categories', link: '/tutorials' }
        ]
      }
    ]
  }
})
