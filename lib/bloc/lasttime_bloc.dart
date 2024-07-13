import 'package:bloc/bloc.dart';
import 'package:lasttime/bloc/lasttime_event.dart';
import 'package:lasttime/bloc/lasttime_state.dart';
import 'package:lasttime/repo.dart';


class LastTimeBloc extends Bloc<LastTimeEvent, LastTimeState> {
  final LastTimeRepository repository;
  LastTimeBloc(this.repository) : super(LoadingState()){
    on<LoadEvent>(_onLoaded);
    on<AddEvent>(_onAdded);
  }

  _onLoaded(LoadEvent event, Emitter<LastTimeState> emit) async{
    final items = await repository.load();
    emit(ReadyState(items: items ));
  }

  _onAdded(AddEvent event, Emitter<LastTimeState> emit) async{
    await repository.add(name: event.name, cycleDays: event.cycleDays);
    final items = await repository.load();
    emit(ReadyState(items: items));
  }
}
