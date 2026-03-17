import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ioc_get_it/flutter_ioc_get_it.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trello_board_state_management/app_config.dart';
import 'package:trello_board_state_management/shared/core/bootstrap.dart'
    as core;
import 'package:trello_board_state_management/shared/data/bootstrap.dart'
    as data;
import 'package:trello_board_state_management/trello_bloc/bloc_app.dart';
import 'package:trello_board_state_management/trello_riverpod/riverpod_app.dart';

void main() async {
  GetItIocContainer.register();
  await core.bootstrap();
  await data.bootstrap();

  switch (AppConfig.stateManagement) {
    case StateManagement.bloc:
      runApp(const BlocApp());
      break;

    case StateManagement.riverpod:
      runApp(ProviderScope(child: const RiverpodApp()));
      break;
  }
}
