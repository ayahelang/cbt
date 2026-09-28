// Public app bootstrap — TIDAK menyimpan password admin di GitHub.
// Secrets di Supabase:
//   PUBLIC_ANON_KEY (opsional; default pakai SUPABASE_ANON_KEY bawaan)
//   APP_EXAM_TITLE, APP_SCHOOL_NAME, APP_PRODUCT_ID (opsional)
import "jsr:@supabase/functions-js/edge-runtime.d.ts";

const cors = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "GET, OPTIONS",
};

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: cors });

  const supabaseUrl = Deno.env.get("SUPABASE_URL") || "https://edaujcxmncoslykyddwf.supabase.co";
  const supabaseAnonKey =
    Deno.env.get("PUBLIC_ANON_KEY") ||
    Deno.env.get("SUPABASE_ANON_KEY") ||
    "";

  if (!supabaseAnonKey) {
    return new Response(JSON.stringify({ error: "ANON key belum tersedia di environment function" }), {
      status: 500,
      headers: { ...cors, "Content-Type": "application/json" },
    });
  }

  const body = {
    examTitle: Deno.env.get("APP_EXAM_TITLE") || "Silverhawk CBT",
    schoolName: Deno.env.get("APP_SCHOOL_NAME") || "SMA PMA",
    productId: Deno.env.get("APP_PRODUCT_ID") || "cbt",
    version: Deno.env.get("APP_VERSION") || "2.9.0",
    supabaseUrl,
    supabaseAnonKey,
    essayAiViaEdge: true,
    essayManualMode: false,
    forceFullscreen: true,
    cheatAlarmSound: true,
    defaultDurationMinutes: 60,
    defaultPracticeDurationMinutes: 30,
    // password TIDAK dikirim dari sini — admin login via tabel cbt_admins / secret terpisah
  };

  return new Response(JSON.stringify(body), {
    headers: { ...cors, "Content-Type": "application/json", "Cache-Control": "no-store" },
  });
});
