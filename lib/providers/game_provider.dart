import 'package:card_match_app/models/card_model.dart';
import 'package:flutter/material.dart';

class GameProvider with ChangeNotifier {
  final List<CardModel> _cards = [];
  CardModel? _firstCard;
  CardModel? _secondCard;

  GameProvider() {
    _initCards();
  }

  List<CardModel> get cards => _cards;

  void _initCards() {
    final List<String> imagePaths = [
      'assets/images/ace.png',
      'assets/images/cricle.png',
      'assets/images/heart.png',
      'assets/images/raindrop.png',
      'assets/images/soda.png',
      'assets/images/square.png',
      'assets/images/star.png',
      'assets/images/triangle.png',
    ];

    for (int i = 0; i < imagePaths.length; i++) {
      _cards.add(CardModel(id: i * 2, imgPath: imagePaths[i]));
      _cards.add(CardModel(id: i * 2 + 1, imgPath: imagePaths[i]));
    }

    _cards.shuffle();
  }
}
