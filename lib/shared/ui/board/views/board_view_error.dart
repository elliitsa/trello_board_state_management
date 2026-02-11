import 'package:flutter/material.dart';

class BoardViewError extends StatelessWidget {
  const BoardViewError({required this.errorMessage, super.key});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ColoredBox(
        color: Theme.of(context).colorScheme.errorContainer,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            errorMessage,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.onErrorContainer,
            ),
          ),
        ),
      ),
    );
  }
}