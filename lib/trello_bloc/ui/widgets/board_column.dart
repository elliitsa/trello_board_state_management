import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trello_board_state_management/shared/core/entities/column_entity.dart';
import 'package:trello_board_state_management/trello_bloc/cubits/board_column_cubit.dart';
import 'package:trello_board_state_management/trello_bloc/ui/widgets/board_title.dart';
import 'package:trello_board_state_management/trello_bloc/ui/widgets/task_card.dart';

class BoardColumn extends StatelessWidget {
  const BoardColumn({required ColumnEntity boardColumn, super.key})
    : _boardColumn = boardColumn;

  const BoardColumn.empty({super.key}) : _boardColumn = null;

  final ColumnEntity? _boardColumn;

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
