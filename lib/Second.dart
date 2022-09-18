import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
    @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: const Text('Image View'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(7.0)),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const Image(
                        image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg')),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: Text(
                        'Sun Set Image',
                        style: TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.black.withOpacity(0.6),
                          fontSize: 20.0,
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
