// ignore_for_file: public_member_api_docs, sort_constructors_first


part of 'counter_bloc.dart';

class CounterState extends Equatable {
  const CounterState({
    required this.countValue,
  });
  final int countValue;
  
  @override
  List<Object> get props => [countValue];

  CounterState copyWith({
    int? countValue,
  }) {
    return CounterState(
      countValue: countValue ?? this.countValue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'countValue': countValue,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      countValue: map['countValue'] as int,
    );
  }

  
  @override
  bool get stringify => true;
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(countValue: 0);
}

class IncrementState extends CounterState{
 const  IncrementState(int increaseValue) : super(countValue: increaseValue);
}

class DecrementState extends CounterState{
  const DecrementState(int decreasedValue) : super(countValue: decreasedValue);
  
}




