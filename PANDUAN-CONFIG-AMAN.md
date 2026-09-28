# Konfigurasi aman (tanpa password di GitHub)

## Prinsip
- **Anon key Supabase memang untuk client** — aman dipublikasikan *jika* RLS database dikunci.
- **Jangan** taruh di GitHub: password admin, password kelas, service_role key, Gemini key.
- Gemini key → Edge Function secrets (`GEMINI_API_KEY`).
- Password admin → tabel `cbt_admins` (hash) atau secret terpisah.

## Deploy function `app-config`
```bash
supabase functions deploy app-config --no-verify-jwt
```

Opsional secrets:
- `APP_EXAM_TITLE` = Silverhawk CBT
- `APP_PRODUCT_ID` = cbt
- `APP_SCHOOL_NAME` = SMA PMA

Aplikasi memanggil:
`https://edaujcxmncoslykyddwf.supabase.co/functions/v1/app-config`

Setelah function hidup, **hapus** `config.json` dari repo GitHub (atau kosongkan password di dalamnya).

## RLS (penting)
Pastikan tabel sensitif tidak bisa dibaca/tulis sembarangan hanya dengan anon key.
Admin operasi memakai policy yang sesuai.

## Cadangan
Jika edge belum siap, `config.json` lokal masih dibaca sebagai fallback — jangan isi password di file itu bila repo publik.
