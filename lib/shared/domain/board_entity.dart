import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'board_column_entity.dart';

@immutable
class BoardEntity extends Equatable {
  final int id;
  final List<BoardColumnEntity> boardColumns;

  const BoardEntity({
    required this.id,
    required this.boardColumns,
  });

  @override
  List<Object?> get props => [id, boardColumns];
}
