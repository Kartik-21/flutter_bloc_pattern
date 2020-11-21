import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }

  // @override
  // void onEvent(CounterEvent event) {
  //   print(event);
  //   super.onEvent(event);
  // }
  //
  // @override
  // void onChange(Change<int> change) {
  //   print(change);
  //   super.onChange(change);
  // }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}

// class SimpleBlocObserver extends BlocObserver {
//   @override
//   void onEvent(Bloc bloc, Object event) {
//     print('${bloc.runtimeType} $event');
//     super.onEvent(bloc, event);
//   }
//
//   @override
//   void onChange(Cubit cubit, Change change) {
//     print('${cubit.runtimeType} $change');
//     super.onChange(cubit, change);
//   }
//
//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     print('${bloc.runtimeType} $transition');
//     super.onTransition(bloc, transition);
//   }
//
//   @override
//   void onError(Cubit cubit, Object error, StackTrace stackTrace) {
//     print('${cubit.runtimeType} $error $stackTrace');
//     super.onError(cubit, error, stackTrace);
//   }
// }
