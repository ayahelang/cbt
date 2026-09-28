# Gemini Edge Function (update model)

Model `gemini-2.0-flash` sudah tidak tersedia. Function memakai fallback:
- gemini-2.5-flash
- gemini-2.0-flash-001
- gemini-1.5-flash
- gemini-flash-latest

## Deploy ulang (wajib setelah update ini)
```bash
supabase functions deploy grade-essays --no-verify-jwt
```

Pastikan secret `GEMINI_API_KEY` masih ada di Edge Function Secrets.
