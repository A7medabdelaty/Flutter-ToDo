import 'package:first_project/modules/todo_app_modules/done_screen.dart';
import 'package:first_project/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/todo_app_modules/archived_screen.dart';
import '../../modules/todo_app_modules/tasks_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitState());

  //make object of cubit class
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screen = [
    const Tasks(),
    const DoneTasks(),
    const ArchivedTasks(),
  ];
  List<String> titles = ['Tasks', 'Done Tasks', 'Archived Tasks'];

  //change opened screen form bottom nav bar
  //index 0 => new tasks screen
  //index 1 => done tasks screen
  //index 2 => archived tasks screen
  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNavBar());
  }

  Database? database;

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  //change icon of bottom sheet floating button
  bool isBottomSheetOpened = false;
  Icon floatingButtonIcon = const Icon(Icons.edit);

  void onBottomSheetChange({required bool state, required IconData icon}) {
    isBottomSheetOpened = state;
    floatingButtonIcon = Icon(icon);
    emit(AppBottomSheetState());
  }

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) {
    database?.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
    });
  }

  void getDataFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];

    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archivedTasks.add(element);
        }
      });
      emit(AppGetDatabaseState());
    });
  }

  void updateData({
    required String status,
    required int id,
  }) async {
    database?.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      [status, id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteData({
    required int id,
  }) async {
    database?.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }
}
