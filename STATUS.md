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

## Fases Dajarony

Ninguna fase se marca como cerrada todavia hasta que los gates terminen verdes.

- [ ] Fase 1 — Design System: codigo + tests preparados; CI ejecutandose.
- [ ] Fase 2 — App shell: codigo + test de rutas preparados; cerrar despues de Fase 1.
- [ ] Fase 3 — DI + modulos Dajarony.
- [ ] Fase 4 — SCP en codigo.
- [ ] Fase 5 — Dominio.
- [ ] Fase 6 — Servicios + repositorios.
- [ ] Fase 7 — Shared widgets.
- [ ] Fase 8 — ViewModels + pantallas.
- [ ] Fase 9 — Tests por capa.

El ViewModel/screen/gameplay existentes se consideran prototipo heredado en remediacion, no una declaracion de que las fases posteriores esten cerradas.

## Gates automaticos

`.github/workflows/ci.yml` ejecuta en GitHub:
- `flutter pub get`
- `dart format --output=none --set-exit-if-changed lib test`
- `flutter analyze --fatal-infos --fatal-warnings`
- `flutter test`

## Pendiente inmediato — NO saltar

1. Esperar el resultado verde del CI actual y corregir cualquier fallo real.
2. Cuando el dispositivo `Dajarony` vuelva online, generar plataformas Flutter que falten sin pisar `lib/`.
3. Repetir localmente los mismos gates.
4. Solo entonces cerrar Fase 1 y Fase 2 en orden.

## Proxima feature despues de los gates

Primer enemigo `slime`, pero solo cuando la arquitectura base este validada. Su implementacion se separara como dominio/componente/sistema de colision segun la fase correspondiente; no se metera dentro de `MagycGame`.
