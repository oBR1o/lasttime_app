import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lasttime/bloc/app_bloc.dart';

class LastTimeList extends StatelessWidget {
  const LastTimeList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.select((LastTimeBloc bloc) => bloc.state.items);
    return Expanded(
      child: items.isEmpty
          ? const SizedBox(
              height: 200,
              width: double.infinity,
              child: Text(
                "Nothing to show",
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(items[index].name),
                      Text(
                        items[index].cycleDays.toString(),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    items[index].lastAction?.toString() ?? 'No date',
                  ),
                );
              },
            ),
    );
  }
}
