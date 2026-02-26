import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trello_board_state_management/shared/domain/board_column_entity.dart';
import 'package:trello_board_state_management/shared/ui/board/widgets/task_card.dart';
import 'package:trello_board_state_management/trello_bloc/board_column_cubit.dart';
import 'package:trello_board_state_management/shared/ui/board/widgets/board_title.dart';

class BoardColumn extends StatelessWidget {
  const BoardColumn({required BoardColumnEntity boardColumn, super.key})
    : _boardColumn = boardColumn;

  const BoardColumn.empty({super.key}) : _boardColumn = null;

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
        child: BlocProvider<BoardColumnCubit>(
          create: (context) =>
              BoardColumnCubit(boardColumnEntity: _boardColumn),
          child: BlocBuilder<BoardColumnCubit, BoardColumnState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BoardTitle(boardColumn: state.boardColumnEntity),
                  SizedBox(height: 16),
                  if (state.boardColumnEntity?.cards != null)
                    Flexible(
                      child: SingleChildScrollView(
                        child: ListView.separated(
                          shrinkWrap: true,
                          key: ValueKey(state.boardColumnEntity!.cards),
                          itemCount:
                              state.boardColumnEntity!.cards?.length ?? 0,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(height: 4),
                          itemBuilder: (BuildContext context, int index) {
                            return TaskCard(
                              cardEntity:
                                  state.boardColumnEntity!.cards![index],
                            );
                          },
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextButton.icon(
                      onPressed: () {
                        context.read<BoardColumnCubit>().addCard(
                          cardTitle: "New Card",
                        );
                      },
                      label: Text("Add a card"),
                      icon: Icon(Icons.add),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
