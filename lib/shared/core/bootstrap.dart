import 'package:flutter_ioc/flutter_ioc.dart';
import 'package:trello_board_state_management/shared/core/repositories/board_repository.dart';
import 'package:trello_board_state_management/shared/core/services/board_service.dart';

/// Bootstrap the core layer.
Future<void> bootstrap() async {
  final IocContainer ioc = IocContainer.container;

  ioc.registerFactory<BoardService>(
    () => BoardService(repository: ioc.get<BoardRepository>()),
  );
}
