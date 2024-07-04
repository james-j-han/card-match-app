import 'package:card_match_app/models/card_model.dart';
import 'package:flutter/material.dart';

class GameProvider with ChangeNotifier {
  final List<CardModel> _cards = [];
  CardModel? _firstCard;
  CardModel? _secondCard;
  bool _isWon = false;

  GameProvider() {
    _initCards();
  }

  List<CardModel> get cards => _cards;

  void _initCards() {
    final List<String> imagePaths = [
      'assets/images/ace.png',
      'assets/images/circle.png',
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

  void flipCard(CardModel card) async {
    if (_firstCard == null) {
      _firstCard = card;
      card.flip();
    } else if (_secondCard == null) {
      _secondCard = card;
      card.flip();

      if (_firstCard!.imgPath == _secondCard!.imgPath) {
        _firstCard!.match();
        _secondCard!.match();
        _resetCards();
        _checkWin();
      } else {
        await Future.delayed(const Duration(seconds: 1), () {
          _firstCard!.flip();
          _secondCard!.flip();
        });

        _resetCards();
      }
    }
    notifyListeners();
  }

  void _resetCards() {
    _firstCard = null;
    _secondCard = null;
  }

  void resetGame() {
    _cards.forEach((card) => card.reset());
    _cards.shuffle();
    _firstCard = null;
    _secondCard = null;
    _isWon = false;
    notifyListeners();
  }

  void _checkWin() {
    _isWon = _cards.every((card) => card.isMatched);
    if (_isWon) {
      print('You won!');
      notifyListeners();
    }
  }
}
