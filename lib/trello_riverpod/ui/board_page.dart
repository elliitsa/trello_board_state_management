import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trello_board_state_management/shared/data/shared_preferences_board_repository.dart';
import 'package:trello_board_state_management/trello_riverpod/providers/board_providers.dart';
import 'package:trello_board_state_management/trello_riverpod/ui/views/board_view.dart';

class BoardPage extends ConsumerWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boardRef = ref.watch(boardProvider);
    final isOverlayLoadingRef = ref.watch(isOverlayLoadingProvider);

    return Scaffold(
      // clean arch violation detected beep
      floatingActionButton: FloatingActionButton(onPressed: () async => SharedPreferencesBoardRepository().clear()),
      appBar: AppBar(
        title: Text(
          "Trello Board Riverpod",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
          IconButton.filledTonal(
            onPressed: () => ref.refresh(boardProvider),
            icon: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 8),
          IconButton.filledTonal(
            onPressed: () => ref.read(boardProvider.notifier).addColumn(),
            icon: const Icon(Icons.add_box_outlined),
          ),
          const SizedBox(width: 24),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: boardRef.when(
        data: (value) => BoardView(
          board: value,
          isOverlayLoading: isOverlayLoadingRef || boardRef.isRefreshing,
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => const Text("Error"),
      ),
    );
  }
}
