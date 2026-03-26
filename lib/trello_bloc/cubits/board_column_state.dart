part of 'board_column_cubit.dart';

class BoardColumnState extends Equatable {
  const BoardColumnState({
    required this.columnEntity,
    this.loading = false,
    this.errorMessage,
  });

  final ColumnEntity columnEntity;
  final bool? loading; // TODO Require param to make it cleaner
  final String? errorMessage;

  @override
  List<Object?> get props => [columnEntity, loading, errorMessage];

  BoardColumnState copyWith({
    ColumnEntity? columnEntity,
    bool? loading,
    String? errorMessage,
  }) {
    return BoardColumnState(
      columnEntity: columnEntity ?? this.columnEntity,
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
