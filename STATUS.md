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

### Separado ahora
- `main.dart`: solo bootstrap + `runApp`.
- `app/`: bootstrap, app shell y rutas.
- `core/design_system/`: colores, spacing, radius, text styles, theme y tokens.
- `features/game/presentation/`: screen, ViewModel y widgets separados.
- `features/game/gameplay/magyc_game.dart`: solo composition root de Flame.
- `features/game/gameplay/controllers/`: movimiento y casting separados.
- `features/game/gameplay/components/`: suelo, mago y proyectil, uno por archivo.
- `features/game/gameplay/theme/`: paleta Flame centralizada.
- barrels por carpeta logica.

## Fases Dajarony

Ninguna fase se marca como cerrada todavia porque falta ejecutar los gates reales en el equipo de desarrollo.

- [ ] Fase 1 — Design System: codigo preparado; falta `analyze` + `test`.
- [ ] Fase 2 — App shell: codigo preparado; no se cierra hasta validar Fase 1 y despues Fase 2.
- [ ] Fase 3 — DI + modulos Dajarony.
- [ ] Fase 4 — SCP en codigo.
- [ ] Fase 5 — Dominio.
- [ ] Fase 6 — Servicios + repositorios.
- [ ] Fase 7 — Shared widgets.
- [ ] Fase 8 — ViewModels + pantallas.
- [ ] Fase 9 — Tests por capa.

El ViewModel/screen/gameplay existentes se consideran prototipo heredado en remediacion, no una declaracion de que las fases posteriores esten cerradas.

## Pendiente inmediato — NO saltar

1. Conectar el dispositivo remoto `Dajarony`.
2. Confirmar checkout de `feat/vertical-slice`.
3. Generar plataformas Flutter que falten sin pisar `lib/`.
4. Ejecutar con ruta absoluta:
   - `C:\flutter\bin\flutter.bat pub get`
   - `C:\flutter\bin\dart.bat format lib test`
   - `C:\flutter\bin\flutter.bat analyze`
   - `C:\flutter\bin\flutter.bat test`
5. Corregir hasta verde.
6. Solo entonces cerrar Fase 1 y avanzar en orden.

## Bloqueo actual

El dispositivo remoto `Dajarony` estaba offline en la ultima comprobacion. No se afirma que compile ni que los tests pasen hasta ejecutar los comandos anteriores.

## Proxima feature despues de los gates

Primer enemigo `slime`, pero solo cuando la arquitectura base este validada. Su implementacion se separara como dominio/componente/sistema de colision segun la fase correspondiente; no se metera dentro de `MagycGame`.
