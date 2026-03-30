import 'package:trello_board_state_management/core.dart';
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

  Future<ColumnEntity> fetchColumn({required String columnId}) async {
    final board = await fetchBoard();
    return board.boardColumns.firstWhere((column) => column.id == columnId);
  }

  Future<BoardEntity> updateBoard({required BoardEntity board}) async {
    /// TODO Add error handling
    return await _repository.updateBoard(board: board);
  }

  Future<BoardEntity> deleteColumn({required String columnId}) async {
    final board = await fetchBoard();
    final updatedColumns = board.boardColumns
        .where((column) => column.id != columnId)
        .toList();

    return await updateBoard(
      board: board.copyWith(boardColumns: updatedColumns),
    );
  }

  Future<ColumnEntity> deleteCard({
    required String columnId,
    required String cardId,
  }) async {
    final board = await fetchBoard();
    final column = board.boardColumns.firstWhere(
      (column) => column.id == columnId,
    );
    final updatedCards =
        column.cards?.where((card) => card.guid != cardId).toList() ?? [];

    final updatedColumns = board.boardColumns.map((column) {
      if (column.id == columnId) {
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

  Future<CardEntity> updateCardTitle({
    required String cardId,
    required String value,
  }) async {
    final board = await fetchBoard();

    /// This is the columnId of the column that consists of the card
    /// (cards have generated guids) TODO do that for other places as well?
    final columnId = board.boardColumns.firstWhere(
      (col) => col.cards?.any((card) => card.guid == cardId) ?? false,
    ).id;

    final updatedColumns = board.boardColumns.map((col) {
      if (col.id != columnId) return col;

      final updatedCards = col.cards?.map((card) {
        return card.guid == cardId ? card.copyWith(title: value) : card;
      }).toList();

      return col.copyWith(cards: updatedCards);
    }).toList();

    await updateBoard(board: board.copyWith(boardColumns: updatedColumns));

    return updatedColumns
        .firstWhere((col) => col.id == columnId)
        .cards!
        .firstWhere((card) => card.guid == cardId);
  }
}
