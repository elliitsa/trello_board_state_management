part of 'board_page_cubit.dart';

sealed class BoardPageState extends Equatable {
  const BoardPageState();
}

final class BoardPageLoading extends BoardPageState {
  const BoardPageLoading();

  @override
  List<Object?> get props => [];
}

final class BoardPageEmpty extends BoardPageState {
  @override
  List<Object?> get props => [];
}

final class BoardPageError extends BoardPageState {
  const BoardPageError({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}

final class HasDataState extends BoardPageState {
  const HasDataState({
    required this.boardEntity,
    this.isLoading = false,
  });

  final BoardEntity boardEntity;
  final bool isLoading;

  @override
  List<Object?> get props => [boardEntity, isLoading];
}

// final class LoadedWithData extends HasDataState {
//   const LoadedWithData({required super.boardEntity});
//
//   @override
//   List<Object?> get props => [boardEntity];
// }
//
// final class LoadingWithData extends HasDataState {
//   const LoadingWithData({required super.boardEntity});
//
//   @override
//   List<Object?> get props => [boardEntity];
// }
