import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lasttime/bloc/app_bloc.dart';
import 'package:lasttime/widgets/lasttime_list.dart';

class LastTimePage extends StatelessWidget {
  const LastTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastTimeBloc,LastTimeState>(
      builder: (context, state){
        return state is LoadingState ? const Center(
          child: CircularProgressIndicator(),
          ) : const LastTimeList();
      });
  }
}