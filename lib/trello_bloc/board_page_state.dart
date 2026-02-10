part of 'board_page_cubit.dart';

sealed class BoardPageState extends Equatable {
  const BoardPageState();
}

final class BoardPageInitial extends BoardPageState {
  const BoardPageInitial();

  @override
  List<Object> get props => [];
}

final class BoardPageLoading extends BoardPageState {
  const BoardPageLoading();

  @override
  List<Object> get props => [];
}

final class BoardPageUpdating extends BoardPageState {
  const BoardPageUpdating();

  @override
  List<Object> get props => [];
}

final class BoardPageSuccess extends BoardPageState {
  const BoardPageSuccess();

  @override
  List<Object> get props => [];
}

final class BoardPageError extends BoardPageState {
  const BoardPageError();

  @override
  List<Object> get props => [];
}

