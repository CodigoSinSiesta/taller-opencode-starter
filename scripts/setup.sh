#!/usr/bin/env bash
#
# setup.sh — Prepara el entorno del Taller OpenCode en cualquier Linux/macOS.
#
# Uso:
#   ./scripts/setup.sh [RUTA_PROYECTO]
#
#   RUTA_PROYECTO   Carpeta del taller a preparar (por defecto: la raíz del repo).
#                   Esto cubre el caso "indícale la ruta que tiene que montar".
#
#   La API key de DeepSeek NO se gestiona aquí: expórtala en tu terminal antes de
#   lanzar opencode  ->  export DEEPSEEK_API_KEY="sk-..."   (OpenCode no lee .env).
#
# Es idempotente: puedes ejecutarlo las veces que quieras.
set -euo pipefail

# ---- colores -------------------------------------------------------------
GREEN='\033[0;32m'; BLUE='\033[0;34m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
info()  { echo -e "${BLUE}▸${NC} $*"; }
ok()    { echo -e "${GREEN}✅${NC} $*"; }
warn()  { echo -e "${YELLOW}⚠️${NC}  $*"; }
err()   { echo -e "${RED}✗${NC} $*" >&2; }

# ---- argumentos ----------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help) sed -n '2,16p' "$0"; exit 0 ;;
    *) PROJECT_DIR="$(cd "$1" && pwd)"; shift ;;
  esac
done

info "Preparando taller en: ${PROJECT_DIR}"
cd "${PROJECT_DIR}"

# ---- 1. Node >= 20 -------------------------------------------------------
if ! command -v node >/dev/null 2>&1; then
  err "Node.js no está instalado. Instala Node >= 20 (https://nodejs.org) y reintenta."
  exit 1
fi
NODE_MAJOR="$(node -p 'process.versions.node.split(".")[0]')"
if [[ "${NODE_MAJOR}" -lt 22 ]]; then
  err "Node ${NODE_MAJOR} detectado; el taller necesita Node >= 22.13 (pnpm 11.5.2 usa node:sqlite). Actualiza Node y reintenta."
  exit 1
fi
ok "Node $(node --version)"

# ---- 2. pnpm (vía corepack) ---------------------------------------------
if ! command -v pnpm >/dev/null 2>&1; then
  info "Activando pnpm con corepack…"
  corepack enable 2>/dev/null || true
  corepack prepare pnpm@11.5.2 --activate 2>/dev/null || npm install -g pnpm 2>/dev/null || true
fi
command -v pnpm >/dev/null 2>&1 && ok "pnpm $(pnpm --version)" || warn "pnpm no disponible; instálalo con 'corepack enable'."

# ---- 3. Dependencias del proyecto ---------------------------------------
info "Instalando dependencias (pnpm install)…"
pnpm install
ok "Dependencias instaladas"

# ---- 4. OpenCode CLI -----------------------------------------------------
if command -v opencode >/dev/null 2>&1; then
  ok "OpenCode ya instalado ($(opencode --version 2>/dev/null || echo '?'))"
else
  info "Instalando OpenCode…"
  curl -fsSL https://opencode.ai/install | bash
  export PATH="$HOME/.opencode/bin:$PATH"
  command -v opencode >/dev/null 2>&1 && ok "OpenCode instalado" || warn "OpenCode instalado; reabre la terminal para tenerlo en PATH."
fi

# ---- 5. OpenSpec CLI -----------------------------------------------------
if command -v openspec >/dev/null 2>&1; then
  ok "OpenSpec ya instalado ($(openspec --version 2>/dev/null || echo '?'))"
else
  info "Instalando OpenSpec (global)…"
  pnpm add -g @fission-ai/openspec >/dev/null 2>&1 || npm install -g @fission-ai/openspec >/dev/null 2>&1 || warn "No pude instalar OpenSpec global; usa 'pnpm dlx @fission-ai/openspec'."
  command -v openspec >/dev/null 2>&1 && ok "OpenSpec instalado" || true
fi

# ---- 5. OpenSpec init (no interactivo, integración OpenCode) -------------
if [[ ! -f "openspec/AGENTS.md" || ! -d ".opencode/command" ]]; then
  info "Inicializando OpenSpec con comandos para OpenCode…"
  if command -v openspec >/dev/null 2>&1; then
    openspec init --tools opencode --force "${PROJECT_DIR}" 2>/dev/null \
      || warn "Revisa manualmente: openspec init --tools opencode"
  else
    pnpm dlx @fission-ai/openspec@latest init --tools opencode --force "${PROJECT_DIR}" 2>/dev/null \
      || warn "Ejecuta manualmente: pnpm dlx @fission-ai/openspec init --tools opencode"
  fi
  [[ -d ".opencode/command" ]] && ok "Comandos /opsx:* disponibles en OpenCode" || true
else
  ok "OpenSpec ya inicializado"
fi

# ---- 6. Comprobación final ----------------------------------------------
info "Verificando que el starter arranca…"
pnpm test >/dev/null 2>&1 && ok "Tests en verde" || warn "Algún test falla — revísalo antes de empezar."

echo ""
ok "Entorno listo."
echo ""
echo -e "${BLUE}Siguientes pasos:${NC}"
echo "  1. Exporta tu key de DeepSeek (te la dan en la presentación):"
echo "       export DEEPSEEK_API_KEY=\"sk-...\""
echo "     (en esta misma terminal; OpenCode no lee .env)"
echo "  2. Lanza el agente:   opencode"
echo "  3. Abre el ejercicio: ejercicios/01-setup.md"
