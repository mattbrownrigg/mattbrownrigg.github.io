import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

/* ──────────────────────────────────────────────────────────────
   PROJECTS COLLECTION
   One markdown file per project in src/content/projects/.
   The frontmatter below is the single source of truth for the
   home "Selected Work" index, the /work gallery, and each
   /work/[slug] case-study page.

   Adding a real screenshot later:
     1. Drop the image in src/media/ (or alongside the .md file).
     2. In `screenshots`, set `src: ../../media/your-shot.png`.
   When `src` is omitted, an on-brand placeholder plate renders.
   ────────────────────────────────────────────────────────────── */

const projects = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/projects' }),
  schema: ({ image }) =>
    z.object({
      /** Full project name (display title on the case study). */
      title: z.string(),
      /** Compact name for tight contexts, e.g. "LOOP". Falls back to title. */
      shortTitle: z.string().optional(),
      /** Catalog order. Drives #01…#0N numbering and list order. */
      order: z.number().int().positive(),
      category: z.string(),
      year: z.number().int(),
      /** One sentence — used on the gallery and the home index hover. */
      blurb: z.string(),
      /** Longer one/two-line summary for the case-study hero. */
      summary: z.string(),
      role: z.string().optional(),
      stack: z.array(z.string()).default([]),
      /** Outbound link to the real paper / repo / live project. */
      link: z
        .object({
          label: z.string(),
          href: z.string(),
        })
        .optional(),
      /** Marks copy/links as draft scaffolding awaiting real content. */
      draft: z.boolean().default(false),
      /** Gallery thumbnail. Deliberately separate from the in-page screenshots. */
      cover: image().optional(),
      /** In-page case-study figures. All render at a fixed 16:10 ratio. */
      screenshots: z
        .array(
          z.object({
            caption: z.string(),
            src: image().optional(),
          }),
        )
        .default([]),
    }),
});

export const collections = { projects };
