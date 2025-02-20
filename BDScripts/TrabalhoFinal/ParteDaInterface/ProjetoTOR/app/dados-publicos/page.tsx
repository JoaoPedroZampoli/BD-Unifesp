"use client";

import { useState, useEffect } from "react";
import { useSpring, animated } from "@react-spring/web";
import { title, sectionTitle } from "@/components/primitives";
import React from "react";
import { Card, CardHeader, CardBody, Tabs, Tab, Table, TableHeader, TableBody, TableColumn, TableRow, TableCell, Spinner, Pagination, Chip } from "@heroui/react";

export default function DadosPublicosPage() {
  const [MApage, setMAPage] = React.useState(1);
  const [ExMpage, setExMpage] = React.useState(1);
  const [alunosAtivos, setAlunosAtivos] = useState(0);
  const [numMonitoresAtivos, setnumMonitoresAtivos] = useState(0);
  const [robosCriados, setRobosCriados] = useState(0);
  const [monitoresAtuais, setMonitoresAtuais] = useState([]);
  const [exMonitores, setExMonitores] = useState([]);
  const [loadingState, setLoadingState] = useState("Loading");

  const rowsPerPage = 5;

  useEffect(() => {
    const fetchData = async () => {
      try {
        const responseRobos = await fetch("/api/DadosAbertos/RobosCriados");
        const dataRobos = await responseRobos.json();
        setRobosCriados(dataRobos.count);

        const response = await fetch("/api/DadosAbertos/AlunosAtivos");
        const data = await response.json();
        setAlunosAtivos(data.count);

        const responseMonitores = await fetch("/api/DadosAbertos/NumMonitoresAtivos");
        const dataMonitores = await responseMonitores.json();
        setnumMonitoresAtivos(dataMonitores.count);

        const responseMonitoresAtuais = await fetch("/api/DadosAbertos/MonitoresAtivos");
        const dataMonitoresAtuais = await responseMonitoresAtuais.json();
        setMonitoresAtuais(dataMonitoresAtuais);

        const responseExMonitores = await fetch("/api/DadosAbertos/ExMonitores");
        const dataExMonitores = await responseExMonitores.json();
        setExMonitores(dataExMonitores);

        setLoadingState("Idle");

      } catch (error) {
        console.log(error);
      }
    };
    fetchData();
  }, []);

  const alunosAtivosSpring = useSpring({ number: alunosAtivos, from: { number: 0 } });
  const numMonitoresAtivosSpring = useSpring({ number: numMonitoresAtivos, from: { number: 0 } });
  const robosCriadosSpring = useSpring({ number: robosCriados, from: { number: 0 } });

  const MApages = React.useMemo(() => {
    return monitoresAtuais.length ? Math.ceil(monitoresAtuais.length / rowsPerPage) : 0;
  }, [monitoresAtuais.length, rowsPerPage]);
  const ExMpages = React.useMemo(() => {
    return exMonitores.length ? Math.ceil(exMonitores.length / rowsPerPage) : 0;
  }, [exMonitores.length, rowsPerPage]);

  const cardSpring = useSpring({
    opacity: 1,
    transform: 'scale(1)',
    from: { opacity: 0, transform: 'scale(0.5)' },
    config: { tension: 200, friction: 20 },
  });

  return (
    <div>
      <h1 className={title()}>Dados Públicos do <span className={title({ color: "blue" })}>TOR&nbsp;</span></h1>
      <div className="container" style={{ marginTop: "20px", width: "100%" }}>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5" style={{ borderRadius: "10px", padding: "10px"}}>
          <animated.div style={cardSpring}>
            <Card isFooterBlurred className="w-full h-[300px] bg-gradient-to-r from-blue-500 to-purple-500 flex items-center justify-center">
              <CardHeader className="absolute z-10 top-1 flex-col items-start">
                <p className="text-tiny text-white/60 uppercase font-bold">Desde 2017</p>
                <h4 className="text-white/90 font-medium text-xl">Quantidade de Robôs</h4>
              </CardHeader>
              <div className="z-0 w-full h-full flex items-center justify-center">
                <animated.span className="text-white text-6xl font-bold">
                  {robosCriadosSpring.number.to((n) => n.toFixed(0))}
                </animated.span>
              </div>
            </Card>
          </animated.div>
          <animated.div style={cardSpring}>
            <Card isFooterBlurred className="w-full h-[300px] bg-gradient-to-r from-green-600 to-blue-500 flex items-center justify-center">
              <CardHeader className="absolute z-10 top-1 flex-col items-start">
                <p className="text-tiny text-white/60 uppercase font-bold">Atualmente</p>
                <h4 className="text-white/90 font-medium text-xl">Quantidade de Alunos</h4>
              </CardHeader>
              <div className="z-0 w-full h-full flex items-center justify-center">
                <animated.span className="text-white text-6xl font-bold">
                  {alunosAtivosSpring.number.to((n) => n.toFixed(0))}
                </animated.span>
              </div>
            </Card>
          </animated.div>
          <animated.div style={cardSpring}>
            <Card isFooterBlurred className="w-full h-[300px] bg-gradient-to-r from-pink-500 to-orange-500 flex items-center justify-center">
              <CardHeader className="absolute z-10 top-1 flex-col items-start">
                <p className="text-tiny text-white/60 uppercase font-bold">Atualmente</p>
                <h4 className="text-white/90 font-medium text-xl">Quantidade de Monitores</h4>
              </CardHeader>
              <div className="z-0 w-full h-full flex items-center justify-center">
                <animated.span className="text-white text-6xl font-bold">
                  {numMonitoresAtivosSpring.number.to((n) => n.toFixed(0))}
                </animated.span>
              </div>
            </Card>
          </animated.div>
        </div>
      </div>
      <animated.div>
            <h2 className={sectionTitle()}>Equipe de Monitores</h2>
            <div className="flex flex-wrap gap-6 align-middle justify-center">
                <Tabs key="primary" aria-label="Equipe de Monitores" color="primary" className="w-full align-middle justify-center pt-6">
                  <Tab key="MonitoresAtuais" title="Monitores Atuais" className="w-8/12">
                    <Card>
                      <CardBody>
                        <Table isStriped 
                        bottomContent={
                          MApages > 0 ? (
                              <div className="flex w-full justify-center">
                                  <Pagination
                                      isCompact
                                      showControls
                                      showShadow
                                      color="primary"
                                      page={MApage}
                                      total={MApages}
                                      onChange={(MApage) => setMAPage(MApage)}
                                  />
                              </div>
                          ) : null
                        }>
                          <TableHeader>
                            <TableColumn key="NomeMonitor">Nome</TableColumn>
                            <TableColumn key="Ano">Ano</TableColumn>
                            <TableColumn key="Semestre">Semestre</TableColumn>
                          </TableHeader>
                          <TableBody items={monitoresAtuais.slice((MApage - 1) * rowsPerPage, MApage * rowsPerPage)} loadingContent={<Spinner />} loadingState={loadingState}>
                            {(item) => (
                              <TableRow key={item?.NomeMonitor}>
                              {(columnKey) => (
                                <TableCell>
                                  {columnKey === "NomeMonitor" ? (
                                    <>
                                      {item[columnKey]}
                                      {item.StatusCapitao === "Ativo" && (
                                        <Chip color="warning" className="ml-4">Capitão da Equipe</Chip>
                                      )}
                                    </>
                                  ) : (
                                    item[columnKey]
                                  )}
                                </TableCell>
                              )}
                            </TableRow>
                            )}
                          </TableBody>
                        </Table>
                      </CardBody>
                    </Card>
                  </Tab>
                  <Tab key="ExMonitores" title="Ex-Monitores" className="w-8/12">
                    <Card>
                      <CardBody>
                      <Table isStriped 
                        bottomContent={
                          ExMpages > 0 ? (
                              <div className="flex w-full justify-center">
                                  <Pagination
                                      isCompact
                                      showControls
                                      showShadow
                                      color="primary"
                                      page={ExMpage}
                                      total={ExMpages}
                                      onChange={(ExMpage) => setExMpage(ExMpage)}
                                  />
                              </div>
                          ) : null
                        }>
                          <TableHeader>
                            <TableColumn key="NomeMonitor">Nome</TableColumn>
                            <TableColumn key="Ano">Ano</TableColumn>
                            <TableColumn key="Semestre">Semestre</TableColumn>
                          </TableHeader>
                          <TableBody items={exMonitores.slice((ExMpage - 1) * rowsPerPage, ExMpage * rowsPerPage)} loadingContent={<Spinner />} loadingState={loadingState}>
                            {(item) => (
                              <TableRow key={item?.NomeMonitor}>
                                {(columnKey) => <TableCell>{item[columnKey]}</TableCell>}
                              </TableRow>)}
                          </TableBody>
                        </Table>
                      </CardBody>
                    </Card>
                  </Tab>
                </Tabs>
            </div>
          </animated.div>
    </div>
  );
}