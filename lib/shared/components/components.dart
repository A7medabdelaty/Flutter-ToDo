import 'package:first_project/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';

Widget defaultInputField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  var onSubmit,
  required String label,
  IconData? prefixIcon,
  IconData? suffixIcon,
  var onTap,
  bool readOnly = false,
  validator,
  var suffixAction,
  bool obscureText = false,
}) =>
    TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      onFieldSubmitted: onSubmit,
      obscureText: obscureText ? true : false,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: IconButton(
            onPressed: suffixAction,
            icon: Icon(
              suffixIcon,
            )),
        border: const OutlineInputBorder(),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  required String text,
  Color color = Colors.blue,
  var onPressed,
  double radius = 0.0,
}) =>
    Container(
        height: 50.0,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            text.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ));

Widget taskBuildItem(Map task, context) {
  return Dismissible(
    key: Key(task['id'].toString()),
    onDismissed: (direction) {
      AppCubit.get(context).deleteData(id: task['id']);
    },
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            child: Text('${task['time']}'),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${task['title']}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text('${task['date']}'),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    AppCubit.get(context)
                        .updateData(status: 'done', id: task['id']);
                  },
                  icon: const Icon(
                    Icons.add_task,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context)
                        .updateData(status: 'archived', id: task['id']);
                  },
                  icon: const Icon(
                    Icons.archive,
                    color: Colors.black45,
                  )),
            ],
          )
        ],
      ),
    ),
  );
}

Widget tasksBuilder({
  required List<Map> tasks,
}) {
  if (tasks.isNotEmpty) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return taskBuildItem(tasks[index], context);
      },
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20.0,
        ),
        child: Container(
          width: double.infinity,
          height: 1.0,
          color: Colors.grey[300],
        ),
      ),
      itemCount: tasks.length,
    );
  } else {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.menu,
            size: 100.0,
            color: Colors.grey,
          ),
          Text(
            'No Tasks Yet, Please Add Some Tasks',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
