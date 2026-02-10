import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trello_board_state_management/shared/domain/board_entity.dart';

import '../shared/domain/board_column_entity.dart';
import '../shared/domain/card_entity.dart';

part 'board_page_state.dart';

class BoardPageCubit extends Cubit<BoardPageState> {
  BoardPageCubit() : super(BoardPageLoading());

  Future<void> loadBoard() async {
    try {
      emit(BoardPageLoading());
      // Fake API delay
      await Future.delayed(const Duration(seconds: 2));
      final board = _board;
      if (board.boardColumns.isEmpty) {
        emit(BoardPageEmpty());
      } else {
        emit(BoardPageSuccess(boardEntity: board));
      }
    } catch (e) {
      emit(BoardPageError(errorMessage: e.toString()));
    }
  }

  Future<void> onRefresh() async {
    emit(
      BoardPageRefreshing(
        state is BoardPageSuccess
            ? (state as BoardPageSuccess).boardEntity
            : null,
      ),
    );
    try {
      // Fake refresh delay
      await Future.delayed(const Duration(seconds: 3));

      final board = _board; // Replace with API call

      if (board.boardColumns.isEmpty) {
        emit(BoardPageEmpty());
      } else {
        emit(BoardPageSuccess(boardEntity: board));
      }
    } catch (e) {
      emit(BoardPageError(errorMessage: e.toString()));
    }
  }
}

const _board = BoardEntity(id: 1, boardColumns: _boardColumn);
const _boardColumn = [
  BoardColumnEntity(
    id: 1,
    title: "Ready for Development",
    cards: [
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Second Card",
        description: "This is the second card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Third Card",
        description: "This is the third card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Second Card",
        description: "This is the second card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Third Card",
        description: "This is the third card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Second Card",
        description: "This is the second card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Third Card",
        description: "This is the third card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Second Card",
        description: "This is the second card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Third Card",
        description: "This is the third card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Second Card",
        description: "This is the second card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Third Card",
        description: "This is the third card of the first column",
      ),
    ],
  ),
  BoardColumnEntity(
    id: 2,
    title: "In Progress",
    cards: [
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the second column",
      ),
    ],
  ),
  BoardColumnEntity(
    id: 3,
    title: "In Review",
    cards: [
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the third column",
      ),
      CardEntity(
        id: 1,
        title: "Second Card",
        description: "This is the second card of the third column",
      ),
    ],
  ),
  BoardColumnEntity(
    id: 3,
    title: "Done",
    cards: [
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the third column",
      ),
      CardEntity(
        id: 1,
        title: "Second Card",
        description: "This is the second card of the third column",
      ),
    ],
  ),
  BoardColumnEntity(id: 3, title: "Empty Board Column Example", cards: []),
];
