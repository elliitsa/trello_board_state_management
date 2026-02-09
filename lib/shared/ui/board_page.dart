import 'package:flutter/material.dart';
import 'package:trello_board_state_management/shared/ui/board_column.dart';

import '../domain/board_entity.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({required this.board, super.key});

  final BoardEntity board;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trello Board",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              BoardColumn(boardColumn: board.boardColumns[index]),
          separatorBuilder: (context, index) => SizedBox(width: 8),
          itemCount: board.boardColumns.length,
        ),
      ),
    );
  }
}
