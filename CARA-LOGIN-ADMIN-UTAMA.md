# Login admin utama setelah v2.9

## Kenapa password lama mati?
Versi baru **tidak** menyalin `adminPassword` dari config.json ke database.
Login admin utama mencari baris di tabel **cbt_admins** (username `main`).

## Langkah wajib (sekali)
1. Buka Supabase → **SQL Editor**
2. Jalankan isi file `supabase-seed-main-admin.sql`
3. Pastikan query SELECT menampilkan username = main, role = main, active = true
4. Di web CBT: Ctrl+F5 → login admin dengan password **adminSH2026**

## Ganti password nanti
Update hash di SQL, atau lewat panel admin (reset password) setelah berhasil login.

## config.json
Tidak otomatis masuk DB. Hanya cadangan koneksi / transisi.
Jangan mengandalkan adminPassword di file publik GitHub.
