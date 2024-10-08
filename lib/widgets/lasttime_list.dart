import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lasttime/bloc/app_bloc.dart';
import 'package:lasttime/widgets/addsimple_dialog.dart';
import 'package:lasttime/widgets/removealert_dialog.dart';

class LastTimeList extends StatelessWidget {
  const LastTimeList({super.key});

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
                            title: Text(
                              items[index].name,
                              style: GoogleFonts.roboto(
                                color: const Color.fromARGB(255, 16, 44, 87),
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              'every ${items[index].cycleDays.toString()} day',
                              style: GoogleFonts.roboto(
                                color: const Color.fromARGB(255, 16, 44, 87),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return RemoveAlertDialog(
                                        items: items[index]);
                                  },
                                );
                              },
                              iconSize: 30,
                              color: const Color.fromARGB(255, 170, 36, 26),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
        ),
        Positioned(
          bottom: 15,
          right: 15,
          child: Column(
            children: [
              FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AddsimpleDialog();
                    },
                  );
                },
                shape: const CircleBorder(),
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
