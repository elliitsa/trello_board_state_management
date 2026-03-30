import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ioc/flutter_ioc.dart';
import 'package:trello_board_state_management/shared/core/entities/card_entity.dart';
import 'package:trello_board_state_management/shared/core/services/board_service.dart';
import 'package:trello_board_state_management/trello_bloc/cubits/board_column_cubit.dart';
import 'package:trello_board_state_management/trello_bloc/cubits/card_cubit.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({required this.cardEntity, super.key});

  final CardEntity cardEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardCubit(
        service: IocContainer.container.get<BoardService>(),
        card: cardEntity,
      ),
      child: BlocBuilder<CardCubit, CardState>(
        builder: (context, state) {
          return Card(
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Form(
                        child: TextFormField(
                          onChanged: (String? value) =>
                              context.read<CardCubit>().editCardTitle(
                                columnId: context
                                    .read<BoardColumnCubit>()
                                    .state
                                    .columnEntity
                                    .id,
                                value: value,
                              ),
                          keyboardType: TextInputType.text,
                          initialValue: cardEntity.title,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hint: Text(
                              "New card",
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.outline,
                                  ),
                            ),
                          ),
                          maxLines: 3,
                          minLines: 1,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        context.read<BoardColumnCubit>().deleteCard(
                          cardId: cardEntity.guid,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
