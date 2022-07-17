

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yalla/blocks/screens/dashboard/swipe/swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState>{
  // SwipeBloc(SwipeState initialState) : super(initialState);
  SwipeBloc() : super(SwipeLoading());

  @override
  Stream<SwipeState> mapEventToState(
      SwipeEvent event,
      ) async* {
    if(event is LoadUserEvent ){
        yield* _mapLoadedUserToState(event);
    } else if(event is SwipeLeftEvent){
      yield* _mapSwipeLeftToState(event, state);
    }else if(event is SwipeRightEvent){
      yield* _mapSwopeRightToState(event, state);
    }
  }

  Stream<SwipeState> _mapLoadedUserToState(LoadUserEvent event)async* {
    yield SwipeLoaded(users: event.users);
  }

  Stream<SwipeState> _mapSwipeLeftToState(
      SwipeLeftEvent event,
      SwipeState state
      ) async* {
    if(state is SwipeLoaded){
      try{
        yield SwipeLoaded(users: List.from(state.users)..remove(event.user));
      }catch(_){}
    }
  }

  Stream<SwipeState> _mapSwopeRightToState(
      SwipeRightEvent event,
      SwipeState state
      ) async* {
    if(state is SwipeLoaded){
      try{
        yield SwipeLoaded(users: List.from(state.users)..remove(event.user));
      }catch(_){}
    }
  }
}