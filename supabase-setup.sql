create table if not exists public.user_state (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.user_state enable row level security;

drop policy if exists "Users read own state" on public.user_state;
create policy "Users read own state"
on public.user_state for select
to authenticated
using (auth.uid() = user_id);

drop policy if exists "Users insert own state" on public.user_state;
create policy "Users insert own state"
on public.user_state for insert
to authenticated
with check (auth.uid() = user_id);

drop policy if exists "Users update own state" on public.user_state;
create policy "Users update own state"
on public.user_state for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

drop policy if exists "Users delete own state" on public.user_state;
create policy "Users delete own state"
on public.user_state for delete
to authenticated
using (auth.uid() = user_id);

grant select, insert, update, delete on table public.user_state to authenticated;
