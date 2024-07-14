import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lasttime/bloc/app_bloc.dart';

class LastTimeView extends StatelessWidget {
  const LastTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.select((LastTimeBloc bloc) => bloc.state.items);
    return Stack(
      children: [
        LimitedBox(
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
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          color: const Color.fromARGB(255, 218, 192, 163),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 16, 44, 87),
                                width: 1),
                          ),
                          margin: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                            top: 5,
                            bottom: 5,
                          ),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(items[index].name),
                                Text(
                                  '${items[index].cycleDays.toString()} day left',
                                ),
                              ],
                            ),
                            subtitle: Text(
                              items[index].lastAction?.toString() ?? 'No Time Stamp',
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
        ),
      ],
    );
  }
}