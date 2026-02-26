import 'package:flutter/material.dart';
import 'package:trello_board_state_management/app_config.dart';
import 'package:trello_board_state_management/trello_bloc/bloc_app.dart';
import 'package:trello_board_state_management/trello_riverpod/riverpod_app.dart';

void main() {
  switch (AppConfig.stateManagement) {
    case StateManagement.bloc:
      runApp(const BlocApp());
      break;

    case StateManagement.riverpod:
      runApp(const RiverpodApp());
      break;
  }
}
