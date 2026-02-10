import 'package:flutter/material.dart';
import 'package:trello_board_state_management/shared/domain/board_column_entity.dart';
import 'package:trello_board_state_management/shared/ui/task_card.dart';

class BoardColumn extends StatelessWidget {
  const BoardColumn({required this.boardColumn, super.key});

  final BoardColumnEntity boardColumn;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 350,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BoardTitle(boardColumn: boardColumn),
            SizedBox(height: 16),
            Flexible(
              child: SingleChildScrollView(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: boardColumn.cards.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 4),
                  itemBuilder: (BuildContext context, int index) {
                    return TaskCard(cardEntity: boardColumn.cards[index]);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextButton.icon(
                onPressed: null,
                label: Text("Add a card"),
                icon: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoardTitle extends StatelessWidget {
  const BoardTitle({super.key, required this.boardColumn});

  final BoardColumnEntity boardColumn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
            child: Text(
              boardColumn.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              maxLines: 3,
            ),
          ),
          SizedBox(width: 8),
          Badge.count(
            count: boardColumn.cards.length,
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            padding: .all(4),
          ),
        ],
      ),
    );
  }
}
