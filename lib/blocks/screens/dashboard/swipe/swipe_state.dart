
import 'package:equatable/equatable.dart';
import 'package:yalla/blocks/model/user_firestore_model.dart';

abstract class SwipeState extends Equatable {
  const SwipeState();
  @override
  List<Object> get props => [];
}

class SwipeLoading extends SwipeState {}

class SwipeLoaded extends SwipeState {
  final List<UserModel> users;

  const SwipeLoaded({required this.users});
  @override
  List<Object> get props => [users];
}

class SwipeError extends SwipeState {}


abstract class SwipeEvent extends Equatable {
  const SwipeEvent();
  @override
  List<Object> get props => [];
}

class LoadUserEvent extends SwipeEvent {
  final List<UserModel> users;

   LoadUserEvent({required this.users});
  @override
  List<Object> get props => [users];
}

class SwipeLeftEvent extends SwipeEvent {
  final UserModel user;
   SwipeLeftEvent({required this.user});
  @override
  List<Object> get props => [user];
}

class SwipeRightEvent extends SwipeEvent {
  final UserModel user;
   SwipeRightEvent({required this.user});
  @override
  List<Object> get props => [user];
}
