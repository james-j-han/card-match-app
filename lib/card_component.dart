import 'package:card_match_app/models/card_model.dart';
import 'package:card_match_app/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final card = Provider.of<CardModel>(context);
    final gameProvider = Provider.of<GameProvider>(context, listen: false);

    return GestureDetector(
        onTap: () {
          if (!card.isFaceUp && !card.isMatched) {
            gameProvider.flipCard(card);
          }
        },
        child: Card(
          child: Center(
              child: card.isFaceUp
                  ? Image.asset(card.imgPath)
                  : Container(color: Colors.black)),
        ));
  }
}
