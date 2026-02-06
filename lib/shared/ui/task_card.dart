import 'package:flutter/material.dart';

import '../domain/card_entity.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.cardEntity,
    super.key,
  });

  final CardEntity cardEntity;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      color: Theme.of(context).colorScheme.surfaceContainerLowest,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: SizedBox(
          height: 60,
          child: Text(
            cardEntity.title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}