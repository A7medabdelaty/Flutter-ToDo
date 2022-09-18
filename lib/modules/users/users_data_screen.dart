import 'package:flutter/material.dart';

import '../../models/user/user.dart';

class UsersData extends StatelessWidget {

  List<DataModel> data = [
    DataModel(id: 1, name: 'Ahmed Abdelaty', phone: '+201027975697'),
    DataModel(id: 2, name: 'Mohamed Abdelaty', phone: '+20102536489'),
    DataModel(id: 3, name: 'Mohsen Ali', phone: '+20106236489'),
    DataModel(id: 4, name: 'Marwan Mohsen', phone: '+25602536489'),
    DataModel(id: 5, name: 'Mohamed Ali', phone: '+201633536489'),
    DataModel(id: 6, name: 'Yousuf Khaled', phone: '+20162536489'),
    DataModel(id: 7, name: 'Mohamed Naser', phone: '+201622536489'),
    DataModel(id: 8, name: 'Ahmed Khaled', phone: '+201062536489'),
    DataModel(id: 9, name: 'Nour Abdelaty', phone: '+20102336489'),
    DataModel(id: 10, name: 'Jana Ahmed', phone: '+20102562489'),
    DataModel(id: 11, name: 'Hour Ahmed', phone: '+20102523489'),
  ];

  UsersData({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => usersDataBuilder(data[index]),
          separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(start: 20.0),
                child: Container(
                  height: 1.0,
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
          itemCount: data.length),
    );
  }

  Widget usersDataBuilder(DataModel model) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
             CircleAvatar(
              radius: 25.0,
              child: Text(
                '${model.id}',
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  model.phone,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      );
}
