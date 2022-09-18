import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
            onPressed: () {
              print('Menu');
            },
            icon: const Icon(Icons.menu)),
        title: const Text('Home'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                print('Search');
              }),
        ],
      ),

      body: Container(
        width: 280,
        height: double.infinity,
        color: Colors.red,
        child: Column(
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                color: Colors.red,
                child: const Text(
                  'First',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),

            Expanded(
              child: Container(
                color: Colors.green,
                child: const Text(
                  'Second',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
                child: const Text(
                  'Third',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.amber,
                child: const Text(

                  'Fourth',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                child: const Text(
                  'first child',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                color: Colors.green,
                child: const Text(
                  'second child',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                child: const Text(
                  'third child',
                  style: TextStyle(
                    backgroundColor: Colors.blue,
                    color: Colors.white,
                    fontSize: 35.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                color: Colors.amber,
                child: const Text(
                  'fourth child',
                  style: TextStyle(
                    backgroundColor: Colors.amberAccent,
                    color: Colors.white,
                    fontSize: 35.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//