-- Kolom ACL yang dipakai aplikasi (jalankan di SQL Editor Supabase)
alter table cbt_pack_acl add column if not exists can_manage_passwords boolean default false;
alter table cbt_pack_acl add column if not exists can_grant boolean default false;
alter table cbt_pack_acl add column if not exists can_rename boolean default false;
alter table cbt_pack_acl add column if not exists can_edit_items boolean default false;
alter table cbt_pack_acl add column if not exists can_manage_participants boolean default false;
alter table cbt_pack_acl add column if not exists can_delete boolean default false;

-- Refresh schema cache PostgREST (kadang perlu reload dashboard / tunggu beberapa detik)
notify pgrst, 'reload schema';
