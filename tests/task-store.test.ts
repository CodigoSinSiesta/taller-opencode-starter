import { test } from "node:test";
import assert from "node:assert/strict";
import { TaskStore } from "../src/task-store";

test("añade tareas y las lista en orden de creación", () => {
  const store = new TaskStore();
  store.add("Primera");
  store.add("Segunda");

  const titles = store.list().map((t) => t.title);
  assert.deepEqual(titles, ["Primera", "Segunda"]);
  assert.equal(store.size, 2);
});

test("las tareas nuevas empiezan sin completar", () => {
  const store = new TaskStore();
  const task = store.add("Pendiente");
  assert.equal(task.done, false);
  assert.equal(store.pending().length, 1);
});

test("completar una tarea la saca de pendientes", () => {
  const store = new TaskStore();
  const task = store.add("Hacer algo");
  const ok = store.complete(task.id);
  assert.equal(ok, true);
  assert.equal(store.pending().length, 0);
});

test("completar un id inexistente devuelve false", () => {
  const store = new TaskStore();
  assert.equal(store.complete("no-existe"), false);
});

test("eliminar una tarea la quita del almacén", () => {
  const store = new TaskStore();
  const task = store.add("Temporal");
  assert.equal(store.remove(task.id), true);
  assert.equal(store.size, 0);
});

test("el título vacío lanza error", () => {
  const store = new TaskStore();
  assert.throws(() => store.add("   "), /no puede estar vacío/);
});
