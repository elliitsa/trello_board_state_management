import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'card_entity.dart';

@immutable
class BoardColumnEntity extends Equatable{
  final int id;
  final String title;
  final List<CardEntity> cards;

  const BoardColumnEntity({
    required this.id,
    required this.title,
    required this.cards,
  });

  @override
  List<Object?> get props => [id, title, cards];
}
