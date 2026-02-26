import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trello Board Roverpod",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
          IconButton.filledTonal(
            onPressed: null,
            icon: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 8),
          IconButton.filledTonal(
            onPressed: null,
            icon: const Icon(Icons.add_box_outlined),
          ),
          const SizedBox(width: 24),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }
}