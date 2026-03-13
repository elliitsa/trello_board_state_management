import 'package:trello_board_state_management/shared/data/dtos/column_dto.dart';
import 'package:trello_board_state_management/shared/domain/board_entity.dart';

class BoardDto {
  const BoardDto({required this.id, required this.boardColumns});

  final int id;
  final List<BoardColumnDto> boardColumns;

  factory BoardDto.fromJson(Map<String, dynamic> json) {
    return BoardDto(
      id: json['id'] as int,
      boardColumns: (json['boardColumns'] as List<dynamic>)
          .map((e) => BoardColumnDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'boardColumns': boardColumns.map((c) => c.toJson()).toList(),
    };
  }

  factory BoardDto.fromEntity(BoardEntity entity) {
    return BoardDto(
      id: entity.id,
      boardColumns: entity.boardColumns.map(BoardColumnDto.fromEntity).toList(),
    );
  }

  BoardEntity toEntity() {
    return BoardEntity(
      id: id,
      boardColumns: boardColumns.map((c) => c.toEntity()).toList(),
    );
  }
}
