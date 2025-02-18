"use client";

import { title } from "@/components/primitives";
import { Card, CardHeader, CardFooter, Button } from "@heroui/react";

export default function DadosPublicosPage() {
  return (
    <div>
      <h1 className={title()}>Dados Públicos do <span className={title({ color: "blue" })}>TOR&nbsp;</span></h1>
      <div className="container" style={{ marginTop: "20px", width: "100%" }}>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5" style={{ borderRadius: "10px", padding: "10px"}}>
          <Card isFooterBlurred className="w-full h-[300px] bg-gradient-to-r from-blue-500 to-purple-500 flex items-center justify-center">
            <CardHeader className="absolute z-10 top-1 flex-col items-start">
              <p className="text-tiny text-white/60 uppercase font-bold">2024.2</p>
              <h4 className="text-white/90 font-medium text-xl">Quantidade de Projetos</h4>
            </CardHeader>
            <div className="z-0 w-full h-full flex items-center justify-center">
              <span className="text-white text-6xl font-bold">8</span>
            </div>
            {/* <CardFooter className="absolute bg-black/40 bottom-0 z-10 border-t-1 border-default-600 dark:border-default-100">
              {/* <Button radius="full" size="sm">
                Get App
              </Button>
            </CardFooter> */}
          </Card>
          <Card isFooterBlurred className="w-full h-[300px] bg-gradient-to-r from-green-600 to-blue-500 flex items-center justify-center">
            <CardHeader className="absolute z-10 top-1 flex-col items-start">
              <p className="text-tiny text-white/60 uppercase font-bold">2024.2</p>
              <h4 className="text-white/90 font-medium text-xl">Quantidade de Alunos</h4>
            </CardHeader>
            <div className="z-0 w-full h-full flex items-center justify-center">
              <span className="text-white text-6xl font-bold">27</span>
            </div>
          </Card>
          <Card isFooterBlurred className="w-full h-[300px] bg-gradient-to-r from-pink-500 to-orange-500 flex items-center justify-center">
            <CardHeader className="absolute z-10 top-1 flex-col items-start">
              <p className="text-tiny text-white/60 uppercase font-bold">2024.2</p>
              <h4 className="text-white/90 font-medium text-xl">Quantidade de Monitores</h4>
            </CardHeader>
            <div className="z-0 w-full h-full flex items-center justify-center">
              <span className="text-white text-6xl font-bold">11</span>
            </div>
          </Card>
        </div>
      </div>
    </div>
  );
}