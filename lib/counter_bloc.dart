import 'package:flutter_bloc/flutter_bloc.dart';

class CountBloc extends Bloc<Event, int> {
  CountBloc() : super(0) {
    on<Inc>(_inc);
    on<Dec>(_dec);
  }
  _inc(Inc event, Emitter emit) {
    emit(state + 1);
  }

  _dec(Dec event, Emitter emit) {
    if (state <= 0) {
      return;
    }
    emit(state - 1);
  }
}

abstract class Event {}

class Inc extends Event {}

class Dec extends Event {}
