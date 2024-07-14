import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lasttime/bloc/app_bloc.dart';
import 'package:lasttime/widgets/lasttime_viewlist.dart';

class LastTimeView extends StatelessWidget {
  const LastTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastTimeBloc,LastTimeState>(
      builder: (context, state){
        return state is LoadingState ? const Center(
          child: CircularProgressIndicator(),
          ) : const LastTimeViewList();
      });
  }
}