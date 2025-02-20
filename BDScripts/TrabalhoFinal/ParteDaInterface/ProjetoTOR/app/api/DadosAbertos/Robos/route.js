import { createConnection } from "../../../../lib/db";
import { NextResponse } from "next/server";

export async function GET(req) {
    let db;
    try {
        db = await createConnection();
        const sql = 'SELECT * from robo';
        const [rows] = await db.query(sql);

        if (!rows || rows.length === 0) throw new Error("Nenhum resultado encontrado");

        return NextResponse.json(rows);
    } catch (error) {
        console.error("Erro na API /Robos:", error);
        return NextResponse.json({ error: error.message }, { status: 500 });
    } finally {
        if (db) {
            await db.end();
        }
    }
}