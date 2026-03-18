import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trello_board_state_management/core.dart';

part 'board_page_state.dart';

class BoardPageCubit extends Cubit<BoardPageState> {
  BoardPageCubit({required BoardService service})
    : _service = service,
      super(BoardPageLoading());

  final BoardService _service;

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
      final board = await _service.fetchBoard();

      if (board.boardColumns.isEmpty) {
        emit(BoardPageEmpty());
      } else {
        emit(HasDataState(boardEntity: board, isLoading: false));
      }
    } on Exception catch (e) {
      /// TODO please fix this...
      print('Exception details:\n $e');
      emit(BoardPageError());
    } on Error catch (e) {
      print('Error details:\n $e');
      emit(BoardPageError());
    } catch (e, s) {
      print('Error details:\n $e');
      print('Stack details:\n $s');
      emit(BoardPageError());
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
      final newBoardColumn = ColumnEntity.empty();

      final oldBoard = (state as HasDataState).boardEntity;

      final newBoardColumns = List<ColumnEntity>.from(oldBoard.boardColumns);
      newBoardColumns.add(newBoardColumn);

      final newBoard = await _service.updateBoard(
        board: oldBoard.copyWith(boardColumns: newBoardColumns),
      );

      emit(HasDataState(boardEntity: newBoard, isLoading: false));
    } on Exception catch (e) {
      print('Exception details:\n $e');
    } on Error catch (e) {
      print('Error details:\n $e');
    } catch (e, s) {
      print('Error details:\n $e');
      print('Stack details:\n $s');
    }
  }
}
