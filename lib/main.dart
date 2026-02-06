import 'package:flutter/material.dart';
import 'package:trello_board_state_management/shared/domain/board_entity.dart';
import 'package:trello_board_state_management/shared/domain/board_column_entity.dart';
import 'package:trello_board_state_management/shared/domain/card_entity.dart';
import 'package:trello_board_state_management/shared/ui/board_page.dart';
import 'package:trello_board_state_management/theme.dart';
import 'package:trello_board_state_management/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Headland One");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const BoardPage(board: _board),
    );
  }
}

const _board = BoardEntity(id: 1, boardColumns: _boardColumn);
const _boardColumn = [
  BoardColumnEntity(
    id: 1,
    title: "Ready for Development",
    cards: [
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Second Card",
        description: "This is the second card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Third Card",
        description: "This is the third card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Second Card",
        description: "This is the second card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Third Card",
        description: "This is the third card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Second Card",
        description: "This is the second card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Third Card",
        description: "This is the third card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Second Card",
        description: "This is the second card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Third Card",
        description: "This is the third card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Second Card",
        description: "This is the second card of the first column",
      ),
      CardEntity(
        id: 1,
        title: "Third Card",
        description: "This is the third card of the first column",
      ),
    ],
  ),
  BoardColumnEntity(
    id: 2,
    title: "In Progress",
    cards: [
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the second column",
      ),
    ],
  ),
  BoardColumnEntity(
    id: 3,
    title: "In Review",
    cards: [
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the third column",
      ),
      CardEntity(
        id: 1,
        title: "Second Card",
        description: "This is the second card of the third column",
      ),
    ],
  ),
  BoardColumnEntity(
    id: 3,
    title: "Done",
    cards: [
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the third column",
      ),
      CardEntity(
        id: 1,
        title: "Second Card",
        description: "This is the second card of the third column",
      ),
    ],
  ),
  BoardColumnEntity(
    id: 3,
    title: "Done",
    cards: [
      CardEntity(
        id: 1,
        title: "First Card",
        description: "This is the first card of the third column",
      ),
      CardEntity(
        id: 1,
        title: "Second Card",
        description: "This is the second card of the third column",
      ),
    ],
  ),
];
