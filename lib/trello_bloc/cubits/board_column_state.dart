part of 'board_column_cubit.dart';

class BoardColumnState extends Equatable {
  const BoardColumnState({
    required this.boardColumnEntity,
    this.loading = false,
    this.errorMessage,
  });

  final ColumnEntity boardColumnEntity;
  final bool? loading;
  final String? errorMessage;

  @override
  List<Object?> get props => [boardColumnEntity, loading, errorMessage];

  BoardColumnState copyWith({
    ColumnEntity? boardColumnEntity,
    bool? loading,
    String? errorMessage,
  }) {
    return BoardColumnState(
      boardColumnEntity: boardColumnEntity ?? this.boardColumnEntity,
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
