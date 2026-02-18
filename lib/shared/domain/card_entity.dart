import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class CardEntity extends Equatable {
  const CardEntity({
    required this.guid,
    required this.title,
    this.description,
  });

  final String guid;
  final String title;
  // TODO do I need description?
  final String? description;

  @override
  List<Object?> get props => [guid, title, description];
}
