# Instrucciones para tu agente de codificación

Este fichero es la **fuente única de verdad** que cualquier agente moderno
(OpenCode, Claude Code, Codex CLI, Cursor…) debe leer antes de tocar este repo.
OpenCode lo carga automáticamente (ver `opencode.json → instructions`), igual que
`openspec/AGENTS.md`.

## Propósito del repo

Es el **starter** del *taller-opencode* de Código Sin Siesta. El objetivo **no**
es terminar un producto: es practicar **spec-driven development con OpenCode +
OpenSpec**, usando **DeepSeek** como motor.

El código de `src/` es un mini gestor de tareas en memoria, con tests en verde.
Tiene una **feature pendiente a propósito** (prioridad de tareas) que construirás
con el flujo `/opsx:propose → /opsx:apply → /opsx:verify → /opsx:archive`.

## El agente: OpenCode con DeepSeek

- Modelo por defecto: `deepseek/deepseek-chat` (definido en `opencode.json`).
- La API key se toma de `DEEPSEEK_API_KEY` (env o `.env`). En el taller se reparte
  desde la presentación con un botón de copiar.
- Lanza el agente con `opencode` desde la raíz del repo.

## Flujo del taller (OpenSpec)

OpenSpec añade una capa de specs ligera: acordamos **qué** construir antes de
escribir código. Comandos disponibles dentro de OpenCode:

1. `/opsx:propose` — crea un *change* y sus artefactos de planificación.
2. `/opsx:apply`   — implementa las tareas del change (escribe código + tests).
3. `/opsx:verify`  — comprueba que la implementación cumple los artefactos.
4. `/opsx:archive` — archiva el change y sincroniza specs.

Los artefactos viven en `openspec/`:
- `openspec/project.md` — contexto del proyecto (léelo siempre primero).
- `openspec/specs/` — specs vigentes.
- `openspec/changes/` — propuestas en curso; `changes/archive/` las completadas.

## Qué debes hacer cuando te invoquen

Si el participante dice **"empezar el taller"**:
1. Lee `README.md` y confirma Node ≥ 20 y `DEEPSEEK_API_KEY` definida.
2. Ejecuta `pnpm install && pnpm test && pnpm typecheck`. Si algo falla, **para y
   avisa**; no sigas.
3. Abre `ejercicios/01-setup.md` y empieza por el Paso 0.

Si el participante dice **"propón la feature de prioridades"**:
- Usa `/opsx:propose`. No escribas código todavía: primero el change y sus specs.

## Convenciones de código

- ESM (`"type": "module"`). TypeScript estricto, sin `any`.
- `noUnusedLocals` y `noUnusedParameters` están activos; respétalos.
- Tests con `node:test` + `node:assert/strict`. Nada de Jest/Vitest.
- Comentarios solo cuando aporten; el código es pequeño y los nombres hablan.

## Cosas que NO hacer

- **No** amplíes `src/task.ts` a mano para añadir prioridades: eso es justo lo
  que dirige OpenSpec en el ejercicio. Hacerlo a mano rompe la pedagogía.
- **No** añadas base de datos ni APIs externas reales: el almacén en memoria basta.
- **No** hagas commit de `.env` ni de la API key de DeepSeek.
- **No** añadas hooks de lint/format salvo que el participante lo pida.

## Resolución de problemas

- **`opencode` no encontrado** tras instalar — reabre la terminal o
  `export PATH="$HOME/.opencode/bin:$PATH"`.
- **Faltan los comandos `/opsx:*`** — corre `openspec init --tools opencode --force`.
- **DeepSeek devuelve 401** — la `DEEPSEEK_API_KEY` no está exportada o caducó;
  pégala de nuevo desde la presentación.
