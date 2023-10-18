import { serve } from "http/server";
import * as postgres from "postgres";

serve(async (_req) => {
  try {
    if (_req.method !== "POST") {
      return new Response("Method Not Allowed", { status: 405 });
    }

    // Check if _req.body is null
    if (!_req.body) {
      return new Response("Bad Request: No body", { status: 400 });
    }

    const { sql } = await _req.json();

    if (!sql) {
      return new Response("Missing required sql parameter", { status: 400 });
    }

    const databaseUrl = Deno.env.get("SUPABASE_DB_URL")!;

    // Create a database pool with the provided connection parameters
    const pool = new postgres.Pool(databaseUrl, 1, true);

    // Grab a connection from the pool
    const connection = await pool.connect();

    try {
      // Execute the provided SQL query
      const result = await connection.queryObject(sql);
      const data = result.rows;

      // Encode the result as pretty printed JSON
      const body = JSON.stringify(
        data,
        (key, value) => (typeof value === "bigint" ? value.toString() : value),
        2,
      );

      // Return the response with the correct content type header
      return new Response(body, {
        status: 200,
        headers: {
          "Content-Type": "application/json; charset=utf-8",
        },
      });
    } finally {
      // Release the connection back into the pool
      connection.release();
    }
  } catch (err) {
    console.error(err);
    return new Response(String(err?.message ?? err), { status: 500 });
  }
});
