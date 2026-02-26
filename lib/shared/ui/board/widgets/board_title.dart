import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trello_board_state_management/trello_bloc/board_column_cubit.dart';
import 'package:trello_board_state_management/shared/domain/board_column_entity.dart';

class BoardTitle extends StatelessWidget {
  const BoardTitle({required this.boardColumn, super.key});

  final BoardColumnEntity? boardColumn;

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
          if (boardColumn != null)
            Badge.count(
              count: boardColumn?.cards?.length ?? 0,
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              padding: .all(4),
            ),
        ],
      ),
    );
  }
}
