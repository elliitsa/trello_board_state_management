import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trello_board_state_management/shared/core/entities/card_entity.dart';
import 'package:trello_board_state_management/trello_bloc/cubits/board_column_cubit.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({required this.cardEntity, super.key});

  final CardEntity cardEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceContainerLowest,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardEntity.title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  context.read<BoardColumnCubit>().deleteCard(
                    cardId: cardEntity.guid,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
