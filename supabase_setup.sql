-- Run in Supabase SQL Editor after creating the project.
-- Replace YOUR_ADMIN_EMAIL with the exact administrator email before running.
create table if not exists public.quizzes (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  class_name text not null,
  subject text not null,
  chapter text default '',
  file_path text not null,
  published boolean not null default true,
  created_at timestamptz not null default now()
);
alter table public.quizzes enable row level security;
create policy "Anyone can view published quizzes" on public.quizzes
for select using (published = true);
create policy "Authenticated admin can add quizzes" on public.quizzes
for insert to authenticated with check (auth.jwt()->>'email' = 'YOUR_ADMIN_EMAIL');
create policy "Authenticated admin can delete quizzes" on public.quizzes
for delete to authenticated using (auth.jwt()->>'email' = 'YOUR_ADMIN_EMAIL');

insert into storage.buckets (id,name,public,file_size_limit,allowed_mime_types)
values ('quiz-files','quiz-files',false,10485760,array['text/html'])
on conflict (id) do nothing;
create policy "Public can read quiz files" on storage.objects
for select using (bucket_id = 'quiz-files');
create policy "Admin can upload quiz files" on storage.objects
for insert to authenticated with check (
  bucket_id = 'quiz-files' and auth.jwt()->>'email' = 'YOUR_ADMIN_EMAIL'
);
create policy "Admin can delete quiz files" on storage.objects
for delete to authenticated using (
  bucket_id = 'quiz-files' and auth.jwt()->>'email' = 'YOUR_ADMIN_EMAIL'
);
