import 'package:array_movie_app/screens/counter/cubit.dart';
import 'package:array_movie_app/screens/counter/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
   CounterScreen({Key? key}) : super(key: key);

int buildCount =0;


  @override
  Widget build(BuildContext context) {
    buildCount++;
    print("Hello");
    print(buildCount);
    return
      BlocProvider<CounterCubit>(create: (context) =>
          CounterCubit(),child: Builder(
      builder: (context) {
        final cubit = CounterCubit.getObject(context);
        return Scaffold(
          appBar: AppBar(),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(onPressed: (){
                      cubit.plus();
                      // count++;
                      // setState(() {
                      //
                      // });
                    },child: Icon(Icons.add),),
                    SizedBox(width: 20,),
                    BlocBuilder<CounterCubit,CounterStates>
                      (builder: (context, state) =>
                        Text("${cubit.count}"),),
                    SizedBox(width: 20,),
                    FloatingActionButton(onPressed: (){
                      // count--;
                      // setState(() {
                      //
                      // });
                      cubit.minus();
                    },child: Icon(Icons.remove),),
                  ],
                )
              ],
            ),
          ),
        );
      },
    ),);
  }
}
