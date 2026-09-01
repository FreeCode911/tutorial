import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'LykCloud Tutorials',
  description: 'Step-by-step setup guides for SSH, Chrome Remote Desktop, and systemctl fixes.',
  themeConfig: {
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Chrome Remote Desktop', link: '/chrome-remote-desktop' },
      { text: 'SSH', link: '/ssh' },
      { text: 'Systemctl', link: '/systemctl' },
      { text: 'PufferPanel', link: '/pufferpanel' }
    ],

    sidebar: [
      {
        text: 'Guides',
        items: [
          { text: 'Chrome Remote Desktop', link: '/chrome-remote-desktop' },
          { text: 'SSH Setup', link: '/ssh' },
          { text: 'Fixing Systemctl', link: '/systemctl' },
          { text: 'PufferPanel Script', link: '/pufferpanel' }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/FreeCode911/tutorial' }
    ]
  }
})
