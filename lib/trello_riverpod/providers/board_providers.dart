import 'package:flutter_ioc/flutter_ioc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trello_board_state_management/shared/core/entities/board_entity.dart';
import 'package:trello_board_state_management/shared/core/entities/column_entity.dart';
import 'package:trello_board_state_management/shared/core/services/board_service.dart';
import 'package:trello_board_state_management/trello_riverpod/notifiers/board_notifier.dart';
import 'package:trello_board_state_management/trello_riverpod/notifiers/board_overlay_notifier.dart';
import 'package:trello_board_state_management/trello_riverpod/notifiers/column_notifier.dart';

final boardServiceProvider = Provider<BoardService>((ref) {
  return IocContainer.container.get<BoardService>();
});

final boardProvider =
    AsyncNotifierProvider.autoDispose<BoardNotifier, BoardEntity>(
      BoardNotifier.new,
    );

final columnProvider = AsyncNotifierProvider.autoDispose
    .family<ColumnNotifier, ColumnEntity, String>(
      (String id) => ColumnNotifier(id),
    );

final isOverlayLoadingProvider = NotifierProvider<BoardOverlayNotifier, bool>(
  BoardOverlayNotifier.new,
);
