# Magyc — Architecture

## Principio

Magyc aplica SRP de forma estricta: cada unidad de codigo tiene una sola razon principal para cambiar.

## Capas actuales

```text
main.dart
  -> app bootstrap
      -> app shell / routes / theme
          -> game presentation
              -> ViewModel
                  -> Flame gameplay composition
                      -> config
                      -> controllers
                      -> components
                      -> theme
```

## Responsabilidades

### `lib/main.dart`
Solo inicializa Flutter, ejecuta bootstrap y llama `runApp`.

### `lib/app/`
Solo compone la aplicacion Flutter: bootstrap, `MaterialApp`, rutas y, cuando corresponda, navegacion.

### `lib/core/design_system/`
Solo contiene tokens visuales reutilizables de Flutter. Ninguna logica de gameplay.

### `lib/features/game/presentation/`
Solo presenta el juego en Flutter. La screen dibuja estado y dispara acciones. El ViewModel es el puente entre presentacion y gameplay.

### `lib/features/game/gameplay/magyc_game.dart`
Es el composition root de Flame. Crea y conecta componentes/controladores. No contiene reglas de movimiento, dibujo del mago ni comportamiento de proyectiles.

### `lib/features/game/gameplay/config/`
Contiene unicamente parametros de ajuste del vertical slice: dimensiones isometricas, movimiento, spawn y comportamiento numerico de hechizos. Evita numeros de gameplay repartidos por componentes y controllers.

### `lib/features/game/gameplay/controllers/`
Cada controller contiene una regla de interaccion concreta. `PlayerMovementController` mueve al jugador. `SpellCastingController` crea hechizos. No renderizan.

### `lib/features/game/gameplay/components/`
Cada componente representa/renderiza una entidad o elemento del mundo y solo mantiene su comportamiento local. La geometria puramente visual puede permanecer privada dentro de su componente.

### `lib/features/game/gameplay/theme/`
Paleta visual del renderer Flame. Evita colores dispersos en componentes.

## Dependencias permitidas

```text
presentation -> gameplay
gameplay     -> config
app          -> presentation
components   -> config + gameplay theme
controllers  -> config + components
```

Evitar dependencias inversas: gameplay no conoce widgets, screens ni Material navigation.

## ECA / bus de eventos

No se introduce ECA, event bus ni otra capa de coordinacion en este vertical slice. Para el alcance actual seria sobrearquitectura y anadiria acoplamiento indirecto sin resolver un problema real.

Solo se reconsidera si aparecen varios subsistemas independientes que necesiten reaccionar al mismo evento sin conocerse entre si (por ejemplo combate + audio + progreso + logros). Hasta entonces, llamadas directas y contratos claros.

## Verificacion automatica

GitHub Actions ejecuta `flutter pub get`, formato, `flutter analyze --fatal-infos --fatal-warnings` y `flutter test` en cada push de `main`/`feat/**` y en cada PR hacia `main`.

## Siguiente evolucion segun Dajarony

No inventar arquitectura adicional. Cuando las fases del Playbook lo indiquen se incorporan:
- `core/di/`
- `core/modules/`
- `core/contracts/`
- `features/game/contracts/`
- `features/game/domain/`
- `features/game/services/`
- `features/game/repositories/`
- tests por capa

Dajarony Core sera la unica fuente para lifecycle, DI y errores tipados.
