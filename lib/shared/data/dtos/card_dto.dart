
import 'package:trello_board_state_management/shared/core/entities/card_entity.dart';

class CardDto {
  const CardDto({required this.guid, required this.title});

  final String guid;
  final String title;

  factory CardDto.fromJson(Map<String, dynamic> json) {
    return CardDto(
      guid: json['guid'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'guid': guid, 'title': title};
  }

  factory CardDto.fromEntity(CardEntity entity) {
    return CardDto(guid: entity.guid, title: entity.title);
  }

  CardEntity toEntity() {
    return CardEntity(guid: guid, title: title);
  }
}
