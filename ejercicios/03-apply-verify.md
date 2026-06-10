# Ejercicio 3 — Implementar y verificar

**Duración**: 25–30 min · **Modo**: spec-driven.

## Objetivo

Que OpenCode implemente el change propuesto y comprobar que cumple la spec con los
tests en verde.

## Paso 1 — Aplica el change (15 min)

Dentro de OpenCode:

```
/opsx:apply
```

El agente irá ejecutando las tareas del change: modificará `src/task.ts` y
`src/task-store.ts`, y añadirá tests para la prioridad. **Revisa cada cambio**:
no apruebes a ciegas. Recuerda la regla de la serie — *lee el código del diff, no
solo el plan*.

## Paso 2 — Ejecuta los tests tú mismo (5 min)

```bash
pnpm test
pnpm typecheck
pnpm dev         # comprueba a ojo la salida con prioridades
```

Si algún test falla, díselo al agente con el error concreto y deja que itere. No
arregles a mano lo que la spec debe cubrir.

## Paso 3 — Verifica contra la spec (5 min)

```
/opsx:verify
```

`/opsx:verify` contrasta la implementación con los artefactos del change. Debe
confirmar que todo lo prometido está hecho. Si marca huecos, vuelve al Paso 1.

## Paso 4 — Checklist de salida

- [ ] `Task` tiene `priority` (`low` | `medium` | `high`).
- [ ] Hay forma de **listar/filtrar** por prioridad en `TaskStore`.
- [ ] Los 6 tests originales siguen pasando.
- [ ] Hay tests nuevos para la prioridad.
- [ ] `pnpm typecheck` sin errores.

Cuando todo esté marcado, pasa a [`04-archive.md`](./04-archive.md).
