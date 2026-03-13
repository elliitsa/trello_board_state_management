import 'package:trello_board_state_management/shared/domain/board_entity.dart';

abstract interface class BoardRepository {
  Future<BoardEntity> fetchBoard({required int id});
  Future<BoardEntity> updateBoard({required BoardEntity board});
}
