import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trello_board_state_management/core.dart';

part 'board_column_state.dart';

class BoardColumnCubit extends Cubit<BoardColumnState> {
  BoardColumnCubit({
    required BoardService service,
    required ColumnEntity boardColumn,
  }) : _service = service,
       super(BoardColumnState(boardColumnEntity: boardColumn));

  final BoardService _service;

  Future<void> fetchColumn(String? columnId) async {
    final fetchedColumn = await _service.fetchColumn(
      columnId: state.boardColumnEntity.id,
    );

    emit(state.copyWith(boardColumnEntity: fetchedColumn, loading: false));
  }

  Future<void> addCard() async {
    emit(state.copyWith(loading: true));

    final updatedBoardColumn = await _service.addCardToColumn(
      columnId: state.boardColumnEntity.id,
    );

    emit(
      state.copyWith(boardColumnEntity: updatedBoardColumn, loading: false),
    ); // TODO updates the loading view
  }

  void editColumnTitle(String? value) async {
    // TODO add loading indicator after a change with a debounce

    emit(state.copyWith(loading: true));

    final updatedBoardColumn = await _service.updateColumnTitle(
      columnId: state.boardColumnEntity.id,
      title: value ?? "Add title",
    );

    emit(state.copyWith(boardColumnEntity: updatedBoardColumn, loading: false));
  }
}
