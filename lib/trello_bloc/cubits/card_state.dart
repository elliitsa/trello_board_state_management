part of 'card_cubit.dart';

class CardState extends Equatable {
  const CardState({
    required this.cardEntity,
    this.loading = false,
    this.errorMessage,
  });

  final CardEntity cardEntity;
  final bool? loading;
  final String? errorMessage;

  @override
  List<Object?> get props => [cardEntity, loading, errorMessage];

  CardState copyWith({
    CardEntity? cardEntity,
    bool? loading,
    String? errorMessage,}){
    return CardState(
      cardEntity: cardEntity ?? this.cardEntity,
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
