import 'package:trello_board_state_management/shared/domain/board_column_entity.dart';
import 'package:trello_board_state_management/shared/domain/board_entity.dart';
import 'package:trello_board_state_management/shared/domain/card_entity.dart';
import 'package:uuid/uuid.dart';

class BoardClient {
  // TODO use the client for the bloc solution as well

  Future<BoardEntity> fetchBoard() async {
    /// Fake API call delay
    await Future.delayed(const Duration(seconds: 1));
    final board = _board;
    return board;
    /// TODO figure out how to simulate an error to see how riverpod handles errors
  }

  Future<BoardEntity> addColumnToBoard(BoardEntity oldBoard) async {
    /// Fake API call delay
    await Future.delayed(const Duration(seconds: 1));
    final newBoardColumn = BoardColumnEntity(
      id: Uuid().v4(),
      title: null,
      cards: [],
    );
    final newBoardColumns = List<BoardColumnEntity>.from(
      oldBoard.boardColumns,
    )..add(newBoardColumn);
    final newBoard = BoardEntity(id: oldBoard.id, boardColumns: newBoardColumns);
    return newBoard;
  }
}

var uuid = Uuid();
var _boardColumns = [
  BoardColumnEntity(
    id: uuid.v4(),
    title: "Ready for Development",
    cards: [
      CardEntity(guid: uuid.v4(), title: "First Card"),
      CardEntity(guid: uuid.v4(), title: "Second Card"),
      CardEntity(guid: uuid.v4(), title: "Third Card"),
      CardEntity(guid: uuid.v4(), title: "First Card"),
      CardEntity(guid: uuid.v4(), title: "Second Card"),
      CardEntity(guid: uuid.v4(), title: "Third Card"),
      CardEntity(guid: uuid.v4(), title: "First Card"),
      CardEntity(guid: uuid.v4(), title: "Second Card"),
      CardEntity(guid: uuid.v4(), title: "Third Card"),
      CardEntity(guid: uuid.v4(), title: "First Card"),
      CardEntity(guid: uuid.v4(), title: "Second Card"),
      CardEntity(guid: uuid.v4(), title: "Third Card"),
      CardEntity(guid: uuid.v4(), title: "First Card"),
      CardEntity(guid: uuid.v4(), title: "Second Card"),
      CardEntity(guid: uuid.v4(), title: "Third Card"),
    ],
  ),
  BoardColumnEntity(
    id: Uuid().v4(),
    title: "In Progress",
    cards: [CardEntity(guid: uuid.v4(), title: "First Card")],
  ),
  // BoardColumnEntity(
  //   id: Uuid().v4(),
  //   title: "In Review",
  //   cards: [
  //     CardEntity(
  //       guid: uuid.v4(),
  //       title: "First Card",
  //     ),
  //     CardEntity(
  //       guid: uuid.v4(),
  //       title: "Second Card",
  //     ),
  //   ],
  // ),
  // BoardColumnEntity(
  //   id: Uuid().v4(),
  //   title: "Done",
  //   cards: [
  //     CardEntity(
  //       guid: uuid.v4(),
  //       title: "First Card",
  //     ),
  //     CardEntity(
  //       guid: uuid.v4(),
  //       title: "Second Card",
  //     ),
  //   ],
  // ),
  // BoardColumnEntity(id: Uuid().v4(), title: "Empty Board Column Example", cards: []),
];
var _board = BoardEntity(id: 1, boardColumns: _boardColumns);

