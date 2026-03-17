import 'package:flutter_ioc/flutter_ioc.dart';
import 'package:trello_board_state_management/shared/core/repositories/board_repository.dart';
import 'package:trello_board_state_management/shared/data/repositories/shared_preferences_board_repository.dart';

Future<void> bootstrap() async {
  final IocContainer ioc = IocContainer.container;

  ioc.registerFactory<BoardRepository>(
    () => SharedPreferencesBoardRepository(),
  );
}
