import 'package:trello_board_state_management/shared/data/dtos/card_dto.dart';
import 'package:trello_board_state_management/shared/domain/board_column_entity.dart';

class BoardColumnDto {
  const BoardColumnDto({required this.id, required this.title, this.cards});

  final String id;
  final String? title;
  final List<CardDto>? cards;

  factory BoardColumnDto.fromJson(Map<String, dynamic> json) {
    return BoardColumnDto(
      id: json['id'] as String,
      title: json['title'] as String?,
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => CardDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      if (cards != null) 'cards': cards!.map((c) => c.toJson()).toList(),
    };
  }

  factory BoardColumnDto.fromEntity(BoardColumnEntity entity) {
    return BoardColumnDto(
      id: entity.id,
      title: entity.title,
      cards: entity.cards?.map(CardDto.fromEntity).toList(),
    );
  }

  BoardColumnEntity toEntity() {
    return BoardColumnEntity(
      id: id,
      title: title,
      cards: cards?.map((c) => c.toEntity()).toList(),
    );
  }
}
