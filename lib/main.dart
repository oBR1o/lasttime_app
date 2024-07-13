import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lasttime/bloc/app_bloc.dart';
import 'package:lasttime/mock_repo.dart';
import 'package:lasttime/widgets/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LastTimeBloc>(create: (context) {
          final bloc = LastTimeBloc(LastTimeMockRepository());
          bloc.add(LoadEvent());
          return bloc;
        })
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
