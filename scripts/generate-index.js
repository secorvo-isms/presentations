#!/usr/bin/env node
// Reads presentations/*/slides.md, extracts title from frontmatter,
// writes dist/index.html with links to each presentation.

import { readFileSync, writeFileSync, mkdirSync, readdirSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const root = join(__dirname, '..');
const presentationsDir = join(root, 'presentations');
const distDir = join(root, 'dist');

function extractTitle(content) {
  const match = content.match(/^---\s*\n([\s\S]*?)\n---/);
  if (!match) return null;
  const frontmatter = match[1];
  const titleMatch = frontmatter.match(/^title:\s*["']?(.+?)["']?\s*$/m);
  return titleMatch ? titleMatch[1] : null;
}

const presentations = readdirSync(presentationsDir, { withFileTypes: true })
  .filter(d => d.isDirectory())
  .map(d => {
    const slidesPath = join(presentationsDir, d.name, 'slides.md');
    let title = d.name;
    try {
      const content = readFileSync(slidesPath, 'utf8');
      title = extractTitle(content) ?? d.name;
    } catch {
      // slides.md not found – use directory name
    }
    return { name: d.name, title };
  });

const links = presentations
  .map(p => `    <li><a href="/presentations/${p.name}/">${p.title}</a></li>`)
  .join('\n');

const html = `<!DOCTYPE html>
<html lang="de">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Präsentationen</title>
  <style>
    body { font-family: system-ui, sans-serif; max-width: 640px; margin: 4rem auto; padding: 0 1rem; color: #e2e8f0; background: #0f172a; }
    h1 { font-size: 1.75rem; margin-bottom: 2rem; color: #f8fafc; }
    ul { list-style: none; padding: 0; display: flex; flex-direction: column; gap: 0.75rem; }
    li a { display: block; padding: 1rem 1.25rem; background: #1e293b; border-radius: 8px; color: #93c5fd; text-decoration: none; border: 1px solid #334155; transition: border-color 0.15s; }
    li a:hover { border-color: #60a5fa; }
  </style>
</head>
<body>
  <h1>Präsentationen</h1>
  <ul>
${links}
  </ul>
</body>
</html>
`;

mkdirSync(distDir, { recursive: true });
writeFileSync(join(distDir, 'index.html'), html, 'utf8');
console.log(`index.html generated with ${presentations.length} presentation(s).`);
