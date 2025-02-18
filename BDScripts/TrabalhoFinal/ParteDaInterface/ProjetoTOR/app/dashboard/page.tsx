"use client";

import { title } from "@/components/primitives";
import { Table, TableHeader, TableBody, TableColumn, TableRow, TableCell, Pagination, Spinner, getKeyValue } from "@heroui/react";
import React from "react";
import useSWR from "swr";

const fetcher = (url: string) => fetch(url).then((res) => res.json());

export default function Dashboard() {
    const [page, setPage] = React.useState(1);
    const { data, isLoading } = useSWR(`https://swapi.py4e.com/api/people/?page=${page}`, fetcher, { keepPreviousData: true });

    const rowsPerPage = 10;

    const pages = React.useMemo(() => {
        return data?.count ? Math.ceil(data.count / rowsPerPage) : 0;
    }, [data?.count, rowsPerPage]);

    const loadingState = isLoading || data?.results.length === 0 ? "Loading" : "Idle";

    return (
        <div>
            <h1 className={title()}>Dados do <span className={title({ color: "blue" })}>TOR&nbsp;</span></h1>
            <div className="container" style={{ marginTop: "20px" }}>
                <div className="flex gap-3" style={{ borderRadius: "10px", padding: "10px" }}>
                    <Table
                        aria-label="Tabela de Dados do TOR"
                        bottomContent={
                            pages > 0 ? (
                                <div className="flex w-full justify-center">
                                    <Pagination
                                        isCompact
                                        showControls
                                        showShadow
                                        color="primary"
                                        page={page}
                                        total={pages}
                                        onChange={(page) => setPage(page)}
                                    />
                                </div>
                            ) : null
                        }
                    >
                        <TableHeader>
                            <TableColumn key="name">Nome</TableColumn>
                            <TableColumn key="height">Altura</TableColumn>
                            <TableColumn key="mass">Massa</TableColumn>
                            <TableColumn key="birth_year">Ano de Aniversário</TableColumn>
                        </TableHeader>
                        <TableBody items={data?.results ?? []} loadingContent={<Spinner />} loadingState={loadingState}>
                            {(item) => (
                                <TableRow key={item?.name}>
                                    {(columnKey) => <TableCell>{getKeyValue(item, columnKey)}</TableCell>}
                                </TableRow>
                            )}
                        </TableBody>
                    </Table>
                </div>
            </div>
        </div>
    );
}