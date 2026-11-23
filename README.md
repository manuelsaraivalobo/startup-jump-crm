# Startup Jump CRM

A gamified job-hunt CRM. Leads move through To do → Sent → Replied → Meeting → Interviewing → Offer, earning XP that takes you from Pre-seed to IPO. Daily quests, streaks, nudge reminders and a graveyard for dead leads.

Static site (no build step) on Vercel, with Supabase for magic-link login and storage.

## Setup

1. **Supabase**: create a project, run `supabase/schema.sql` in the SQL editor. Under Authentication → URL Configuration, add your Vercel URL as Site URL and Redirect URL.
2. **Config**: put the project URL and anon key in `config.js`.
3. **Vercel**: import this repo, framework preset "Other", no build command, output directory `.`.

Without a configured `config.js` the app still runs and saves to the browser only.
