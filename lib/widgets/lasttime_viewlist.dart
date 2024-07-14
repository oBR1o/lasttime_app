import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lasttime/bloc/app_bloc.dart';
import 'package:lasttime/widgets/confirmalaert_dialog.dart';
import 'package:lasttime/widgets/lasttime_search.dart';

class LastTimeViewList extends StatelessWidget {
  const LastTimeViewList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.select((LastTimeBloc bloc) => bloc.state.items);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: LimitedBox(
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
                              title: Text(items[index].name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${items[index].cycleDays.toString()} day left',
                                  ),
                                  Text(
                                    items[index].lastAction != null
                                    ? 'Last time: ${DateFormat('dd-MM-yyyy').format(items[index].lastAction!)}'
                                    : 'Never Do this',
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.check_circle_outline),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ConfirmAlertDialog(
                                          id: items[index].id);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ),
        ),
        const LastTimeSearch(),
      ],
    );
  }
}
