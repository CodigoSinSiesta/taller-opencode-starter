# Ejercicio 2 — Proponer la feature con OpenSpec

**Duración**: 20–25 min · **Modo**: spec-driven.

## Objetivo

Generar un *change* de OpenSpec que describa **qué** vamos a construir (prioridad
de tareas) **antes** de tocar el código.

## Paso 1 — Explora (opcional, 3 min)

Si tienes dudas sobre el alcance, usa `/opsx:explore` para pensar en voz alta con
el agente antes de comprometerte. No genera código.

## Paso 2 — Propón el change (10 min)

Dentro de OpenCode:

```
/opsx:propose Añadir prioridad (low|medium|high) a las tareas y poder listar y
filtrar por prioridad, manteniendo los tests actuales en verde.
```

OpenSpec creará una carpeta en `openspec/changes/<nombre-del-change>/` con los
artefactos de planificación (propuesta, specs delta y tareas). Revisa que:

- El **alcance** coincide con la feature pendiente de `openspec/project.md`.
- Las **tareas** son pequeñas y verificables.
- No hay marcadores `[NEEDS CLARIFICATION]` sin resolver. Si los hay, respóndelos.

## Paso 3 — Lee la propuesta como si fueras tú quien la implementa (7 min)

Abre el change generado:

```bash
ls openspec/changes/
openspec list          # o /opsx dentro de OpenCode
```

Léelo entero. **Regla de oro del taller**: si no entiendes la propuesta, el agente
tampoco la implementará bien. Edítala o pídele que la afine antes de seguir.

## Paso 4 — Decide

Cuando la propuesta describa exactamente lo que quieres (modelo `Task` con
`priority`, un método para filtrar, y sus tests), pasa a
[`03-apply-verify.md`](./03-apply-verify.md).

> 💡 Esto es lo que diferencia *spec-driven* de *vibe coding*: acordamos el **qué**
> antes del **cómo**. El change queda versionado en el repo.
