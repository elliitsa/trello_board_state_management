import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trello_board_state_management/shared/data/board_client.dart';
import 'package:trello_board_state_management/shared/domain/board_entity.dart';
import 'package:trello_board_state_management/trello_riverpod/providers/board_providers.dart';

class BoardNotifier extends AsyncNotifier<BoardEntity> {
  late BoardClient client;

  @override
  Future<BoardEntity> build() async {
    client = ref.read(boardClientProvider);
    return client.fetchBoard();
  }

  Future<void> addColumn() async {
    final current = state.value;
    if (current == null) return;

    state = AsyncData(await client.addColumnToBoard(current));
  }
}
