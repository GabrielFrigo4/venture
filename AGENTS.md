# 💼 Venture — AI Agent Briefing

> Este é o **repositório hub** de **Venture** de Gabriel Frigo. Ele orquestra os produtos comerciais, startups, motores de decisão operacional e soluções de mercado.

---

## 🧭 1. Identidade e Papel

O **Venture** é o ponto de entrada para as soluções de software aplicadas a desafios do mundo real:

| Componente                    | Papel                                                                                                        | Repositório Remoto        |
| :---------------------------- | :----------------------------------------------------------------------------------------------------------- | :------------------------ |
| **[`OptiLaser`](OptiLaser/)** | Motor de decisão logística (VRPTW) e copiloto operacional para locadoras de equipamentos estéticos e médicos | `GabrielFrigo4/optilaser` |

---

## ⚠️ 2. Regras Críticas para Agentes de IA

1. **A Regra de Ouro:** Ao modificar código de produto em `OptiLaser`, consulte sempre `AGENTS.md` e `PRINCIPLES.md` locais.
2. **Segurança de Negócio & Segredos:** NUNCA comite credenciais, chaves de API ou segredos nos repositórios.
3. **Hermetismo de Produção (`rm -rf .agents`):** A execução dos binários e contêineres deve ser 100% autônoma e independente de IA.
4. **Makefile como Orquestrador:** Use a raiz para gerenciar status e sincronização do ecossistema.
5. **Zero-Tweaks Invariant:** O repositório deve ser operável imediatamente após `git clone --recursive`.

---

## 🌲 3. Estrutura do Repositório

```
Venture/
├── .agents/                   # Governança e runbooks locais de IA
├── .githooks/                 # Quality gates de pre-commit e commit-msg
├── .github/                   # Workflows de CI
├── OptiLaser/                 # Motor logístico e copiloto operacional (Go + OR-Tools)
├── AGENTS.md                  # Este briefing de engenharia
├── LICENSE                    # Licença MIT
├── Makefile                   # Orquestrador POSIX silencioso
├── PRINCIPLES.md              # 18 Princípios de Engenharia aplicados
└── README.md                  # Apresentação executiva do Venture Hub
```

---

## ⚡ 4. Comandos de Verificação Rápida

| Comando       | Finalidade                                        |
| :------------ | :------------------------------------------------ |
| `make help`   | Exibe o catálogo completo de tarefas operacionais |
| `make status` | Inspeciona o estado Git dos submódulos de venture |
| `make pull`   | Sincroniza submódulos com as branches remotas     |
| `make test`   | Valida integridade e scripts locais               |
