import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trello_board_state_management/shared/domain/board_entity.dart';
import 'package:uuid/uuid.dart';

import '../shared/domain/board_column_entity.dart';
import '../shared/domain/card_entity.dart';

part 'board_page_state.dart';

class BoardPageCubit extends Cubit<BoardPageState> {
  BoardPageCubit() : super(BoardPageLoading());

  Future<void> loadBoard() async {
    if (state is BoardPageLoading) {
      emit(BoardPageLoading());
    } else {
      emit(
        HasDataState(
          boardEntity: (state as HasDataState).boardEntity,
          isLoading: true,
        ),
      );
    }

    try {
      // Fake API delay
      await Future.delayed(const Duration(seconds: 1));
      BoardEntity board;
      if (state is BoardPageLoading) {  // TOOD fix that for error state
        board = _board;
      } else {
        board = (state as HasDataState).boardEntity;
      }
      if (board.boardColumns.isEmpty) {
        // TODO empty columns means empty page?
        emit(BoardPageEmpty());
      } else {
        emit(HasDataState(boardEntity: board, isLoading: false));
      }
    } on Exception catch (e) {
      emit(
        BoardPageError(errorMessage: e.toString()),
      ); // TODO Can we do a toast here?
    } on Error catch (e) {
      emit(BoardPageError(errorMessage: e.toString()));
    }
  }

  Future<void> addBoardColumn() async {
    if (state is BoardPageLoading) {
      emit(BoardPageLoading());
    } else {
      emit(
        HasDataState(
          boardEntity: (state as HasDataState).boardEntity,
          isLoading: true,
        ),
      );
    }

    try {
      // Fake API delay
      await Future.delayed(const Duration(milliseconds: 500));

      final newBoardColumn = BoardColumnEntity(
        id: Uuid().v4(),
        title: null,
        cards: [],
      );

      final oldBoard = (state as HasDataState).boardEntity;

      final newBoardColumns = List<BoardColumnEntity>.from(oldBoard.boardColumns);
      newBoardColumns.add(newBoardColumn);
      emit(
        HasDataState(
          boardEntity: oldBoard.copyWith(boardColumns: newBoardColumns),
          isLoading: false,
        ),
      );
    } on Exception catch (e) {
      emit(BoardPageError(errorMessage: e.toString()));
    } on Error catch (e) {
      emit(BoardPageError(errorMessage: e.toString()));
    }

    // TODO error handling
  }
}

var uuid = Uuid();

var _board = BoardEntity(id: 1, boardColumns: _boardColumns);
var _boardColumns = [
  BoardColumnEntity(
    id: Uuid().v4(),
    title: "Ready for Development",
    cards: [
      CardEntity(
        guid: uuid.v4(),
        title: "First Card",
        description: "This is the first card of the first column",
      ),
      CardEntity(
        guid: uuid.v4(),
        title: "Second Card",
        description: "This is the second card of the first column",
      ),
      CardEntity(
        guid: uuid.v4(),
        title: "Third Card",
        description: "This is the third card of the first column",
      ),
      CardEntity(
        guid: uuid.v4(),
        title: "First Card",
        description: "This is the first card of the first column",
      ),
      CardEntity(
        guid: uuid.v4(),
        title: "Second Card",
        description: "This is the second card of the first column",
      ),
      CardEntity(
        guid: uuid.v4(),
        title: "Third Card",
        description: "This is the third card of the first column",
      ),
      CardEntity(
        guid: uuid.v4(),
        title: "First Card",
        description: "This is the first card of the first column",
      ),
      CardEntity(
        guid: uuid.v4(),
        title: "Second Card",
        description: "This is the second card of the first column",
      ),
      CardEntity(
        guid: uuid.v4(),
        title: "Third Card",
        description: "This is the third card of the first column",
      ),
      CardEntity(
        guid: uuid.v4(),
        title: "First Card",
        description: "This is the first card of the first column",
      ),
      CardEntity(
        guid: uuid.v4(),
        title: "Second Card",
        description: "This is the second card of the first column",
      ),
      CardEntity(
        guid: uuid.v4(),
        title: "Third Card",
        description: "This is the third card of the first column",
      ),
      CardEntity(
        guid: uuid.v4(),
        title: "First Card",
        description: "This is the first card of the first column",
      ),
      CardEntity(
        guid: uuid.v4(),
        title: "Second Card",
        description: "This is the second card of the first column",
      ),
      CardEntity(
        guid: uuid.v4(),
        title: "Third Card",
        description: "This is the third card of the first column",
      ),
    ],
  ),
  BoardColumnEntity(
    id: Uuid().v4(),
    title: "In Progress",
    cards: [
      CardEntity(
        guid: uuid.v4(),
        title: "First Card",
        description: "This is the first card of the second column",
      ),
    ],
  ),
  // BoardColumnEntity(
  //   id: Uuid().v4(),
  //   title: "In Review",
  //   cards: [
  //     CardEntity(
  //       guid: uuid.v4(),
  //       title: "First Card",
  //       description: "This is the first card of the third column",
  //     ),
  //     CardEntity(
  //       guid: uuid.v4(),
  //       title: "Second Card",
  //       description: "This is the second card of the third column",
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
  //       description: "This is the first card of the third column",
  //     ),
  //     CardEntity(
  //       guid: uuid.v4(),
  //       title: "Second Card",
  //       description: "This is the second card of the third column",
  //     ),
  //   ],
  // ),
  // BoardColumnEntity(id: Uuid().v4(), title: "Empty Board Column Example", cards: []),
];
