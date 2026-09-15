import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game/magyc_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MagycApp());
}

class MagycApp extends StatelessWidget {
  const MagycApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magyc',
      theme: ThemeData.dark(useMaterial3: true),
      home: const MagycGameScreen(),
    );
  }
}

class MagycGameScreen extends StatefulWidget {
  const MagycGameScreen({super.key});

  @override
  State<MagycGameScreen> createState() => _MagycGameScreenState();
}

class _MagycGameScreenState extends State<MagycGameScreen> {
  late final MagycGame _game;

  @override
  void initState() {
    super.initState();
    _game = MagycGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: GameWidget(game: _game)),
          const Positioned(
            left: 20,
            top: 20,
            child: SafeArea(
              child: _HudTitle(),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 22,
            child: SafeArea(child: _MovementPad(game: _game)),
          ),
          Positioned(
            right: 26,
            bottom: 34,
            child: SafeArea(
              child: _SpellButton(onPressed: _game.castSpell),
            ),
          ),
        ],
      ),
    );
  }
}

class _HudTitle extends StatelessWidget {
  const _HudTitle();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MAGYC',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 2),
            Text('Vertical slice 0.1'),
          ],
        ),
      ),
    );
  }
}

class _MovementPad extends StatelessWidget {
  const _MovementPad({required this.game});

  final MagycGame game;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(top: 0, child: _MoveButton(icon: Icons.keyboard_arrow_up, onPressed: game.moveUp)),
          Positioned(bottom: 0, child: _MoveButton(icon: Icons.keyboard_arrow_down, onPressed: game.moveDown)),
          Positioned(left: 0, child: _MoveButton(icon: Icons.keyboard_arrow_left, onPressed: game.moveLeft)),
          Positioned(right: 0, child: _MoveButton(icon: Icons.keyboard_arrow_right, onPressed: game.moveRight)),
        ],
      ),
    );
  }
}

class _MoveButton extends StatelessWidget {
  const _MoveButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.38),
      shape: const CircleBorder(),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 34),
        color: Colors.white,
        tooltip: 'Mover',
      ),
    );
  }
}

class _SpellButton extends StatelessWidget {
  const _SpellButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(24),
      ),
      child: const Icon(Icons.auto_fix_high, size: 34),
    );
  }
}
