import 'package:flutter/cupertino.dart';

import 'board_column_entity.dart';

@immutable
class BoardEntity {
  final int id;
  final List<BoardColumnEntity> boardColumns;

  const BoardEntity({
    required this.id,
    required this.boardColumns,
  });
}
