import 'package:first_project/modules/counter_screen/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterInitState());
  int counter = 1;

  static CounterCubit get(context) => BlocProvider.of(context);

  void plus(){
    counter++;
    emit(CounterPlusState(counter));
  }

  void minus(){
    counter--;
    emit(CounterMinusState(counter));
  }
}