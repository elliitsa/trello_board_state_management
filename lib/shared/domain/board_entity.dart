import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'board_column_entity.dart';

@immutable
class BoardEntity extends Equatable {
  BoardEntity({
    required this.id,
    required List boardColumns,
  }) : boardColumns = List<BoardColumnEntity>.unmodifiable(boardColumns);

  final int id;
  final List<BoardColumnEntity> boardColumns;

  @override
  List<Object?> get props => [id, boardColumns];

  BoardEntity copyWith({
    int? id,
    List<BoardColumnEntity>? boardColumns,
  }) {
    return BoardEntity(
      id: id ?? this.id,
      boardColumns: boardColumns ?? this.boardColumns,
    );
  }
}
