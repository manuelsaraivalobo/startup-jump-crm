-- One row per user holding the whole game state (contacts, XP, events, quests).
create table if not exists public.game_state (
  user_id uuid primary key default auth.uid() references auth.users (id) on delete cascade,
  state jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.game_state enable row level security;

create policy "read own state" on public.game_state
  for select to authenticated using ((select auth.uid()) = user_id);
create policy "insert own state" on public.game_state
  for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "update own state" on public.game_state
  for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
