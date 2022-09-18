import 'package:first_project/shared/components/components.dart';
import 'package:first_project/shared/cubit/cubit.dart';
import 'package:first_project/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivedTasks extends StatelessWidget {
  const ArchivedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return tasksBuilder(tasks: cubit.archivedTasks);
      },
    );
  }
}
