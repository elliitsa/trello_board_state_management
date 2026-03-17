import 'package:trello_board_state_management/shared/core/entities/board_entity.dart';
import 'package:trello_board_state_management/shared/core/repositories/board_repository.dart';

class BoardService {
  BoardService({required BoardRepository repository})
    : _repository = repository;

  final BoardRepository _repository;

  /// Fetches the board
  Future<BoardEntity> fetchBoard() async {
    /// TODO Add error handling
    final id = 1;
    return await _repository.fetchBoard(id: id);
  }

  /// Updates the board
  Future<BoardEntity> updateBoard({required BoardEntity board}) async {
    /// TODO Add error handling
    return await _repository.updateBoard(board: board);
  }
}
