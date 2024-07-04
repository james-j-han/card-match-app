import 'package:card_match_app/models/card_model.dart';
import 'package:card_match_app/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardComponent extends StatefulWidget {
  const CardComponent({super.key});

  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  // bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final card = Provider.of<CardModel>(context);
    if (card.isFaceUp) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final card = Provider.of<CardModel>(context);
    final gameProvider = Provider.of<GameProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
          onTap: () {
            if (!card.isFaceUp && !card.isMatched) {
              gameProvider.flipCard(card);
            }
          },
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final isUnder = _animation.value > 0.5;
              return Transform(
                transform: Matrix4.rotationY(_animation.value * 3.14),
                alignment: Alignment.center,
                child: isUnder
                    ? Image.asset(card.imgPath)
                    : Container(color: Colors.black),
              );
            },
          )),
    );
  }
}
