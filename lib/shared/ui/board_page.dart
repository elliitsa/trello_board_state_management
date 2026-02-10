import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trello_board_state_management/shared/ui/board_column.dart';
import 'package:trello_board_state_management/trello_bloc/board_page_cubit.dart';

import '../domain/board_entity.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({required this.board, super.key});

  final BoardEntity board;

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
            onPressed: () async {
              await context.read<BoardPageCubit>().onRefresh();
            },
            icon: Icon(Icons.refresh),
          ),
          SizedBox(width: 8),
          IconButton.filledTonal(
            onPressed: null,
            icon: Icon(Icons.add_box_outlined),
          ),
          SizedBox(width: 24),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: BlocBuilder<BoardPageCubit, BoardPageState>(
        builder: (context, state) {
          final isLoading =
              state is BoardPageLoading || state is BoardPageInitial;
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      BoardColumn(boardColumn: board.boardColumns[index]),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemCount: board.boardColumns.length,
                ),
              ),
              if (isLoading)
                Positioned.fill(
                  child: Container(
                    color: const Color.fromRGBO(0, 0, 0, 0.3),
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
