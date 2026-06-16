# Ejercicio 1 — Montar el entorno y conectar OpenCode + DeepSeek

**Duración**: 15–20 min · **Modo**: guiado.

## Objetivo

Terminar con OpenCode funcionando contra DeepSeek sobre este starter, los tests
en verde y los comandos `/opsx:*` disponibles.

## Paso 0 — Prerrequisitos (2 min)

```bash
node --version    # >= 22
git --version
```

Si usas **Codespaces** o **Dev Container**, esto ya está resuelto: salta al Paso 2.

## Paso 1 — Prepara el entorno (máquina pelada) (5 min)

```bash
./scripts/setup.sh
```

El script instala OpenCode + OpenSpec, las dependencias del repo e inicializa
OpenSpec (`/opsx:*`). Es idempotente: puedes repetirlo.

> ¿Quieres montar **otra** carpeta? `./scripts/setup.sh /ruta/al/repo`

## Paso 2 — Pega la API key de DeepSeek (2 min)

En la presentación hay un botón **"Copiar API key"**. Cópiala y:

```bash
export DEEPSEEK_API_KEY="sk-...."     # pégala aquí, en esta misma terminal
```

> OpenCode lee la key de esta variable de entorno. **No** la pongas en `.env`:
> OpenCode no lo lee y obtendrás un 401. Si abres otra terminal, vuelve a exportarla.

## Paso 3 — Comprueba que todo está listo (2 min)

```bash
./scripts/validate.sh
```

Debe salir todo en verde: Node, OpenCode, OpenSpec, comandos `/opsx:*`, la key y
los tests del starter.

## Paso 4 — Verifica el starter (3 min)

```bash
pnpm test            # 6 tests en verde
pnpm typecheck       # sin errores
pnpm dev             # imprime la lista de tareas de ejemplo
```

Si algo falla aquí, **para y avisa al ponente**.

## Paso 5 — Primer arranque de OpenCode (3 min)

```bash
opencode
```

Dentro de OpenCode:
- Confirma que el modelo activo es `deepseek/deepseek-chat` (abajo a la derecha).
- Escribe los comandos `/` y comprueba que aparecen `/opsx:propose`, `/opsx:apply`,
  `/opsx:verify`, `/opsx:archive`.
- Pídele: **"Lee AGENTS.md y openspec/project.md y dime en una frase qué feature
  tengo pendiente"**. Debe responder: añadir prioridad a las tareas.

✅ Listo. Pasa a [`02-propose.md`](./02-propose.md).
