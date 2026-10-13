import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

export default defineConfig({
  site: 'https://www.matthewbrownrigg.com',
  integrations: [sitemap()],
  // Inline the (small) stylesheet so first paint needs no extra request.
  build: { inlineStylesheets: 'always' },
});
