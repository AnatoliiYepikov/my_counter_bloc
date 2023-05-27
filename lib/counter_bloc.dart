import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementCounterEvent>((IncrementCounterEvent event, Emitter<int> emit) {
      emit(state + 1);
    });
    on<DecrementCounterEvent>(_decrement);
  }

  _decrement(DecrementCounterEvent event, Emitter<int> emit) {
    emit(state - 1);
  }
}

abstract class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}
