import 'package:flutter/material.dart';
import 'package:trello_board_state_management/shared/domain/board_column_entity.dart';
import 'package:trello_board_state_management/trello_riverpod/ui/widgets/board_title.dart';
import 'package:trello_board_state_management/trello_riverpod/ui/widgets/task_card.dart';

class BoardColumn extends StatelessWidget {
  const BoardColumn({required BoardColumnEntity boardColumn, super.key})
    : _boardColumn = boardColumn;

  const BoardColumn.empty({super.key})
    : _boardColumn = null; // TODO use it somewhere?

  final BoardColumnEntity? _boardColumn;

  @override
  Widget build(BuildContext context) {
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
                      return TaskCard(
                        cardEntity: _boardColumn.cards![index],
                      );
                    },
                  ),
                ),
              ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8.0),
            //   child: TextButton.icon(
            //     onPressed: () {
            //       context.read<BoardColumnCubit>().addCard(
            //         cardTitle: "New Card",
            //       );
            //     },
            //     label: Text("Add a card"),
            //     icon: Icon(Icons.add),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
