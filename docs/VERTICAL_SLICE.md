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

## Fases

### F0 — Bootstrap
- Flutter + Flame.
- shell de juego.
- suelo isometrico provisional.
- mago provisional dibujado por codigo.
- controles tactiles.
- proyectil magico.

### F1 — Gameplay
- colisiones.
- enemigo slime.
- dano/vida.
- cristal y puerta.
- mini jefe.

### F2 — Arte
- personaje maestro.
- sprite-gen para idle/walk/cast/hit.
- atlas Flame.
- tiles isometricos.
- efectos de magia.

### F3 — Nucleo Flutter
- integrar Dajarony Core en la capa app.
- modulos de settings, progreso, audio y save.
- errores tipados y trazabilidad.

### F4 — Pulido
- audio.
- particulas.
- pantalla de inicio/victoria.
- rendimiento Android/Windows.

## Regla de alcance

No se anade inventario complejo, crafting, mundo abierto, dialogos extensos ni multiples mapas hasta que F0–F4 esten verdes y la demo completa resulte divertida.
