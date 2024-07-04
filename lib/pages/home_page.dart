import 'package:card_match_app/card_component.dart';
import 'package:card_match_app/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Card Match'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              gameProvider.resetGame();
            },
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: gameProvider.cards.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: gameProvider.cards[index],
            child: const CardComponent(),
          );
        },
      ),
    );
  }
}
