import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementEvent>(_incremet);
    on<CounterDecrementEvent>(_decrement);
  }
  _incremet(CounterEvents event, Emitter<int> emit) {
    emit(state + 1);
  }

  _decrement(CounterEvents event, Emitter<int> emit) {
    emit(state - 1);
  }
}

abstract class CounterEvents {}

class CounterIncrementEvent extends CounterEvents {}

class CounterDecrementEvent extends CounterEvents {}
