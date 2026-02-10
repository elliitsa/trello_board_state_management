part of 'board_page_cubit.dart';

sealed class BoardPageState extends Equatable {
  const BoardPageState();
}

final class BoardPageLoading extends BoardPageState {
  @override
  List<Object?> get props => [];
}

final class BoardPageRefreshing extends BoardPageState {
  final BoardEntity? boardEntity;

  const BoardPageRefreshing(this.boardEntity);

  @override
  List<Object?> get props => [boardEntity];
}

final class BoardPageEmpty extends BoardPageState {
  @override
  List<Object?> get props => [];
}

final class BoardPageSuccess extends BoardPageState {
  final BoardEntity boardEntity;

  const BoardPageSuccess({required this.boardEntity});

  @override
  List<Object?> get props => [boardEntity];
}

final class BoardPageError extends BoardPageState {
  final String errorMessage;

  const BoardPageError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
