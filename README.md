# Taller OpenCode — Starter

Repo de prácticas del **taller de agentes de codificación con OpenCode** de
Código Sin Siesta. Aquí aprenderás **spec-driven development** dirigiendo a
**OpenCode** (el agente) con **OpenSpec** (la capa de specs) y **DeepSeek** como motor.

El código es un mini **gestor de tareas** en TypeScript con los tests en verde y
una feature pendiente a propósito (prioridades), que construirás con el agente.

---

## Arranque rápido

Elige **una** de las tres vías. Todas dejan el entorno listo para `opencode`.

### A) GitHub Codespaces (recomendado para el taller)
1. `Code → Codespaces → Create codespace`.
2. Espera al mensaje `✅ Codespace listo`.
3. Pega la API key de DeepSeek (te la dan en la presentación):
   ```bash
   export DEEPSEEK_API_KEY="sk-..."
   ```
4. Lanza el agente: `opencode`.

### B) Dev Container local (VS Code + Docker)
1. Abre la carpeta en VS Code → `Reopen in Container`.
2. El `postCreateCommand` ejecuta `scripts/setup.sh` y deja todo instalado.
3. Exporta tu `DEEPSEEK_API_KEY` y lanza `opencode`.

### C) Máquina pelada (sin contenedor) — el script
```bash
./scripts/setup.sh                 # prepara este repo
# o indícale otra ruta a montar:
./scripts/setup.sh /ruta/al/repo --deepseek-key "sk-..."
```
Necesitas **Node ≥ 20**. El script instala OpenCode + OpenSpec, las dependencias,
inicializa OpenSpec con los comandos `/opsx:*` y crea `.env`.

Comprueba en cualquier momento:
```bash
./scripts/validate.sh
```

---

## Estructura

```
taller-opencode-starter/
├── .devcontainer/devcontainer.json   # Node 20 + git + gh + python; corre setup.sh
├── scripts/
│   ├── setup.sh                      # instalador idempotente (acepta ruta + --deepseek-key)
│   └── validate.sh                   # comprueba node, opencode, openspec, key, tests
├── opencode.json                     # modelo DeepSeek + instrucciones (AGENTS.md)
├── openspec/                         # project.md, specs/, changes/  (capa de specs)
├── AGENTS.md                         # instrucciones del agente (las lee OpenCode)
├── CLAUDE.md                         # wrapper @AGENTS.md (compatibilidad Claude Code)
├── .env.example                      # DEEPSEEK_API_KEY=...
├── src/                              # mini gestor de tareas (TypeScript, ESM)
├── tests/                            # node:test — en verde al empezar
└── ejercicios/                       # 01 → 04, el guion del taller
```

## Los ejercicios

1. [`ejercicios/01-setup.md`](./ejercicios/01-setup.md) — montar el entorno, conectar DeepSeek, primer `opencode`.
2. [`ejercicios/02-propose.md`](./ejercicios/02-propose.md) — `/opsx:propose` de la feature de prioridades.
3. [`ejercicios/03-apply-verify.md`](./ejercicios/03-apply-verify.md) — `/opsx:apply` + tests + `/opsx:verify`.
4. [`ejercicios/04-archive.md`](./ejercicios/04-archive.md) — `/opsx:archive` + retro.

Duración orientativa: 75–90 min.

## Requisitos

- Node ≥ 20 (el devcontainer ya lo trae).
- **pnpm** como gestor de paquetes (el `setup.sh` lo activa con corepack).
- Una API key de DeepSeek (se reparte en la presentación con un botón de copiar).

## Licencia

MIT · Alejandro de la Fuente — Código Sin Siesta.
