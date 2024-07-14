import 'package:bloc/bloc.dart';
import 'package:lasttime/bloc/lasttime_event.dart';
import 'package:lasttime/bloc/lasttime_state.dart';
import 'package:lasttime/repo.dart';


class LastTimeBloc extends Bloc<LastTimeEvent, LastTimeState> {
  final LastTimeRepository repository;
  LastTimeBloc(this.repository) : super(LoadingState()){
    on<LoadEvent>(_onLoaded);
    on<AddEvent>(_onAdded);
    on<RemoveEvent>(_onRemoved);
    on<ActionEvent>(_onActioned);
    on<SearchEvent>(_onSearched);
  }

  _onLoaded(LoadEvent event, Emitter<LastTimeState> emit) async{
    final items = await repository.load();
    emit(ReadyState(items: items ));
  }

  _onAdded(AddEvent event, Emitter<LastTimeState> emit) async{
    await repository.add(name: event.name, cycleDays: event.cycleDays);
    emit(LoadingState());
    add(LoadEvent());
  }

  _onRemoved(RemoveEvent event, Emitter<LastTimeState> emit) async{
    await repository.remove(id: event.id);
    emit(LoadingState());
  }

  _onActioned(ActionEvent event, Emitter<LastTimeState> emit) async{
    await repository.action(id: event.id, lastAction: event.lastAction);
    emit(LoadingState());
  }

  _onSearched(SearchEvent event, Emitter<LastTimeState> emit) async{
    final items = await repository.search(event.key);
    emit(ReadyState(items: items ));
  }
}