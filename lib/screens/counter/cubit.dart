import 'package:array_movie_app/screens/counter/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit():super(CounterInitialState());
  static CounterCubit getObject(context)=>BlocProvider.of(context);

  int count=0;

  void plus(){
    count++;
    emit(CounterPlusState());
  }
  void minus(){
    count--;
    emit(CounterMinusState());
  }

}