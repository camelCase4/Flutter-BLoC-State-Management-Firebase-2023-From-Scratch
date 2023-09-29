

part of 'switch_bloc_bloc.dart';

class SwitchBlocState extends Equatable {
  final bool switchValue;


  const SwitchBlocState({
    required this.switchValue,
  });
  
  @override
  List<Object> get props => [switchValue];

  SwitchBlocState copyWith({
    bool? switchValue,
  }) {
    return SwitchBlocState(
      switchValue: switchValue ?? this.switchValue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'switchValue': switchValue,
    };
  }

  factory SwitchBlocState.fromMap(Map<String, dynamic> map) {
    return SwitchBlocState(
      switchValue: map['switchValue'] as bool,
    );
  }


  @override
  bool get stringify => true;
}

final class SwitchBlocInitial extends SwitchBlocState {
  const SwitchBlocInitial({required bool switchValue}) : super(switchValue: switchValue);
}
