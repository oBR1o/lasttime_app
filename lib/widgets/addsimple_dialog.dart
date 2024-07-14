import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lasttime/bloc/app_bloc.dart';

class AddsimpleDialog extends StatelessWidget {
  const AddsimpleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var cycleDaysController = TextEditingController();
    return SimpleDialog(
      title: const Text("Add New Reminder"),
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: cycleDaysController,
                decoration: const InputDecoration(labelText: 'Date of Time'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      String? name = nameController.text;
                      int? cycleDays =
                          int.tryParse(cycleDaysController.text) ?? 0;
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
