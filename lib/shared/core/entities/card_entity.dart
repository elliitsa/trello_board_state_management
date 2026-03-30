import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class CardEntity extends Equatable {
  const CardEntity({required this.guid, required this.title});

  final String guid;
  final String title;

  @override
  List<Object?> get props => [guid, title];

  CardEntity copyWith({String? title}) {
    return CardEntity(guid: guid, title: title ?? this.title);
  }
}
