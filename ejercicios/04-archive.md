# Ejercicio 4 — Archivar y retro

**Duración**: 10–15 min.

## Objetivo

Cerrar el ciclo spec-driven: archivar el change completado y reflexionar sobre lo
aprendido.

## Paso 1 — Archiva el change (3 min)

Dentro de OpenCode:

```
/opsx:archive
```

OpenSpec mueve el change a `openspec/changes/archive/` y sincroniza las specs
vigentes en `openspec/specs/`. Comprueba:

```bash
ls openspec/changes/archive/
ls openspec/specs/
```

Ahora la prioridad de tareas es parte de la **spec viva** del proyecto: el próximo
agente que entre la leerá como contexto.

## Paso 2 — Mira el diff completo (5 min)

```bash
git status
git diff
```

Fíjate en cuánto del trabajo fue: (a) acordar la spec, (b) implementar, (c)
verificar. El reparto suele sorprender: la implementación es lo barato.

## Paso 3 — Retro (5 min)

Responde en voz alta o por escrito:

1. ¿La propuesta inicial describía bien la feature, o tuviste que afinarla?
2. ¿El agente alucinó en algo? ¿Cómo lo detectaste?
3. ¿Qué harías distinto en el `/opsx:propose` para que el `/opsx:apply` fuera más limpio?
4. ¿Qué pondrías en `AGENTS.md` para que la próxima feature salga mejor sola?

## Bonus — Tu propio repo

Repite el flujo `propose → apply → verify → archive` sobre **una feature pequeña de
tu propio proyecto**. Ahí es donde el spec-driven con OpenCode demuestra (o no) su
valor. Trae conclusiones al cierre.

🎉 Fin del taller.
