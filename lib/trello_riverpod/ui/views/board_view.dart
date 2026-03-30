import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trello_board_state_management/shared/core/entities/board_entity.dart';
import 'package:trello_board_state_management/trello_riverpod/providers/board_providers.dart';
import 'package:trello_board_state_management/trello_riverpod/ui/widgets/board_column.dart';

class BoardView extends ConsumerWidget {
  const BoardView({
    required this.board,
    required this.isOverlayLoading,
    super.key,
  });

  final BoardEntity board;
  final bool isOverlayLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: board.boardColumns.length,
          padding: .all(16.0),
          separatorBuilder: (_, _) => const SizedBox(width: 16),
          itemBuilder: (context, index) {
            final columnRef = ref.watch(
              columnProvider(board.boardColumns[index].id),
            );
            if (columnRef.value != null) {
              return BoardColumn(boardColumn: columnRef.value!);
            }
            // return columnRef.when(
            //   data: (value) => BoardColumn(boardColumn: value),
            //   loading: () => const Center(child: CircularProgressIndicator()),
            //   error: (e, _) => const Text("Error"),
            // );
          },
        ),

        // Overlay spinner
        if (isOverlayLoading)
          Positioned.fill(
            child: Container(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
