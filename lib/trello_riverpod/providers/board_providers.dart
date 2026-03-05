import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trello_board_state_management/shared/data/board_client.dart';
import 'package:trello_board_state_management/shared/domain/board_entity.dart';

final boardClientProvider = Provider<BoardClient>((ref) {
  return BoardClient();
});

final boardProvider = FutureProvider<BoardEntity>((ref) async {
  final client = ref.watch(boardClientProvider);
  return client.fetchBoard();
});