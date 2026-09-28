-- Buat admin utama di database (ganti HASH setelah generate)
-- Password di-hash SHA-256 hex di browser; contoh untuk password "adminSH2026":
-- Di console browser: 
-- crypto.subtle.digest('SHA-256', new TextEncoder().encode('adminSH2026')).then(b=>console.log([...new Uint8Array(b)].map(x=>x.toString(16).padStart(2,'0')).join('')))

-- insert into cbt_admins (username, password_hash, display_name, role, active)
-- values ('main', '<HASH_SHA256_HEX>', 'Admin Utama', 'main', true)
-- on conflict (username) do update set password_hash = excluded.password_hash, active = true;
