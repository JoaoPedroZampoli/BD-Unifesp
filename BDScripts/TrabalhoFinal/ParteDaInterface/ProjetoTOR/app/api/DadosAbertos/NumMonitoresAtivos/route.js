import { createConnection } from "../../../../lib/db";
import { NextResponse } from "next/server";

export async function GET(req) {
    try {
        const db = await createConnection();
        if (!db) throw new Error("Falha ao conectar ao banco de dados");

        const sql = 'SELECT COUNT(*) AS count FROM Monitor WHERE StatusMonitor = "Ativo"';
        const [rows] = await db.query(sql);

        if (!rows || rows.length === 0) throw new Error("Nenhum resultado encontrado");

        return NextResponse.json({ count: rows[0].count });
    } catch (error) {
        console.error("Erro na API /MonitoresAtivos:", error);
        return NextResponse.json({ error: error.message }, { status: 500 });
    }
}
