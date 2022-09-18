import 'package:first_project/modules/counter_screen/cubit/cubit.dart';
import 'package:first_project/modules/counter_screen/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer <CounterCubit, CounterStates>(
      listener: (context, state) {
        if(state is CounterPlusState){
          print('Plus State ${state.counter}');
        }else if(state is CounterMinusState){
          print('Minus State ${state.counter}');
        }
      },
      builder: (context, state){
        return Scaffold(
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    CounterCubit.get(context).minus();
                  },
                  child: const Text(
                    'Minus',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  '${CounterCubit.get(context).counter}',
                  style:
                  const TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 15,
                ),
                TextButton(
                  onPressed: () {
                    CounterCubit.get(context).plus();
                  },
                  child: const Text(
                    'Plus',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      ),
    );
  }
}
