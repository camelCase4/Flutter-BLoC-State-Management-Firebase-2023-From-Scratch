import 'package:bloc/bloc.dart';
import 'package:counter_app_initial_proj/bloc/dart_imports.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterIncrementEvent>((event, emit) {
      emit(IncrementState(state.countValue+1));
    });

    on<CounterDecrementEvent>((event, emit) {
      emit(DecrementState(state.countValue-1));
    });
  }
  
  @override
  CounterState? fromJson(Map<String, dynamic> json) {
   return CounterState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
