import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'board_column_entity.dart';

@immutable
class BoardEntity extends Equatable {
  // Given that boards have ids you could consider faking the incorporation
  // of this when you are "fetching" the board.
  // `getBoard(id: id)`
  final int id;
  final List<BoardColumnEntity> boardColumns;

  const BoardEntity({
    required this.id,
    required this.boardColumns,
  });

  @override
  List<Object?> get props => [id, boardColumns];
}
