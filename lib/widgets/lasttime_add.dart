import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lasttime/bloc/app_bloc.dart';

class LastTimeAdd extends StatelessWidget {
  const LastTimeAdd({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var cycleDaysController = TextEditingController();
    return AlertDialog(
      title: const Text("Add New Remainder"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: cycleDaysController,
            decoration: const InputDecoration(labelText: 'Date of Time'),
            keyboardType: TextInputType.number,
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            String? name = nameController.text;
            int? cycleDays = int.tryParse(cycleDaysController.text) ?? 0;
            context
                .read<LastTimeBloc>()
                .add(AddEvent(name: name, cycleDays: cycleDays));
            context.read<LastTimeBloc>().add(LoadEvent());
            Navigator.pop(context, 'Save');
          },
          child: const Text('Save'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
          child: const Text('Cancel'),
        )
      ],
    );
  }
}
