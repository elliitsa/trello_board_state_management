part of 'board_page_cubit.dart';

sealed class BoardPageState extends Equatable {
  const BoardPageState();
}

final class BoardPageLoading extends BoardPageState {
  @override
  List<Object?> get props => [];
}

final class BoardPageRefreshing extends BoardPageState {
  const BoardPageRefreshing(this.boardEntity);

  final BoardEntity boardEntity;

  @override
  List<Object?> get props => [boardEntity];
}

final class BoardEmptyPage extends BoardPageState {

  @override
  List<Object?> get props => [];
}

final class BoardPageSuccess extends BoardPageState {
  const BoardPageSuccess({required this.boardEntity});

  final BoardEntity boardEntity;

  @override
  List<Object?> get props => [boardEntity];
}

final class BoardPageError extends BoardPageState {
  const BoardPageError({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}
