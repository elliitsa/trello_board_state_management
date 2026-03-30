import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trello_board_state_management/shared/core/entities/column_entity.dart';
import 'package:trello_board_state_management/trello_riverpod/providers/board_providers.dart';
import 'package:trello_board_state_management/trello_riverpod/ui/widgets/board_title.dart';
import 'package:trello_board_state_management/trello_riverpod/ui/widgets/task_card.dart';

class BoardColumn extends ConsumerWidget {
  const BoardColumn({required ColumnEntity boardColumn, super.key})
    : _boardColumn = boardColumn;

  final ColumnEntity? _boardColumn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 350,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BoardTitle(boardColumn: _boardColumn),
            SizedBox(height: 16),
            if (_boardColumn?.cards != null)
              Flexible(
                child: SingleChildScrollView(
                  child: ListView.separated(
                    shrinkWrap: true,
                    key: ValueKey(_boardColumn!.cards),
                    itemCount: _boardColumn.cards?.length ?? 0,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 4),
                    itemBuilder: (BuildContext context, int index) {
                      return TaskCard(cardEntity: _boardColumn.cards![index]);
                    },
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextButton.icon(
                onPressed: () {
                  ref.read(boardProvider.notifier).addCard(_boardColumn!.id);
                },
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
