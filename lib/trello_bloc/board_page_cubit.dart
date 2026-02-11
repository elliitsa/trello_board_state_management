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
      // Technically not needed given that initial state == loading state but
      // if you were to start loading different boards with the same cubit
      // that would change the story, equatable picks this up anyway.
      emit(BoardPageLoading());
      // Fake API delay
      await Future.delayed(const Duration(seconds: 2));
      // What do you think about the lint rule `always_declare_types`?
      // Maurits and I have been using it and I gotta be honest I can't live
      // without it.
      final board = _board;
      if (board.boardColumns.isEmpty) {
        emit(BoardEmptyPage());
      } else {
        emit(BoardPageSuccess(boardEntity: board));
      }
      // There is a lint rule for this that is not even in recommended but I
      // think it should. I would personally always do `on Exception catch (e)`
      // or even `on DomainException catch (e)` and then have a
      // `on Exception catch (e)` secondary clause where you can emit some
      // "Unknown error" state.
      //
      // Reason why you would at least do `on Exception` is because you would
      // also be catching `Error` objects here which are actually meant
      // for yelling at developers and not get swept up in the user flow.
    } catch (e) {
      emit(BoardPageError(errorMessage: e.toString()));
    }
  }

  // Hooking onto the commend I left on `BoardEntity` a challenge:
  // The user loads a board with an ID that lets just pretend is
  // coming from the device, so that fetch goes right.
  // However, when the initial fetch happens the user forgets they are offline
  // and the fetching function enters an ErrorState. How would you
  // get this refresh to work, where would you fetch the ID from?
  Future<void> onRefresh() async {
    if (state is! BoardPageSuccess) {
      // if previous state is empty, show loading view
      emit(BoardPageLoading());
    } else {
      emit(BoardPageRefreshing((state as BoardPageSuccess).boardEntity));
    }

    // Technically code duplication, you could consider things like
    // expanding the loading state to also have something like
    // nullable BoardEntity and a flag for whether its a refreshing load
    // or an initial load, and then you could also just call the `loadBoard`
    // method.
    try {
      // Fake refresh delay
      await Future.delayed(const Duration(seconds: 3));

      final board = _board; // Replace with API call

      if (board.boardColumns.isEmpty) {
        emit(BoardEmptyPage());
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
