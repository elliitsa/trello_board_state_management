import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trello_board_state_management/shared/core/entities/column_entity.dart';
import 'package:trello_board_state_management/shared/core/entities/board_entity.dart';
import 'package:trello_board_state_management/trello_riverpod/providers/board_providers.dart';

class BoardNotifier extends AsyncNotifier<BoardEntity> {
  @override
  Future<BoardEntity> build() async {
    final service = ref.watch(boardServiceProvider);
    return service.fetchBoard(id: 1);
  }

  Future<void> addColumn() async {
    final current = state.value;
    if (current == null) return;

    ref.read(isOverlayLoadingProvider.notifier).state = true;

    /// `guard` removes the need for a try/catch block

    final service = ref.read(boardServiceProvider);

    final newB = BoardEntity(
      id: current.id,
      boardColumns: [
        ...current.boardColumns,
        ColumnEntity(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: "New Column",
          cards: [],
        ),
      ],
    );

    state = AsyncData(await service.updateBoard(board: newB));

    ref.read(isOverlayLoadingProvider.notifier).state = false;
  }
}
