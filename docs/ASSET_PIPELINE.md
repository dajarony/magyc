# Magyc — Asset Pipeline

## Objetivo

Convertir arte maestro consistente en assets 2D/isometricos listos para Flame sin mezclar el pipeline de arte con la logica del juego.

## Flujo

```text
arte maestro
  -> sprite-gen
      -> frames transparentes
          -> atlas/spritesheet
              -> manifest
                  -> assets/game/
                      -> Flame
```

## Alcance del primer pack visual

Solo se producen assets necesarios para validar el vertical slice:

- mago
- slime
- suelo isometrico
- arbol
- cristal
- puerta
- bola de fuego

No crear todavia inventario, NPCs, ciudades, crafting, docenas de enemigos ni un tileset enorme.

## Personaje: mago

Estados iniciales:

- `idle`
- `walk`
- `cast`
- `hit`

Direcciones objetivo:

- NE
- SE
- SW
- NW

Para el primer prototipo se admite reducir direcciones si el pipeline visual necesita validacion antes de escalar.

## Enemigo: slime

Estados iniciales:

- `idle`
- `move`
- `hit`
- `death`

## Convencion de rutas

```text
assets/game/
├── characters/
│   └── mage/
├── enemies/
│   └── slime/
├── environment/
│   ├── ground/
│   ├── trees/
│   └── doors/
├── objectives/
│   └── crystal/
└── effects/
    └── fireball/
```

## Convencion de nombres

```text
mage_idle_ne_00.png
mage_walk_ne_00.png
mage_cast_ne_00.png
slime_move_sw_00.png
fireball_loop_00.png
```

Nombres en minusculas, `snake_case`, sin espacios y con indice de frame de dos digitos.

## Reglas visuales

- Fondo transparente real para sprites.
- Misma escala aparente entre frames del mismo personaje.
- Punto de apoyo de pies estable para evitar vibracion al animar.
- Luz principal consistente entre personaje, enemigos y entorno.
- No hornear HUD ni texto dentro del arte del mundo.
- Sombras separadas cuando sea practico.
- No mezclar assets finales con renders de referencia.

## Integracion con Flame

El codigo no debe conocer nombres de archivos repartidos por componentes. Cuando entren assets reales, una unica responsabilidad de carga/registro resolvera sprites y animaciones; los componentes consumiran esa API.

No introducir esa capa antes de tener el primer atlas real.

## Fuente externa prevista

`aldegad/sprite-gen` se usa como herramienta de pipeline, no como dependencia runtime de Magyc. Magyc consume solo los assets exportados.

## Gate visual del primer pack

El pack se considera valido cuando:

1. el mago mantiene identidad y escala entre frames;
2. caminar no produce saltos del punto de apoyo;
3. `cast` se lee claramente a tamano de juego;
4. el slime se distingue del suelo y del mago;
5. el atlas conserva transparencia;
6. Flame puede cargar y reproducir al menos `idle`, `walk` y `cast` sin errores.
