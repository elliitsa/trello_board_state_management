import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trello_board_state_management/shared/data/shared_preferences_board_repository.dart';
import 'package:trello_board_state_management/shared/domain/board_entity.dart';
import 'package:trello_board_state_management/trello_riverpod/notifiers/board_notifier.dart';
import 'package:trello_board_state_management/trello_riverpod/notifiers/board_overlay_notifier.dart';

final SharedPreferencesBoardRepositoryProvider =
    Provider<SharedPreferencesBoardRepository>((ref) {
      return SharedPreferencesBoardRepository();
    });

final boardProvider =
    AsyncNotifierProvider.autoDispose<BoardNotifier, BoardEntity>(
      BoardNotifier.new,
    );

final isOverlayLoadingProvider = NotifierProvider<BoardOverlayNotifier, bool>(
  BoardOverlayNotifier.new,
);
