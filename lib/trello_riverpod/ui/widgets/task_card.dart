import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trello_board_state_management/shared/core/entities/card_entity.dart';
import 'package:trello_board_state_management/trello_riverpod/providers/board_providers.dart';

class TaskCard extends ConsumerWidget {
  const TaskCard({required this.cardEntity, super.key});

  final CardEntity cardEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              Flexible(
                child: Form(
                  child: TextFormField(
                    onChanged: (String? value) => ref
                        .read(boardProvider.notifier)
                        .updateCardTitle(
                          cardId: cardEntity.guid,
                          value: value,
                        ),
                    keyboardType: TextInputType.text,
                    initialValue: cardEntity.title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hint: Text(
                        "New card",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                      ),
                    ),
                    maxLines: 3,
                    minLines: 1,
                  ),
                ),
              ),
              IconButton(icon: Icon(Icons.clear), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
