# Magyc

Mini action-RPG isometrico construido con Flutter + Flame siguiendo el Playbook de Dajarony Core.

## Objetivo

Validar un vertical slice pequeno de 5–10 minutos antes de ampliar alcance.

## Arquitectura

- Flutter: app shell, rutas, HUD y controles.
- Flame: mundo, componentes, movimiento, hechizos y colisiones.
- Dajarony Core: lifecycle, DI, errores tipados y trazabilidad cuando corresponda por fase.
- `sprite-gen`: pipeline previsto para convertir arte maestro en sprites/atlas listos para Flame.

Regla principal: **una responsabilidad por archivo/unidad**. No se acepta codigo espagueti ni archivos monoliticos.

La configuracion numerica del gameplay vive centralizada en `lib/features/game/gameplay/config/game_tuning.dart`; los controllers y componentes no reparten valores de tuning por el codigo.

Lee antes de tocar codigo:
- `AGENTS.md`
- `STATUS.md`
- `docs/ARCHITECTURE.md`
- `docs/VERTICAL_SLICE.md`

## Estado

La rama `feat/vertical-slice` esta preparada arquitectonicamente para validacion. No se considera ninguna fase Dajarony cerrada hasta ejecutar `flutter analyze` y `flutter test` en el equipo de desarrollo.
