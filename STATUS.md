# STATUS — Magyc

## Rama activa
`feat/vertical-slice`

## Fuente de trabajo
- `AGENTS.md`
- `dajarony/nucleoflutter/docs/BUILDING_APPS_ON_DAJARONY.md`
- `docs/ARCHITECTURE.md`
- `docs/VERTICAL_SLICE.md`

## Estado actual

Remediacion arquitectonica del prototipo inicial terminada en GitHub. El codigo anterior mezclaba app shell, widgets y gameplay; se ha separado por responsabilidad antes de seguir anadiendo features.

### Guardrails activos
- `AGENTS.md` obliga SRP, barrels, separacion Flutter/Flame y orden Dajarony.
- `analysis_options.yaml` activa reglas adicionales (`avoid_print`, `directives_ordering`, tipos de retorno explicitos, finales preferidos).
- `docs/ARCHITECTURE.md` fija dependencias y responsabilidades por capa.
- ECA/event bus queda expresamente fuera del vertical slice actual para evitar sobrearquitectura.

### Separado ahora
- `main.dart`: solo bootstrap + `runApp`.
- `app/`: bootstrap, app shell y rutas.
- `core/design_system/`: colores, spacing, radius, text styles, theme y tokens.
- `features/game/presentation/`: screen, ViewModel y widgets separados.
- `features/game/gameplay/magyc_game.dart`: solo composition root de Flame.
- `features/game/gameplay/config/`: tuning numerico centralizado del vertical slice.
- `features/game/gameplay/controllers/`: movimiento y casting separados.
- `features/game/gameplay/components/`: suelo, mago y proyectil, uno por archivo.
- `features/game/gameplay/theme/`: paleta Flame centralizada.
- barrels por carpeta logica.

### Ultima limpieza
- movimiento, margenes, spawn, dimensiones isometricas y parametros del hechizo ya no estan repartidos por controllers/componentes.
- `GameTuning` es la unica responsabilidad para esos valores.
- la geometria puramente visual permanece privada dentro de cada componente, donde pertenece.
- `.gitignore` Flutter/Dart anadido.
- CI de GitHub Actions anadido con pub get, format, analyze estricto y tests.
- tests iniciales anadidos para theme, rutas, movimiento/clamp y invariantes de tuning.
- formato y warning de import redundante detectados por CI y corregidos.

## Validacion CI

GitHub Actions esta VERDE en el commit actual del vertical slice:
- `flutter pub get` — PASS
- `dart format --output=none --set-exit-if-changed lib test` — PASS
- `flutter analyze --fatal-infos --fatal-warnings` — PASS
- `flutter test` — PASS

Esto valida la base Dart/Flutter en Flutter 3.29.0. Aun falta la validacion de ejecucion real en Android/Windows porque esas plataformas todavia deben generarse en el equipo de desarrollo.

## Fases Dajarony

- [ ] Fase 1 — Design System: gates CI verdes; pendiente repetir validacion local segun el playbook antes de marcar cierre formal.
- [ ] Fase 2 — App shell: gates CI verdes; pendiente validacion local/plataformas y cierre despues de Fase 1.
- [ ] Fase 3 — DI + modulos Dajarony.
- [ ] Fase 4 — SCP en codigo.
- [ ] Fase 5 — Dominio.
- [ ] Fase 6 — Servicios + repositorios.
- [ ] Fase 7 — Shared widgets.
- [ ] Fase 8 — ViewModels + pantallas.
- [ ] Fase 9 — Tests por capa.

El ViewModel/screen/gameplay existentes se consideran prototipo heredado en remediacion, no una declaracion de que las fases posteriores esten cerradas.

## Pendiente inmediato — NO saltar

1. Cuando el dispositivo `Dajarony` vuelva online, generar plataformas Flutter que falten sin pisar `lib/`.
2. Ejecutar localmente pub get, format, analyze y test.
3. Lanzar la demo en Windows o Android y confirmar arranque/render/control real.
4. Cerrar Fase 1 y Fase 2 en orden.
5. Solo entonces avanzar al primer enemigo `slime`.

## Proxima feature despues de los gates locales

Primer enemigo `slime`. Su implementacion se separara como dominio/componente/sistema de colision segun la fase correspondiente; no se metera dentro de `MagycGame`.
