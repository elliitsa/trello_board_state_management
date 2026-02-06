import 'package:flutter/material.dart';
import 'package:trello_board_state_management/shared/domain/board_column_entity.dart';
import 'package:trello_board_state_management/shared/ui/task_card.dart';

class BoardColumn extends StatelessWidget {
  const BoardColumn({required this.boardColumn, super.key});

  final BoardColumnEntity boardColumn;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                boardColumn.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              itemCount: boardColumn.cards.length,
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 4),
              itemBuilder: (BuildContext context, int index) {
                return TaskCard(cardEntity: boardColumn.cards[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
