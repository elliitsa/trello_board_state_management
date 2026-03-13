import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:trello_board_state_management/shared/domain/board_column_entity.dart';

@immutable
class BoardEntity extends Equatable {
  BoardEntity({required this.id, required List boardColumns})
    : boardColumns = List<BoardColumnEntity>.unmodifiable(boardColumns);

  final int id;
  final List<BoardColumnEntity> boardColumns;

  @override
  List<Object?> get props => [id, boardColumns];

  BoardEntity copyWith({int? id, List<BoardColumnEntity>? boardColumns}) {
    return BoardEntity(
      id: id ?? this.id,
      boardColumns: boardColumns ?? this.boardColumns,
    );
  }
}
