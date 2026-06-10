#!/usr/bin/env bash
#
# validate.sh — Comprueba que el entorno del taller está listo.
# Uso: ./scripts/validate.sh
set -uo pipefail

GREEN='\033[0;32m'; RED='\033[0;31m'; YELLOW='\033[1;33m'; NC='\033[0m'
pass() { echo -e "${GREEN}✅${NC} $*"; }
fail() { echo -e "${RED}✗${NC} $*"; FAILS=$((FAILS+1)); }
warn() { echo -e "${YELLOW}⚠️${NC}  $*"; }
FAILS=0

# Node >= 20
if command -v node >/dev/null 2>&1 && [[ "$(node -p 'process.versions.node.split(".")[0]')" -ge 20 ]]; then
  pass "Node $(node --version)"
else
  fail "Node >= 20 no disponible"
fi

# pnpm
if command -v pnpm >/dev/null 2>&1; then
  pass "pnpm $(pnpm --version)"
else
  fail "pnpm no disponible (ejecuta 'corepack enable' o scripts/setup.sh)"
fi

# OpenCode
if command -v opencode >/dev/null 2>&1; then
  pass "OpenCode $(opencode --version 2>/dev/null || echo 'instalado')"
else
  fail "OpenCode no está en PATH (ejecuta scripts/setup.sh o reabre la terminal)"
fi

# OpenSpec + comandos
if command -v openspec >/dev/null 2>&1 || npx --yes @fission-ai/openspec@latest --version >/dev/null 2>&1; then
  pass "OpenSpec disponible"
else
  fail "OpenSpec no disponible"
fi
[[ -d ".opencode/command" ]] && pass "Comandos /opsx:* presentes (.opencode/command)" || warn "Faltan comandos /opsx:* — corre: openspec init --tools opencode"

# DeepSeek key
if [[ -n "${DEEPSEEK_API_KEY:-}" ]]; then
  pass "DEEPSEEK_API_KEY exportada"
elif grep -q '^DEEPSEEK_API_KEY="sk-[^"]\+"' .env 2>/dev/null && ! grep -q '^DEEPSEEK_API_KEY="sk-"' .env 2>/dev/null; then
  pass "DEEPSEEK_API_KEY definida en .env"
else
  warn "DEEPSEEK_API_KEY sin definir (pégala antes de lanzar opencode)"
fi

# Tests del starter
if pnpm test --silent >/dev/null 2>&1; then
  pass "Tests del starter en verde"
else
  fail "Los tests del starter fallan"
fi

echo ""
if [[ "${FAILS}" -eq 0 ]]; then
  echo -e "${GREEN}Entorno listo para el taller.${NC}"
else
  echo -e "${RED}${FAILS} comprobación(es) fallida(s). Revisa arriba.${NC}"
  exit 1
fi
