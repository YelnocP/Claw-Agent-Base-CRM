import { createClient } from "@supabase/supabase-js";
import { getServerConfig, publicConfig } from "@/lib/config";

let adminClient: ReturnType<typeof createClient> | null = null;

export const getSupabaseAdmin = () => {
  if (adminClient) {
    return adminClient;
  }

  if (!publicConfig.supabaseUrl) {
    throw new Error("Missing NEXT_PUBLIC_SUPABASE_URL.");
  }

  const { supabaseServiceRoleKey } = getServerConfig();
  adminClient = createClient(publicConfig.supabaseUrl, supabaseServiceRoleKey, {
    auth: {
      autoRefreshToken: false,
      persistSession: false,
    },
  });

  return adminClient;
};
