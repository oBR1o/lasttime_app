import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lasttime/bloc/app_bloc.dart';

class ConfirmAlertDialog extends StatelessWidget {
  const ConfirmAlertDialog({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    final lastAction = DateTime.now();
    return AlertDialog(
      title: const Text('Confirm Task'),
      content: const Text('Do you want to confirm this Task ?'),
      actions: [
        TextButton(
          child: const Text('Yes'),
          onPressed: () {
            context
                .read<LastTimeBloc>()
                .add(ActionEvent(id: id, lastAction: lastAction));
            context.read<LastTimeBloc>().add(LoadEvent());
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
