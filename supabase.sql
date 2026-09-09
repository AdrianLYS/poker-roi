create extension if not exists pgcrypto;
create table if not exists public.poker_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  date date not null,
  type text not null check (type in ('Tournament','Cash')),
  currency text not null default 'TWD',
  name text not null,
  series text default '',
  location text default '',
  start_time time,
  end_time time,
  buyin numeric(14,2) not null default 0,
  cashout numeric(14,2) not null default 0,
  note text default '',
  created_at timestamptz not null default now()
);
alter table public.poker_sessions enable row level security;
drop policy if exists "Users can view own poker sessions" on public.poker_sessions;
create policy "Users can view own poker sessions" on public.poker_sessions for select using (auth.uid() = user_id);
drop policy if exists "Users can insert own poker sessions" on public.poker_sessions;
create policy "Users can insert own poker sessions" on public.poker_sessions for insert with check (auth.uid() = user_id);
drop policy if exists "Users can delete own poker sessions" on public.poker_sessions;
create policy "Users can delete own poker sessions" on public.poker_sessions for delete using (auth.uid() = user_id);
create index if not exists poker_sessions_user_date_idx on public.poker_sessions (user_id, date desc);
