import { TaskStore } from "./task-store";

/**
 * Demo mínima del gestor de tareas. Ejecuta con: npm run dev
 *
 * Es el punto de entrada que usarás para comprobar a ojo que tu feature
 * (la que construyas con OpenSpec) funciona end-to-end.
 */
function main(): void {
  const store = new TaskStore();

  store.add("Preparar el entorno del taller");
  store.add("Leer AGENTS.md");
  const tercera = store.add("Probar OpenCode con DeepSeek");

  store.complete(tercera.id);

  console.log(`Tareas (${store.size}):`);
  for (const task of store.list()) {
    const mark = task.done ? "✅" : "⬜";
    console.log(`  ${mark} [${task.id}] ${task.title}`);
  }

  console.log(`\nPendientes: ${store.pending().length}`);
}

main();
