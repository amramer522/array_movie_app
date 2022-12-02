import 'package:array_movie_app/screens/calculator/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<CalculatorStates>
{
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  final opController = TextEditingController();
  double? result;

  CalculatorCubit():super(CalculatorInitialState());

  static CalculatorCubit getObject(context) => BlocProvider.of(context);





  void calculate(){
    double num1 = double.parse(num1Controller.text);
    double num2 = double.parse(num2Controller.text);
    String op = opController.text;

    switch(op)
    {
      case "+":
        result = num1+num2;
        break;
      case "-":
        result = num1-num2;
        break;
      case "*":
        result = num2*num1;
        break;
      case "/":
        result = num1/num2;
        break;
      default:
        result = null;
    }
    emit(CalculatorResultState());
  }


}