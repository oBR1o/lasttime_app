import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lasttime/bloc/app_bloc.dart';
import 'package:lasttime/model.dart';

class RemoveAlertDialog extends StatelessWidget {
  const RemoveAlertDialog({super.key, required this.items});

  final LastTimeItem items;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Delete'),
      content: Text(
          'Do you want to delete "${items.name}" ?'),
      actions:[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Delete'),
          onPressed: () {
            context.read<LastTimeBloc>().add(
                RemoveEvent(
                    id: items.id));
            context.read<LastTimeBloc>().add(LoadEvent());
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}