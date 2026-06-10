# OpenSpec — instrucciones

> Placeholder mínimo. Al correr `openspec init --tools opencode --force` este
> fichero se regenera con las instrucciones canónicas de OpenSpec y se crean los
> comandos `/opsx:*` para OpenCode en `.opencode/command/`.

OpenSpec gestiona una capa de specs ligera para acordar **qué** construir antes de
escribir código.

- Lee `openspec/project.md` antes de proponer o implementar.
- Las propuestas viven en `openspec/changes/<nombre>/`; al completarse se mueven a
  `openspec/changes/archive/`.
- Las specs vigentes viven en `openspec/specs/`.

Flujo: `/opsx:propose` → `/opsx:apply` → `/opsx:verify` → `/opsx:archive`.
