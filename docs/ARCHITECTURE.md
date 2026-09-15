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
                      -> controllers
                      -> components
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

### `lib/features/game/gameplay/controllers/`
Cada controller contiene una regla de interaccion concreta. `PlayerMovementController` mueve al jugador. `SpellCastingController` crea hechizos. No renderizan.

### `lib/features/game/gameplay/components/`
Cada componente representa/renderiza una entidad o elemento del mundo y solo mantiene su comportamiento local.

### `lib/features/game/gameplay/theme/`
Paleta visual del renderer Flame. Evita colores dispersos en componentes.

## Dependencias permitidas

```text
presentation -> gameplay
app          -> presentation
components   -> gameplay theme
controllers  -> components
```

Evitar dependencias inversas: gameplay no conoce widgets, screens ni Material navigation.

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
