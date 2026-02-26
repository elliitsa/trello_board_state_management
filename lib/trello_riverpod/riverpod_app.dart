import 'package:flutter/material.dart';
import 'package:trello_board_state_management/theme.dart';
import 'package:trello_board_state_management/trello_riverpod/ui/board_page.dart';
import 'package:trello_board_state_management/util.dart';

class RiverpodApp extends StatelessWidget {
  const RiverpodApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Headland One");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: BoardPage(),
    );
  }
}