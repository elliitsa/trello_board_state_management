import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trello_board_state_management/trello_riverpod/providers/board_providers.dart';
import 'package:trello_board_state_management/trello_riverpod/ui/views/board_view.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trello Board Riverpod",
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
      body: Consumer(
        builder: (context, ref, child) {
          final board = ref.watch(boardProvider); // TODO
          // return BoardView(board: board, isOverlayLoading: false);
          return switch (board) {
            /// When the request completes successfully
            AsyncValue(:final value?) => BoardView(
              board: value,
              isOverlayLoading: false, // TODO
            ),

            /// On error
            AsyncValue(error: != null) => const Text('Error fetching joke'),

            /// Loading
            AsyncValue() => const Center(child: CircularProgressIndicator()),
          };
        },
      ),
      // TODO add a mock API, perhaps even share it between bloc and riverpod
    );
  }
}
