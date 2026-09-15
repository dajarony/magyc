# Magyc — reglas obligatorias para agentes

> Lee este archivo antes de tocar codigo. Magyc sigue el Playbook de Dajarony Core.
> La prioridad es un vertical slice pequeno, jugable y mantenible; no crecer por crecer.

## 1. Fuentes de verdad

1. `dajarony/nucleoflutter/docs/BUILDING_APPS_ON_DAJARONY.md`
2. `dajarony/nucleoflutter/AGENTS.md`
3. Este `AGENTS.md`
4. `STATUS.md`
5. `docs/VERTICAL_SLICE.md`

Si una implementacion contradice esas reglas, se corrige antes de anadir features.

## 2. Regla principal: una responsabilidad

- Un archivo = una responsabilidad.
- Un widget = un archivo.
- Un componente Flame = un archivo.
- Un controller = un archivo.
- Un servicio = un archivo.
- Un repositorio = un archivo.
- Una screen y su ViewModel nunca comparten archivo.
- `main.dart` solo hace bootstrap + `runApp`.
- Tope blando: 300 lineas por archivo; idealmente bastante menos.
- Prohibido crear archivos comodin tipo `helpers.dart`, `utils.dart` o `misc.dart` con responsabilidades mezcladas.

## 3. Estructura objetivo

```text
lib/
├── main.dart
├── app/
│   ├── app_bootstrap.dart
│   ├── magyc_app.dart
│   └── app.dart
├── core/
│   └── design_system/
│       ├── app_colors.dart
│       ├── app_spacing.dart
│       ├── app_radius.dart
│       ├── app_text_styles.dart
│       ├── app_theme.dart
│       └── design_system.dart
└── features/
    └── game/
        ├── gameplay/
        │   ├── magyc_game.dart
        │   ├── components/
        │   └── controllers/
        └── presentation/
            ├── magyc_game_screen.dart
            └── widgets/
```

Las fases siguientes incorporaran `contracts/`, `domain/`, `services/`, `repositories/`, DI y modulos Dajarony exactamente cuando corresponda en el Playbook.

## 4. Separacion Flutter / Flame

Flutter se ocupa de:
- app shell
- pantalla y HUD
- controles tactiles
- navegacion y menus

Flame se ocupa de:
- world/game loop
- componentes de juego
- movimiento dentro del mundo
- hechizos y proyectiles
- colisiones
- camara, particulas y rendering

No meter widgets Flutter dentro de componentes Flame ni logica de gameplay dentro de widgets.

## 5. Dajarony Core

- Cuando llegue Fase 3 se usa `DajaronyModule`, `DiContainer`, `Result<T, DajaronyError>` y el lifecycle existentes.
- No crear un segundo sistema de DI.
- No inventar un `CoreModule` paralelo.
- No añadir `get_it`, Provider, Riverpod, Bloc o `go_router` sin permiso explicito.
- Toda operacion I/O futura debe usar errores tipados y `RepositoryBase.guard`.

## 6. Design System

- No hardcodear colores, espaciados, radios o estilos en screens/widgets.
- Los tokens viven en `core/design_system/`.
- Light y dark theme deben existir aunque el prototipo use dark por defecto.
- El renderer Flame puede tener una paleta de gameplay dedicada, pero esa paleta debe estar centralizada y no repartida por componentes.

## 7. Barriles

Cada carpeta logica publica su API mediante un barrel (`app.dart`, `design_system.dart`, `components.dart`, `controllers.dart`, etc.). Los consumidores importan barrels, no archivos internos, salvo cuando hacerlo evita un ciclo real y documentado.

## 8. Fases y gates

Seguir las 9 fases del Playbook Dajarony en orden. Una fase NO se marca completa hasta ejecutar en el equipo de desarrollo:

```powershell
& "C:\flutter\bin\flutter.bat" analyze
& "C:\flutter\bin\flutter.bat" test
```

Si cualquiera falla, no avanzar y no marcar la fase como cerrada.

## 9. Alcance del vertical slice

Solo:
- 1 escena isometrica pequena
- 1 mago
- movimiento
- 2 hechizos maximo
- 2 tipos de enemigo maximo
- 1 cristal
- 1 puerta
- 1 mini jefe
- victoria/derrota

Nada de inventario complejo, crafting, mundo abierto, multiplayer o sistemas que no sean necesarios para validar el slice.

## 10. Continuidad entre agentes

Antes de terminar una sesion:
- actualizar `STATUS.md`
- indicar que se cambio
- indicar que se valido realmente y que no
- dejar el siguiente paso unico y concreto

Nunca declarar tests o builds verdes sin haberlos ejecutado.