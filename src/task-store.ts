import { createTask, type Task } from "./task";

/**
 * Almacén de tareas en memoria. Sin base de datos a propósito: el foco del
 * taller es el flujo con el agente, no la persistencia.
 */
export class TaskStore {
  private tasks: Task[] = [];

  /** Añade una tarea nueva y la devuelve. */
  add(title: string, now?: string): Task {
    const task = createTask(title, now);
    this.tasks.push(task);
    return task;
  }

  /** Devuelve todas las tareas, en orden de creación. */
  list(): Task[] {
    return [...this.tasks];
  }

  /** Devuelve solo las tareas pendientes (sin completar). */
  pending(): Task[] {
    return this.tasks.filter((t) => !t.done);
  }

  /** Marca una tarea como completada. Devuelve true si existía. */
  complete(id: string): boolean {
    const task = this.tasks.find((t) => t.id === id);
    if (!task) return false;
    task.done = true;
    return true;
  }

  /** Elimina una tarea. Devuelve true si existía. */
  remove(id: string): boolean {
    const before = this.tasks.length;
    this.tasks = this.tasks.filter((t) => t.id !== id);
    return this.tasks.length < before;
  }

  /** Número total de tareas. */
  get size(): number {
    return this.tasks.length;
  }
}
