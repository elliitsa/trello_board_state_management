import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trello_board_state_management/shared/core/entities/column_entity.dart';
import 'package:trello_board_state_management/shared/core/entities/board_entity.dart';
import 'package:trello_board_state_management/trello_riverpod/providers/board_providers.dart';

class BoardNotifier extends AsyncNotifier<BoardEntity> {
  @override
  Future<BoardEntity> build() async {
    final service = ref.watch(boardServiceProvider);
    return service.fetchBoard();
  }

  Future<void> addColumn() async {
    final current = state.value;
    if (current == null) return;

    ref.read(isOverlayLoadingProvider.notifier).state = true;

    /// TODO `guard` removes the need for a try/catch block

    final service = ref.read(boardServiceProvider);

    final newB = BoardEntity(
      id: current.id,
      boardColumns: [...current.boardColumns, ColumnEntity.empty()],
    );

    state = AsyncData(await service.updateBoard(board: newB));

    ref.read(isOverlayLoadingProvider.notifier).state = false;
  }

  Future<void> updateColumnTitle(String columnId, String? title) async {
    final current = state.value;
    if (current == null) return;

    ref.read(isOverlayLoadingProvider.notifier).state =
        true; // TODO add debounce

    final service = ref.read(boardServiceProvider);
    final result = await service.updateColumnTitle(
      columnId: columnId,
      title: title ?? '',
    );

    state = AsyncData(
      BoardEntity(
        id: current.id,
        boardColumns: current.boardColumns
            .map((column) => column.id == columnId ? result : column)
            .toList(),
      ),
    );

    ref.read(isOverlayLoadingProvider.notifier).state = false;
  }

  Future<void> deleteColumn(String columnId) async {
    final current = state.value;
    if (current == null) return;

    ref.read(isOverlayLoadingProvider.notifier).state = true;

    /// TODO do I need to instantiate the service in each method?
    final service = ref.read(boardServiceProvider);
    final result = await service.deleteColumn(columnId: columnId);

    state = AsyncData(result);

    ref.read(isOverlayLoadingProvider.notifier).state = false;
  }

}
