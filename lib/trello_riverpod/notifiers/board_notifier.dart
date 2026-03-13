import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trello_board_state_management/shared/domain/board_entity.dart';
import 'package:trello_board_state_management/trello_riverpod/providers/board_providers.dart';

class BoardNotifier extends AsyncNotifier<BoardEntity> {
  @override
  Future<BoardEntity> build() async {
    final repository = ref.watch(SharedPreferencesBoardRepositoryProvider);
    return repository.fetchBoard(id: state.value!.id);
  }

  Future<void> addColumn() async {
    final current = state.value;
    if (current == null) return;

    ref.read(isOverlayLoadingProvider.notifier).state = true;

    /// `guard` removes the need for a try/catch block
    state = await AsyncValue.guard(() async {
      final repository = ref.read(SharedPreferencesBoardRepositoryProvider);

      final newB = BoardEntity(
        id: current.id,
        boardColumns: [
          ...current.boardColumns,
          current.boardColumns.length + 1,
        ],
      );

      return await repository.updateBoard(board: newB);
    });

    ref.read(isOverlayLoadingProvider.notifier).state = false;
  }
}
