import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'switch_bloc_event.dart';
part 'switch_bloc_state.dart';

class SwitchBlocBloc extends HydratedBloc<SwitchBlocEvent, SwitchBlocState> {
  SwitchBlocBloc() : super(SwitchBlocInitial(switchValue: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(
        const SwitchBlocState(switchValue: true),
      );
    });
    on<SwitchOffEvent>((event, emit) {
      emit(
        const SwitchBlocState(switchValue: false),
      );
    });
  }
  
  @override
  SwitchBlocState? fromJson(Map<String, dynamic> json) {
    return SwitchBlocState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(SwitchBlocState state) {
    return state.toMap();
  }
}
