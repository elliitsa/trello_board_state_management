import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trello_board_state_management/shared/ui/board_column.dart';
import 'package:trello_board_state_management/trello_bloc/board_page_cubit.dart';

import '../domain/board_entity.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trello Board",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
          IconButton.filledTonal(
            onPressed: () {
              context.read<BoardPageCubit>().loadBoard();
            },
            icon: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 8),
          IconButton.filledTonal(
            onPressed: null,
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

          if (state is BoardPageLoading && state.boardEntity == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BoardEmptyPage) {
            return BoardPageEmpty();
          }
          if (state is BoardPageError) {
            return SizedBox.expand(
              child: ColoredBox(
                color: Theme.of(context).colorScheme.errorContainer,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    state.errorMessage,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ),
            );
          }

          BoardEntity board;

          if (state is BoardPageSuccess) {
            board = state.boardEntity;
          } else if (state is BoardPageLoading && state.boardEntity != null) {
            board = state.boardEntity!;
            isOverlayLoading = true;
          } else {
            return const SizedBox.shrink();
          }

          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: board.boardColumns.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (context, index) =>
                      BoardColumn(boardColumn: board.boardColumns[index]),
                ),
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
        },
      ),
    );
  }
}

class BoardPageEmpty extends StatelessWidget {
  const BoardPageEmpty({super.key});

  @override
  Widget build(BuildContext context) {

    // TODO return an empty board column entity; let the board column widget take display an empty state
    return Center(child: Text("Empty", style: TextStyle(color: Colors.black)));
  }
}
