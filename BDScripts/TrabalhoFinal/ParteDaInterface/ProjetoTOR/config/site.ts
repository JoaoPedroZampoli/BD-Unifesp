export type SiteConfig = typeof siteConfig;

export const siteConfig = {
  name: "TOR - Unifesp",
  description: "Projeto de Extensão do ICT - Unifesp",
  navItems: [
    {
      label: "Home",
      href: "/",
    },
    {
      label: "Dados Públicos",
      href: "/dados-publicos",
    },
    {
      label: "Sobre Nós",
      href: "/sobre-nos",
    },
  ],
  navMenuItems: [
    {
      label: "Login",
      href: "/login",
    },
    {
      label: "Dashboard",
      href: "/dashboard",
    },
    {
      label: "Projects",
      href: "/projects",
    },
    {
      label: "Team",
      href: "/team",
    },
    {
      label: "Calendar",
      href: "/calendar",
    },
    {
      label: "Settings",
      href: "/settings",
    },
    {
      label: "Help & Feedback",
      href: "/help-feedback",
    },
    {
      label: "Logout",
      href: "/logout",
    },
  ],
  links: {
    github: "https://github.com/heroui-inc/heroui",
    twitter: "https://twitter.com/hero_ui",
    docs: "https://heroui.com",
    discord: "https://discord.gg/9b6yyZKmH4",
    login: "/login",
  },
};
