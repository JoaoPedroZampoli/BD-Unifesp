import { createConnection } from "../../../../lib/db";
import { NextResponse } from "next/server";

export async function GET(req) {
    let db;
    try {
        db = await createConnection();
        const sql = 'select m.IDMonitor, m.NomeMonitor, anosem.Ano, anosem.Semestre, c.StatusCapitao from monitor m join ano_semestre anosem on (m.IDAnoSemestre = anosem.IDAnoSemestre) left join capitao c on (m.IDMonitor = c.IDCapitao) where m.StatusMonitor = "Ativo"';
        const [rows] = await db.query(sql);

        if (!rows || rows.length === 0) throw new Error("Nenhum resultado encontrado");

        return NextResponse.json(rows);
    } catch (error) {
        console.error("Erro na API /MonitoresAtivos:", error);
        return NextResponse.json({ error: error.message }, { status: 500 });
    } finally {
        if (db) {
            await db.end();
        }
    }
}