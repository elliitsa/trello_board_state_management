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
  switch (AppConfig.stateManagement) {
    case StateManagement.bloc:
      runApp(const BlocApp());
      break;

    case StateManagement.riverpod:
      runApp(ProviderScope(child: const RiverpodApp()));
      break;
  }
}
