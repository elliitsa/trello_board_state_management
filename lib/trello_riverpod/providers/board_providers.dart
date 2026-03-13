import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trello_board_state_management/shared/data/board_client.dart';
import 'package:trello_board_state_management/shared/domain/board_entity.dart';
import 'package:trello_board_state_management/trello_riverpod/notifiers/board_notifier.dart';
import 'package:trello_board_state_management/trello_riverpod/notifiers/board_overlay_notifier.dart';

final boardClientProvider = Provider<BoardClient>((ref) {
  return BoardClient();
});

final boardProvider =
    AsyncNotifierProvider.autoDispose<BoardNotifier, BoardEntity>(
      BoardNotifier.new,
    );

final isOverlayLoadingProvider = NotifierProvider<BoardOverlayNotifier, bool>(
  BoardOverlayNotifier.new,
);
