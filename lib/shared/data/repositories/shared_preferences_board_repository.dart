import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:trello_board_state_management/shared/core/entities/column_entity.dart';
import 'package:trello_board_state_management/shared/core/entities/board_entity.dart';
import 'package:trello_board_state_management/shared/core/repositories/board_repository.dart';
import 'package:trello_board_state_management/shared/core/entities/card_entity.dart';
import 'package:trello_board_state_management/shared/data/dtos/board_dto.dart';
import 'package:uuid/uuid.dart';

class SharedPreferencesBoardRepository implements BoardRepository {
  SharedPreferencesBoardRepository();

  static const String _keyPrefix = 'board_';

  @override
  Future<BoardEntity> fetchBoard({required int id}) async {
    // Fake API delay
    await Future.delayed(const Duration(seconds: 1));

    final prefs = await SharedPreferences.getInstance();

    var jsonString = prefs.getString('$_keyPrefix$id');

    if (jsonString == null) {
      await updateBoard(board: _board);
      jsonString = prefs.getString('$_keyPrefix$id');
    }

    final dto = BoardDto.fromJson(
      jsonDecode(jsonString!) as Map<String, dynamic>,
    );

    return dto.toEntity();
  }

  @override
  Future<BoardEntity> updateBoard({required BoardEntity board}) async {
    // Fake API delay
    await Future.delayed(const Duration(seconds: 1));

    final prefs = await SharedPreferences.getInstance();

    final dto = BoardDto.fromEntity(board);
    final jsonString = jsonEncode(dto.toJson());

    await prefs.setString('$_keyPrefix${board.id}', jsonString);
    return board;
  }

  /// TODO use it
  @override
  Future<void> clear() async {
    // Fake API delay
    await Future.delayed(const Duration(seconds: 1));

    return SharedPreferences.getInstance().then((prefs) {
      final keysToRemove = prefs
          .getKeys()
          .where((key) => key.startsWith(_keyPrefix))
          .toList();
      for (final key in keysToRemove) {
        prefs.remove(key);
      }
    });
  }
}

final uuid = Uuid();

final _boardColumns = [
  ColumnEntity(
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
  ColumnEntity(
    id: Uuid().v4(),
    title: "In Progress",
    cards: [CardEntity(guid: uuid.v4(), title: "First Card")],
  ),
];
var _board = BoardEntity(id: 1, boardColumns: _boardColumns);
