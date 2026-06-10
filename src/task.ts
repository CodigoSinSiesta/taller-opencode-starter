/**
 * Modelo de una tarea del mini gestor.
 *
 * NOTA PARA EL TALLER: este modelo es deliberadamente simple. La feature que
 * construirás con OpenSpec (ver openspec/ y ejercicios/02-propose.md) amplía
 * este tipo — por ejemplo, añadiendo prioridad. No lo amplíes a mano: deja que
 * el flujo spec-driven lo dirija.
 */
export interface Task {
  id: string;
  title: string;
  done: boolean;
  createdAt: string; // ISO 8601
}

let counter = 0;

/** Crea una tarea nueva sin completar. El id es estable dentro de una ejecución. */
export function createTask(title: string, now: string = new Date().toISOString()): Task {
  const trimmed = title.trim();
  if (!trimmed) {
    throw new Error("El título de la tarea no puede estar vacío");
  }
  counter += 1;
  return {
    id: `t${counter}`,
    title: trimmed,
    done: false,
    createdAt: now,
  };
}
