import 'package:trello_board_state_management/shared/core/entities/board_entity.dart';

abstract interface class BoardRepository {
  Future<void> clear();

  Future<BoardEntity> fetchBoard({required int id});

  Future<BoardEntity> updateBoard({required BoardEntity board});
}
