import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trello_board_state_management/app_config.dart';
import 'package:trello_board_state_management/shared/data/shared_preferences_board_repository.dart';
import 'package:trello_board_state_management/shared/domain/board_column_entity.dart';
import 'package:trello_board_state_management/shared/domain/board_entity.dart';
import 'package:trello_board_state_management/shared/domain/card_entity.dart';
import 'package:trello_board_state_management/trello_bloc/bloc_app.dart';
import 'package:trello_board_state_management/trello_riverpod/riverpod_app.dart';
import 'package:uuid/uuid.dart';

Future<void> main() async {

  final uuid = Uuid();

  final _boardColumns = [
    BoardColumnEntity(
      id: uuid.v4(),
      title: "Ready for Development",
      cards: [
        CardEntity(guid: uuid.v4(), title: "First Card"),
        CardEntity(guid: uuid.v4(), title: "Second Card"),
        CardEntity(guid: uuid.v4(), title: "Third Card"),
        CardEntity(guid: uuid.v4(), title: "First Card"),
        CardEntity(guid: uuid.v4(), title: "Second Card"),
        CardEntity(guid: uuid.v4(), title: "Third Card"),
        CardEntity(guid: uuid.v4(), title: "First Card"),
        CardEntity(guid: uuid.v4(), title: "Second Card"),
        CardEntity(guid: uuid.v4(), title: "Third Card"),
        CardEntity(guid: uuid.v4(), title: "First Card"),
        CardEntity(guid: uuid.v4(), title: "Second Card"),
        CardEntity(guid: uuid.v4(), title: "Third Card"),
        CardEntity(guid: uuid.v4(), title: "First Card"),
        CardEntity(guid: uuid.v4(), title: "Second Card"),
        CardEntity(guid: uuid.v4(), title: "Third Card"),
      ],
    ),
    BoardColumnEntity(
      id: Uuid().v4(),
      title: "In Progress",
      cards: [CardEntity(guid: uuid.v4(), title: "First Card")],
    ),
    // BoardColumnEntity(
    //   id: Uuid().v4(),
    //   title: "In Review",
    //   cards: [
    //     CardEntity(
    //       guid: uuid.v4(),
    //       title: "First Card",
    //     ),
    //     CardEntity(
    //       guid: uuid.v4(),
    //       title: "Second Card",
    //     ),
    //   ],
    // ),
    // BoardColumnEntity(
    //   id: Uuid().v4(),
    //   title: "Done",
    //   cards: [
    //     CardEntity(
    //       guid: uuid.v4(),
    //       title: "First Card",
    //     ),
    //     CardEntity(
    //       guid: uuid.v4(),
    //       title: "Second Card",
    //     ),
    //   ],
    // ),
    // BoardColumnEntity(id: Uuid().v4(), title: "Empty Board Column Example", cards: []),
  ];
  var _board = BoardEntity(id: 1, boardColumns: _boardColumns);
  await SharedPreferencesBoardRepository().updateBoard(board: _board);

  switch (AppConfig.stateManagement) {
    case StateManagement.bloc:
      runApp(const BlocApp());
      break;

    case StateManagement.riverpod:
      runApp(ProviderScope(child: const RiverpodApp()));
      break;
  }
}
