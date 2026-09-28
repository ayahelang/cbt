-- =============================================
-- SEED ADMIN UTAMA Silverhawk CBT
-- Password plain: adminSH2026
-- Hash = SHA-256 hex (sama algoritma di aplikasi)
-- =============================================

alter table cbt_admins add column if not exists password_hash text;
alter table cbt_admins add column if not exists display_name text;
alter table cbt_admins add column if not exists role text default 'secondary';
alter table cbt_admins add column if not exists active boolean default true;

-- Pastikan username unik
create unique index if not exists cbt_admins_username_uidx on cbt_admins (username);

-- Upsert admin utama
insert into cbt_admins (username, password_hash, display_name, role, active)
values (
  'main',
  '0a422ccee82267e40ebed631d0eba0e6f596cca31b22d5874ea635bd7a6b2057',
  'Admin Utama',
  'main',
  true
)
on conflict (username) do update set
  password_hash = excluded.password_hash,
  display_name = excluded.display_name,
  role = 'main',
  active = true;

-- Cek hasil
select username, role, active, left(password_hash, 12) as hash_prefix
from cbt_admins
where username = 'main';
