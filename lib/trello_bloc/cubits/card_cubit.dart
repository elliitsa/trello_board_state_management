import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trello_board_state_management/core.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit({
    required BoardService service,
    required CardEntity card,
  }) : _service = service,
       super(CardState(cardEntity: card));

  final BoardService _service;

  void editCardTitle({required String columnId, String? value}) async {
    // TODO add loading indicator after a change with a debounce

    emit(state.copyWith(loading: true));

    final updatedCard = await _service.updateCardTitle(
      cardId: state.cardEntity.guid,
      columnId: columnId,
      value: value ?? "Add card",
    );

    emit(state.copyWith(cardEntity: updatedCard, loading: false));
  }
}
