.POSIX:
.SILENT:

MAKEFLAGS += --no-print-directory -s

# ----------------------------------------------------------------
# Makefile: Venture Hub Orchestrator
# ----------------------------------------------------------------

.PHONY: help clone pull status test audit format lint-md hooks ci

### ================================
### HELP & DOCUMENTATION
### ================================
help:
	cmd() { printf "    \033[36mmake %-22s\033[0m %s\n" "$$1" "$$2"; }; \
	sec() { printf "\n  \033[1;33m%s\033[0m\n" "$$1"; }; \
	printf "\n  \033[1;37mVenture Hub — Orquestrador Soberano de Produtos & Startups\033[0m\n"; \
	printf "  ===============================================================\n"; \
	sec "Sincronização & Repositórios:"; \
	cmd "clone"          "Inicializa submódulos públicos e clona OptiLaser via SSH"; \
	cmd "pull"           "Atualiza repositórios de venture com o GitHub"; \
	sec "Diagnóstico & Status:"; \
	cmd "status"         "Exibe status Git resumido dos produtos"; \
	cmd "hooks"          "Configura e aplica permissões canônicas em .githooks"; \
	sec "Qualidade & Testes:"; \
	cmd "test"           "Valida integridade e sintaxe de shell scripts"; \
	cmd "format"         "Formata documentações Markdown com Prettier"; \
	cmd "lint-md"        "Valida formatação de Markdown sem alterar arquivos"; \
	cmd "ci"             "Executa pipeline local completa de validação"; \
	echo ""

### ================================
### REPOSITORIES ORCHESTRATION
### ================================
clone:
	echo "📦 Inicializando submódulos públicos..."
	git submodule update --init --recursive 2> "/dev/null" || true
	echo "🔐 Tentando clonar o OptiLaser (repositório privado via SSH)..."
	if [ -e "OptiLaser/.git" ]; then \
		echo "  ℹ️  OptiLaser já clonado."; \
	elif git clone "git@github.com:GabrielFrigo4/optilaser.git" OptiLaser 2> "/dev/null"; then \
		echo "  ✅ OptiLaser clonado com sucesso!"; \
	else \
		echo "  ⚠️  OptiLaser: clone via SSH falhou (configure chave SSH com acesso a GabrielFrigo4/optilaser)."; \
	fi
	echo "🎉 Venture pronto!"

pull:
	echo "🔄 Sincronizando submódulos públicos..."
	git submodule update --remote --merge 2> "/dev/null" || true
	if [ -e "OptiLaser/.git" ]; then \
		echo "⬇️  Pulling OptiLaser..."; \
		git -C OptiLaser pull --ff-only 2> "/dev/null" || git -C OptiLaser pull || echo "⚠️  OptiLaser: pull falhou."; \
	fi
	echo "✅ Sincronização concluída!"

status:
	echo "=== 🚀 Venture Products ==="
	if [ -e "OptiLaser/.git" ]; then \
		echo "[$$(git -C OptiLaser branch --show-current 2> "/dev/null" || echo "detached")] OptiLaser:"; \
		git -C OptiLaser status -s; \
	else \
		echo "[não clonado] OptiLaser (repositório privado)"; \
	fi

### ================================
### QUALITY GATES & AUDIT
### ================================
hooks:
	chmod 0755 .githooks/* 2> "/dev/null" || true
	git config core.hooksPath .githooks 2> "/dev/null" || true
	[ -e "OptiLaser/.git" ] && git -C OptiLaser config core.hooksPath .githooks 2> "/dev/null" || true
	echo "✅ Hooks configurados com sucesso em .githooks!"

test:
	echo "🧪 Validando integridade e scripts de automação..."
	find . -name "*.sh" -not -path "*/.git/*" -not -path "*/OptiLaser/*" -exec sh -n {} +
	echo "✅ Validação de sintaxe aprovada!"

format:
	echo "🎨 Formatando arquivos Markdown com Prettier..."
	if command -v prettier > "/dev/null" 2>&1; then \
		find . -name "*.md" -not -path "*/.git/*" -not -path "*/OptiLaser/*" -exec prettier --write {} +; \
		echo "✅ Markdown formatado!"; \
	fi

lint-md:
	echo "🔍 Validando formatação de Markdown..."
	if command -v prettier > "/dev/null" 2>&1; then \
		find . -name "*.md" -not -path "*/.git/*" -not -path "*/OptiLaser/*" -exec prettier --check {} +; \
		echo "✅ Markdown em conformidade!"; \
	fi

ci: test lint-md status
	echo "✅ Pipeline local aprovada!"
