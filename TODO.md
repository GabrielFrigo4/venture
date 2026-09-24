# 🗺️ Roadmap & Backlog do Venture Hub

> Planejamento estratégico, status operacional e visão de futuro para produtos e startups de Gabriel Frigo.

---

## 📊 Status dos Produtos & Iniciativas

| Produto       | Foco Operacional                                        |  Maturidade  | Tecnologias Centrais                     |
| :------------ | :------------------------------------------------------ | :----------: | :--------------------------------------- |
| **OptiLaser** | Motor de Roteirização VRPTW & Copiloto para Laser Médic | 🟢 Funcional | Go, Google OR-Tools, PocketBase, Podman  |
| **Venture**   | Hub orquestrador, Makefile, automação e governança      |  🟢 Estável  | POSIX Makefile, Shell, GitHub Actions CI |

---

## 🎯 Grandes Épicos do Hub

### 1. ⚡ OptiLaser: Otimização VRPTW & Copiloto

- [ ] **Heurísticas Avançadas:** Incorporar heurísticas de inserção e busca local para instâncias com mais de 100 clientes.
- [ ] **Resiliência do Banco Embutido:** Afinar WAL Mode e backups assíncronos no PocketBase / SQLite.
- [ ] **Interface & Copiloto:** Refinar dashboards de controle com monitoramento em tempo real de rotas e disparos.

### 2. 🏛️ Infraestrutura de Deploy & Orquestração Soberana

- [ ] **Empacotamento de Binário Único:** Garantir build estático e hermético em Go para distribuição em FreeBSD e Linux.
- [ ] **Contêineres Podman Rootless:** Padronizar subida de serviços em nós Linux e Jails FreeBSD com zero privilégios de root.
- [ ] **SSL/TLS Automático:** Validar emissão autônoma de certificados via Let's Encrypt nativo do PocketBase.
