import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trello_board_state_management/shared/core/entities/column_entity.dart';
import 'package:trello_board_state_management/shared/core/entities/card_entity.dart';
import 'package:uuid/uuid.dart';

part 'board_column_state.dart';

class BoardColumnCubit extends Cubit<BoardColumnState> {
  BoardColumnCubit({required ColumnEntity? boardColumnEntity})
    : super(BoardColumnState(boardColumnEntity: boardColumnEntity));

  Future<void> addCard({required String cardTitle}) async {
    final newCard = CardEntity(guid: Uuid().v4(), title: cardTitle);

    final oldCardList = state.boardColumnEntity?.cards;
    final newCardList = List<CardEntity>.from(oldCardList!);
    newCardList.add(newCard);

    emit(
      state.copyWith(
        boardColumnEntity: state.boardColumnEntity?.copyWith(
          cards: newCardList,
        ),
      ),
    );
  }

  void editColumnTitle(String? value) {
    emit(
      state.copyWith(
        boardColumnEntity: state.boardColumnEntity?.copyWith(
          title: value ?? "Add title",
        ),
      ),
    );
  }
}
