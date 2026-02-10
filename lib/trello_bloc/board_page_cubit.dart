import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'board_page_state.dart';

class BoardPageCubit extends Cubit<BoardPageState> {
  BoardPageCubit() : super(BoardPageInitial());

  void loadBoard() async {
    emit(BoardPageLoading());
    // delay to fake an api call
    await Future.delayed(Duration(seconds: 2));
    emit(BoardPageSuccess());
  }

  Future<void> onRefresh() async {
    emit(BoardPageLoading());
    // delay to fake an api call
    await Future.delayed(Duration(seconds: 4));
    emit(BoardPageSuccess());
  }
}
