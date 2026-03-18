import 'package:trello_board_state_management/core.dart';
import 'package:trello_board_state_management/shared/core/entities/board_entity.dart';
import 'package:trello_board_state_management/shared/core/entities/card_entity.dart';
import 'package:trello_board_state_management/shared/core/repositories/board_repository.dart';
import 'package:uuid/uuid.dart';

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

  // TODO add also loading for riverpod
  Future<ColumnEntity> addCardToColumn({required String columnId}) async {
    final board = await fetchBoard();
    final card = CardEntity(guid: Uuid().v4(), title: "New Card");

    final updatedColumns = board.boardColumns.map((column) {
      if (column.id == columnId) {
        final updatedCards = List<CardEntity>.from(column.cards ?? [])
          ..add(card);
        return column.copyWith(cards: updatedCards);
      }
      return column;
    }).toList();

    final updatedBoard = await updateBoard(
      board: board.copyWith(boardColumns: updatedColumns),
    );
    return updatedBoard.boardColumns.firstWhere(
      (column) => column.id == columnId,
    );
  }

  Future<ColumnEntity> updateColumnTitle({
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

    final updatedBoard = await updateBoard(
      board: board.copyWith(boardColumns: updatedColumns),
    );
    return updatedBoard.boardColumns.firstWhere(
          (column) => column.id == columnId,
    );
  }
}
