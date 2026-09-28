# Error Gemini 403 PERMISSION_DENIED

Pesan:
`Your project has been denied access. Please contact support. PERMISSION_DENIED`

Ini **bukan bug aplikasi / Edge Function**. Google menolak project atau API key.

## Perbaiki di Google AI Studio

1. Buka https://aistudio.google.com/apikey
2. **Buat API key baru** (disarankan project Google Cloud yang bersih)
3. Pastikan **Generative Language API** aktif:
   https://console.cloud.google.com/apis/library/generativelanguage.googleapis.com
4. Di Supabase → Project Settings → Edge Functions → Secrets:
   - Update `GEMINI_API_KEY` = key baru
5. Deploy ulang function (opsional jika kode sudah benar):
   `supabase functions deploy grade-essays --no-verify-jwt`

## Penyebab umum
- Project Google dibatasi / dinonaktifkan
- Key dari project yang tidak punya akses Gemini
- Kuota / billing / kebijakan region
- Key lama sudah dicabut

## Sementara
Admin bisa isi nilai manual di kotak **Nilai** lalu **Simpan** (tanpa AI).
