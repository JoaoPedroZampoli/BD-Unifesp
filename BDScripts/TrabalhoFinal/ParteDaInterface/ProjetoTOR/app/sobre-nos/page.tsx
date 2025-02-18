import { title, subtitle, sectionTitle, sectionItem, sectionSubtitle } from "@/components/primitives";

export default function AboutPage() {
  return (
    <div>
      <h1 className={title()}>Sobre Nós</h1>
      <div className={subtitle({ class: "mt-4" })}>
        <span>TOR - Treinamento para a Olimpíada de Robótica</span>
      </div>
      <section>
            <h2 className={sectionTitle({textAlign: "left"})}>Nossos Objetivos</h2>
            <ul>
                <li className={sectionItem({textAlign: "left"})}><strong className={sectionSubtitle({color: "blue"})}>• Preparar Alunos para a OBR:</strong> Oferecemos um treinamento intensivo para que os alunos estejam prontos para enfrentar os desafios da Olimpíada Brasileira de Robótica, tanto nas modalidades práticas quanto teóricas.</li>
                <li className={sectionItem({textAlign: "left"})}><strong className={sectionSubtitle({color: "blue"})}>• Difundir Conhecimentos de Robótica:</strong> Promovemos o ensino de robótica, computação, eletrônica, mecânica e física, incentivando vocações para essas áreas.</li>
                <li className={sectionItem({textAlign: "left"})}><strong className={sectionSubtitle({color: "blue"})}>• Despertar Interesse por STEM:</strong> Buscamos inspirar jovens a explorarem as áreas de ciência e tecnologia, contribuindo para a formação de futuros engenheiros e cientistas.</li>
            </ul>
        </section>
        <section>
            <h2 className={sectionTitle({textAlign: "left"})}>Nossas Atividades</h2>
            <ul>
                <li className={sectionItem({textAlign: "left"})}><strong className={sectionSubtitle({color: "blue"})}>• Treinamento de Alunos:</strong> Preparamos alunos da rede pública do município de São José dos Campos para competirem na OBR através de aulas práticas e teóricas.</li>
                <li className={sectionItem({textAlign: "left"})}><strong className={sectionSubtitle({color: "blue"})}>• Eventos e Oficinas:</strong> Organizamos eventos e oficinas abertos à comunidade para disseminar o conhecimento sobre robótica e suas aplicações.</li>
                <li className={sectionItem({textAlign: "left"})}><strong className={sectionSubtitle({color: "blue"})}>• Preparação de Universitários:</strong> Oferecemos suporte e treinamento para estudantes universitários que desejam participar do nosso projeto.</li>
            </ul>
        </section>
        <section>
            <h2 className={sectionTitle({textAlign: "left"})}>Nossa Missão</h2>
            <p className={sectionItem({textAlign: "left"})}>No TOR Unifesp, acreditamos que a robótica é uma poderosa ferramenta educacional que pode transformar a vida dos jovens. Nossa missão é proporcionar um ambiente de aprendizado estimulante e inclusivo, onde os alunos possam desenvolver suas habilidades e descobrir novas paixões.</p>
        </section>
    </div>
  );
}
