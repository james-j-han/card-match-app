import 'package:card_match_app/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final card = Provider.of<CardModel>(context);

    return GestureDetector(
        onTap: () {},
        child: Card(
          child: Center(
            child: Text(card.isFaceUp ? card.imgPath : 'Back'),
          ),
        ));
  }
}
