import 'package:flutter/material.dart';

class CardModel extends ChangeNotifier {
  final int id;
  final String imgPath;
  bool _isFaceUp = false;
  bool _isMatched = false;

  bool get isFaceUp => _isFaceUp;
  bool get isMatched => _isMatched;

  CardModel({required this.id, required this.imgPath});

  // Flip the card
  void flip() {
    _isFaceUp = !_isFaceUp;
    notifyListeners();
  }

  // Check if two cards match
  void match() {
    _isMatched = true;
    notifyListeners();
  }

  // Reset the card if not a match
  void reset() {
    _isFaceUp = false;
    _isMatched = false;
    notifyListeners();
  }
}
