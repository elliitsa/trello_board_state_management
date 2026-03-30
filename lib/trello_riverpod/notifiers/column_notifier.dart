import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trello_board_state_management/shared/core/entities/board_entity.dart';
import 'package:trello_board_state_management/shared/core/entities/column_entity.dart';
import 'package:trello_board_state_management/trello_riverpod/providers/board_providers.dart';

class ColumnNotifier extends AsyncNotifier<ColumnEntity> {
  ColumnNotifier(this.columnId);

  final String columnId;

  @override
  Future<ColumnEntity> build() async {
    ref.keepAlive();
    final service = ref.watch(boardServiceProvider);
    return service.fetchColumn(columnId: columnId);
  }

  Future<void> addCard() async {
    // final current = state.value;
    // if (current == null) return;

    final loading = ref.read(isOverlayLoadingProvider.notifier);

    loading.state = true;

    try {
      final service = ref.read(boardServiceProvider);
      final result = await service.addCardToColumn(columnId: columnId);

      if (!ref.mounted) return;
      state = AsyncData(result);

    } finally {
      if (ref.mounted) {
        loading.state = false;
      }
    }
  }

  Future<void> deleteCard({required String cardId}) async {
    // final current = state.value;
    // if (current == null) return;

    ref.read(isOverlayLoadingProvider.notifier).state = true;

    final service = ref.read(boardServiceProvider);
    final result = await service.deleteCard(columnId: columnId, cardId: cardId);
    state = AsyncData(result);

    ref.read(isOverlayLoadingProvider.notifier).state = false;
  }
}
