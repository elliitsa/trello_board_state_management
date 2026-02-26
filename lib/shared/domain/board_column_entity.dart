import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:trello_board_state_management/shared/domain/card_entity.dart';

@immutable
class BoardColumnEntity extends Equatable {
  BoardColumnEntity({
    required this.id,
    required this.title,
    List<CardEntity>? cards,
  }) : cards = List<CardEntity>.unmodifiable(cards ?? const []);

  final String id;
  final String? title;
  final List<CardEntity>? cards;

  @override
  List<Object?> get props => [id, title, cards];

  BoardColumnEntity copyWith({String? title, List<CardEntity>? cards}) {
    return BoardColumnEntity(
      id: id,
      title: title ?? this.title,
      cards: cards ?? this.cards,
    );
  }
}
