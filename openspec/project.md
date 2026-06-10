# Project Context

> Contexto que OpenSpec y tu agente leen antes de proponer o implementar cambios.
> (Si ejecutas `openspec init`, puede regenerar este fichero; el contenido de
> abajo es el que usamos en el taller.)

## Purpose

Starter del **taller-opencode** de Código Sin Siesta. Un mini gestor de tareas en
TypeScript que sirve de campo de pruebas para aprender **spec-driven development**
con **OpenCode** (agente) y **OpenSpec** (capa de specs), usando **DeepSeek** como
modelo.

## Tech Stack

- TypeScript estricto (ESM), Node ≥ 20.
- Tests con `node:test` + `node:assert/strict`, ejecutados con `tsx`.
- Sin dependencias de runtime: almacén de tareas en memoria.

## Project Conventions

- Sin `any`; `noUnusedLocals` / `noUnusedParameters` activos.
- Un módulo por responsabilidad (`task.ts` el modelo, `task-store.ts` el almacén).
- Comentarios en español solo cuando aporten.

## Scope actual

- `Task`: `id`, `title`, `done`, `createdAt`.
- `TaskStore`: `add`, `list`, `pending`, `complete`, `remove`, `size`.

## Feature pendiente (la del taller)

Añadir **prioridad** a las tareas (`low` | `medium` | `high`) y poder **listar y
filtrar por prioridad**. Esta es la capacidad que construirás con
`/opsx:propose → /opsx:apply → /opsx:verify → /opsx:archive`. No la implementes a
mano: deja que el flujo spec-driven la dirija.

## Criterios de éxito

- Los tests existentes siguen en verde.
- La nueva feature llega acompañada de sus propios tests.
- `npm run typecheck` pasa sin errores.
