import 'package:array_movie_app/screens/calculator/cubit.dart';
import 'package:array_movie_app/screens/calculator/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({Key? key}) : super(key: key);

  int count = 0;

  @override
  Widget build(BuildContext context) {
    count++;
    print(count);

    return BlocProvider<CalculatorCubit>(
      create: (context) => CalculatorCubit(),
      child: Builder(
        builder: (context) {
          final cubit = CalculatorCubit.getObject(context);
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    controller: cubit.num1Controller,
                    decoration: InputDecoration(labelText: "Enter number 1"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: cubit.opController,
                    decoration: InputDecoration(labelText: "Enter operation"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: cubit.num2Controller,
                    decoration: InputDecoration(labelText: "Enter number 2"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        cubit.calculate();
                        // setState(() {});
                      },
                      child: Text("Calculate")),
                  SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<CalculatorCubit,CalculatorStates>(builder: (context, state) => Text("Result is : ${cubit.result}"),)

                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
