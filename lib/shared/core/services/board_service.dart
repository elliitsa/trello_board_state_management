import 'package:trello_board_state_management/shared/core/entities/board_entity.dart';
import 'package:trello_board_state_management/shared/core/entities/card_entity.dart';
import 'package:trello_board_state_management/shared/core/repositories/board_repository.dart';

class BoardService {
  BoardService({required BoardRepository repository})
    : _repository = repository;

  final BoardRepository _repository;

  Future<BoardEntity> fetchBoard() async {
    /// TODO Add error handling
    final id = 1;
    return await _repository.fetchBoard(id: id);
  }

  Future<BoardEntity> updateBoard({required BoardEntity board}) async {
    /// TODO Add error handling
    return await _repository.updateBoard(board: board);
  }

  Future<BoardEntity> addCardToColumn({
    required int boardId,
    required String columnId,
    required CardEntity card,
  }) async {
    final board = await fetchBoard();

    final updatedColumns = board.boardColumns.map((column) {
      if (column.id == columnId) {
        final updatedCards = List<CardEntity>.from(column.cards ?? [])
          ..add(card);
        return column.copyWith(cards: updatedCards);
      }
      return column;
    }).toList();

    final updatedBoard = board.copyWith(boardColumns: updatedColumns);
    return await updateBoard(board: updatedBoard);
  }

  Future<BoardEntity> updateColumnTitle({
    required int boardId,
    required String columnId,
    required String title,
  }) async {
    final board = await fetchBoard();
    final updatedColumns = board.boardColumns.map((column) {
      if (column.id == columnId) {
        return column.copyWith(title: title);
      }
      return column;
    }).toList();

    final updatedBoard = board.copyWith(boardColumns: updatedColumns);
    return updateBoard(board: updatedBoard);
  }
}
