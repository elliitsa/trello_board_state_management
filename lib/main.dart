import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trello_board_state_management/shared/ui/board/board_page.dart';
import 'package:trello_board_state_management/theme.dart';
import 'package:trello_board_state_management/trello_bloc/board_page_cubit.dart';
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
      home: BlocProvider<BoardPageCubit>(
        create: (BuildContext context) => BoardPageCubit()..loadBoard(),
        child: const BoardPage(),
      ),
    );
  }
}
