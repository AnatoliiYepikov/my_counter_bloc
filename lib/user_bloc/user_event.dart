part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class GetUserEvent extends UserEvent {
  final int count;
  GetUserEvent(this.count);
}

class GetJobEvent extends UserEvent {
  final int count;
  GetJobEvent(this.count);
}
