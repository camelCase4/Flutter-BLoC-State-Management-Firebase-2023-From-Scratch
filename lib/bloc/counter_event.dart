part of 'counter_bloc.dart';

sealed class CounterEvent {
 
}

class CounterIncrementEvent extends CounterEvent{

}

class CounterDecrementEvent extends CounterEvent{

}
