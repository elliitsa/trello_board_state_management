import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trello_board_state_management/shared/core/entities/column_entity.dart';
import 'package:trello_board_state_management/trello_bloc/cubits/board_column_cubit.dart';
import 'package:trello_board_state_management/trello_bloc/cubits/board_page_cubit.dart';

class BoardTitle extends StatelessWidget {
  const BoardTitle({required this.boardColumn, super.key});

  final ColumnEntity? boardColumn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
            child: Form(
              child: TextFormField(
                onChanged: context.read<BoardColumnCubit>().editColumnTitle,
                keyboardType: TextInputType.text,
                initialValue: boardColumn?.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hint: Text(
                    "Add title",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                ),
                maxLines: 3,
                minLines: 1,
              ),
            ),
          ),
          SizedBox(width: 8),
          Badge.count(
            count: boardColumn?.cards?.length ?? 0,
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            padding: .all(4),
          ),
          SizedBox(width: 8),
          IconButton(
            onPressed: () {
              context.read<BoardPageCubit>().deleteColumn(boardColumn!.id);
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
