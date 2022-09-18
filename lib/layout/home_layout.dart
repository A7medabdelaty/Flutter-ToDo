import 'package:first_project/shared/cubit/cubit.dart';
import 'package:first_project/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../shared/components/components.dart';

class TodoApp extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, Object? state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
            titleController.text = '';
            dateController.text = '';
            timeController.text = '';
          }
        },
        builder: (BuildContext context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetOpened) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text);
                  }
                } else {
                  scaffoldKey.currentState
                      ?.showBottomSheet(
                        (context) => Padding(
                          padding: const EdgeInsetsDirectional.all(15.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                defaultInputField(
                                    prefixIcon: Icons.title,
                                    label: 'Task Title',
                                    controller: titleController,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Title Must Not Be Empty';
                                      } else {
                                        return null;
                                      }
                                    }),
                                //title input field
                                const SizedBox(
                                  height: 15,
                                ),
                                defaultInputField(
                                    readOnly: true,
                                    prefixIcon: Icons.date_range,
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime(2024),
                                      ).then((value) {
                                        dateController.text =
                                            DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                    label: 'Task Date',
                                    controller: dateController,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Date Must Not Be Empty';
                                      } else {
                                        return null;
                                      }
                                    }),
                                //date input field
                                const SizedBox(
                                  height: 15,
                                ),
                                defaultInputField(
                                    readOnly: true,
                                    onTap: () {
                                      showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now())
                                          .then((value) {
                                        timeController.text =
                                            value!.format(context).toString();
                                      });
                                    },
                                    prefixIcon: Icons.watch_later_outlined,
                                    label: 'Task Time',
                                    controller: timeController,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Time Must Not Be Empty';
                                      } else {
                                        return null;
                                      }
                                    }), //time input field
                              ],
                            ),
                          ),
                        ),
                        elevation: 20.0,
                      )
                      .closed
                      .then((value) {
                    cubit.onBottomSheetChange(state: false, icon: Icons.edit);
                  });
                  cubit.onBottomSheetChange(state: true, icon: Icons.add);
                }
              },
              child: cubit.floatingButtonIcon,
            ),
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive), label: 'Archive'),
              ],
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
