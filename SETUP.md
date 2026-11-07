# Setup guide — optional shared quiz publishing

The built-in static quizzes work without a backend. Complete these steps only to enable administrator login and shared imported quizzes.

## 1. Create a Supabase project
In Project Settings → API, copy the project URL and anon/public key.

## 2. Create the administrator
In Authentication → Users, create an account with a strong password. Use the same email in the SQL policies and website configuration.

## 3. Create database and storage policies
Open the Supabase SQL Editor, paste `supabase_setup.sql`, replace every `YOUR_ADMIN_EMAIL` with the administrator's exact email, and run it. If rerunning the setup, remove/recreate the named policies first because policy names must be unique per table.

## 4. Configure the website
In `index.html`, replace `YOUR_SUPABASE_PROJECT_URL`, `YOUR_SUPABASE_ANON_KEY`, and `YOUR_ADMIN_EMAIL`. The anon key is intended for browser use; never use a service-role key.

## 5. Deploy and verify
Deploy the full folder, keeping `quizzes/` beside `index.html`. Test in a private window that visitors can see published quizzes but cannot import them. Sign in as administrator, import a test HTML quiz, then confirm it opens on another device. Remove the test afterward.

## Security notes
- Storage files are private and opened using time-limited signed URLs.
- Database row-level security and storage policies restrict write/delete operations to the configured admin email.
- Imported HTML is active browser content. Import only files you trust and inspect; opening an imported quiz runs its code in the browser.
- Configure Supabase Auth and review policies for your deployment before accepting uploads from real users.
