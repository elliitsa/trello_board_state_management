import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trello_board_state_management/shared/core/entities/board_entity.dart';
import 'package:trello_board_state_management/trello_bloc/cubits/board_page_cubit.dart';

import 'package:trello_board_state_management/trello_bloc/ui/views/board_view.dart';
import 'package:trello_board_state_management/trello_bloc/ui/views/board_view_error.dart';
import 'package:trello_board_state_management/trello_bloc/ui/widgets/board_column.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trello Board BloC",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
          IconButton.filledTonal(
            onPressed: context.read<BoardPageCubit>().loadBoard,
            icon: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 8),
          IconButton.filledTonal(
            onPressed: context.read<BoardPageCubit>().addBoardColumn,
            icon: const Icon(Icons.add_box_outlined),
          ),
          const SizedBox(width: 24),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: BlocBuilder<BoardPageCubit, BoardPageState>(
        builder: (context, state) {
          bool isOverlayLoading = false;

          if (state is BoardPageLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BoardPageEmpty) {
            return Padding(padding: .all(16.0), child: BoardColumn.empty());
          }
          if (state is BoardPageError) {
            return BoardViewError();
          }

          BoardEntity board;

          if (state is HasDataState) {
            board = state.boardEntity;
            if (state.isLoading) {
              isOverlayLoading = true;
            }
          } else {
            return const SizedBox.shrink();
          }

          return BoardView(board: board, isOverlayLoading: isOverlayLoading);
        },
      ),
    );
  }
}
