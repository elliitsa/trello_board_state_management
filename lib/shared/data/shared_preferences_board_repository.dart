import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:trello_board_state_management/shared/data/dtos/board_dto.dart';
import 'package:trello_board_state_management/shared/domain/board_entity.dart';
import 'package:trello_board_state_management/shared/domain/board_repository.dart';

class SharedPreferencesBoardRepository implements BoardRepository {
  SharedPreferencesBoardRepository();

  static const String _keyPrefix = 'board_';

  @override
  Future<BoardEntity> fetchBoard({required int id}) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString('$_keyPrefix$id');

    if (jsonString == null) {
      throw Exception('Board with id $id not found');
    }

    final dto = BoardDto.fromJson(
      jsonDecode(jsonString) as Map<String, dynamic>,
    );

    return dto.toEntity();
  }

  @override
  Future<BoardEntity> updateBoard({required BoardEntity board}) async {
    final prefs = await SharedPreferences.getInstance();

    final dto = BoardDto.fromEntity(board);
    final jsonString = jsonEncode(dto.toJson());

    await prefs.setString('$_keyPrefix${board.id}', jsonString);
    return board;
  }
}
