# Magyc — Vertical Slice 0.1

## Meta

Probar la idea con una demo de 5–10 minutos antes de ampliar alcance.

## Bucle jugable

1. Entrar en un claro isometrico.
2. Mover al mago.
3. Lanzar hechizos.
4. Derrotar dos tipos de enemigos.
5. Recoger un cristal.
6. Abrir una puerta.
7. Derrotar un mini jefe.
8. Mostrar victoria.

## Alcance funcional

- 1 escena isometrica pequena.
- 1 mago.
- 2 hechizos como maximo.
- 2 tipos de enemigo como maximo.
- 1 cristal.
- 1 puerta.
- 1 mini jefe.
- estados de victoria y derrota.

## Hitos de producto

Estos hitos describen QUE queremos demostrar. No sustituyen las 9 fases tecnicas del Playbook Dajarony.

### H0 — Prototipo jugable
- Flutter + Flame.
- suelo isometrico provisional.
- mago provisional.
- controles tactiles.
- primer proyectil magico.

### H1 — Bucle de combate
- colisiones.
- enemigo slime.
- dano y vida.
- segundo enemigo si aporta una mecanica distinta.

### H2 — Objetivo del nivel
- cristal.
- puerta.
- mini jefe.
- victoria/derrota.

### H3 — Arte
- personaje maestro.
- sprite-gen para idle/walk/cast/hit.
- atlas Flame.
- tiles isometricos.
- efectos de magia.

### H4 — Pulido
- audio.
- particulas.
- rendimiento Android/Windows.

## Metodo tecnico obligatorio

Toda implementacion sigue `dajarony/nucleoflutter/docs/BUILDING_APPS_ON_DAJARONY.md`:

1. Design System.
2. App shell + rutas + bootstrap.
3. DI + modulos Dajarony.
4. SCP en codigo.
5. Dominio.
6. Servicios + repositorios.
7. Shared widgets.
8. ViewModels + pantallas.
9. Tests por capa.

Una fase solo se cierra con `flutter analyze` limpio y `flutter test` verde. Los hitos de producto pueden atravesar varias fases, pero nunca permiten saltarse el orden tecnico.

## Regla de alcance

No se anade inventario complejo, crafting, mundo abierto, multiplayer, dialogos extensos ni multiples mapas hasta que el vertical slice entero funcione y sea divertido.
