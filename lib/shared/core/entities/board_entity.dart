import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:trello_board_state_management/shared/core/entities/column_entity.dart';

@immutable
class BoardEntity extends Equatable {
  BoardEntity({required this.id, required List<ColumnEntity> boardColumns})
    : boardColumns = List<ColumnEntity>.unmodifiable(boardColumns);

  final int id;
  final List<ColumnEntity> boardColumns;

  @override
  List<Object?> get props => [id, boardColumns];

  BoardEntity copyWith({int? id, List<ColumnEntity>? boardColumns}) {
    return BoardEntity(
      id: id ?? this.id,
      boardColumns: boardColumns ?? this.boardColumns,
    );
  }
}
