import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trello_board_state_management/shared/domain/board_entity.dart';
import 'package:trello_board_state_management/trello_riverpod/providers/board_providers.dart';

class BoardNotifier extends AsyncNotifier<BoardEntity> {

  @override
  Future<BoardEntity> build() async {
    final client = ref.watch(boardClientProvider);
    return client.fetchBoard(currentBoard: state.value);
  }

  Future<void> addColumn() async {
    final current = state.value;
    if (current == null) return;

    ref.read(isOverlayLoadingProvider.notifier).state = true;

    /// `guard` removes the need for a try/catch block
    state = await AsyncValue.guard(() async {
      final client = ref.read(boardClientProvider);
      return client.addColumnToBoard(current);
    });

    ref.read(isOverlayLoadingProvider.notifier).state = false;
  }
}
