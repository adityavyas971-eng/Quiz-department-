# QUIZ DEPARTMENT — Classroom Quiz Website

A responsive quiz-library website with built-in practice quizzes for Classes 6, 8, 9 and 10, a Class 9 chapter hub, and an optional Supabase-backed administrator import flow. The quizzes use a turn-based classroom format with configurable teams, scores, a timer, and a bell sound.

## Files
- `index.html` — public library, search and filters, admin login/import UI.
- `quizzes/quiz.html` — standalone classroom quiz page used by the built-in library.
- `quizzes/class9-hub.html` — Class 9 chapter links.
- `supabase_setup.sql` and `SETUP.md` — optional shared publishing setup.

## Run locally
Open `index.html` in a browser, or serve this folder from a static web server. The built-in quizzes work without Supabase. Keep the `quizzes` directory beside `index.html` when deploying. The optional local import preview is stored in the current browser only; it is not public or shared.

## Deploy
1. Follow `SETUP.md` if you want administrator login and shared quiz uploads.
2. Deploy the entire folder to a static host such as Netlify, Cloudflare Pages, or Vercel.
3. Test the public library and quiz links from a second browser/device.

Never place a Supabase service-role key in the website. Treat uploaded HTML as trusted content: an HTML quiz can run scripts in the browser tab where it is opened. Review files before importing them.

## Quiz content
The included quizzes are short starter practice sets, not official or comprehensive question banks. Review their content and expand or replace the questions to match your curriculum before classroom use.
