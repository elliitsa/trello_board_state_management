part of 'board_page_cubit.dart';

sealed class BoardPageState extends Equatable {
  const BoardPageState();
}

final class BoardPageLoading extends BoardPageState {
  @override
  List<Object?> get props => [];
}

final class BoardPageRefreshing extends BoardPageState {
  // I would go for consistency and also just named parameters here
  const BoardPageRefreshing(this.boardEntity);

  final BoardEntity boardEntity;

  @override
  List<Object?> get props => [boardEntity];
}

// Is there a world where you would be interested in the whole `board`
// object here given that yes its technically an empty board but now you
// lose the ability to display things like maybe the board name.
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
