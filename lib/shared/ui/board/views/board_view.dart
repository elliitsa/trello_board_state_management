import 'package:flutter/material.dart';

import '../../../domain/board_entity.dart';
import '../widgets/board_column.dart';

class BoardView extends StatelessWidget {
  const BoardView({
    required this.board,
    required this.isOverlayLoading,
    super.key,
  });

  final BoardEntity board;
  final bool isOverlayLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: board.boardColumns.length,
          padding: .all(16.0),
          separatorBuilder: (_, _) => const SizedBox(width: 16),
          itemBuilder: (context, index) =>
              BoardColumn(boardColumn: board.boardColumns[index]),
        ),

        // Overlay spinner
        if (isOverlayLoading)
          Positioned.fill(
            child: Container(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
              ),
            ),
          ),
      ],
    );
  }
}