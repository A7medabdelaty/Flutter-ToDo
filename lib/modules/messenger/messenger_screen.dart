
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 16.0,
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-1/240326552_1416530585388782_300186557201561371_n.jpg?stp=cp0_dst-jpg_p60x60&_nc_cat=105&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeHlAeQ1hKf0b22KF4050my2PsGObaMRe3w-wY5toxF7fBwQSnUCv94q_5qF9TDBi2UEuJhENTmn030HSUyPS-WU&_nc_ohc=P6VZlLFX1nQAX-jlGEA&_nc_ht=scontent.faly1-2.fna&oh=00_AT_C984yCQHgPuWgNpgNd-qgktjEUgkAQZPm6e8o_bA0sw&oe=62C85E75'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(child: Icon(Icons.camera_alt))),
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(child: Icon(Icons.edit))),
          const SizedBox(
            width: 10.0,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[400],
                ),
                height: 35.0,
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('Search'),
                  ],
                ),
              ), //search bar
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 100.0,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) => buildStoryItem()),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 15.0,
                        ),
                    itemCount: 7),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildChatItem(),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15.0,
                      ),
                  itemCount: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStoryItem() => SizedBox(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: const [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-1/240326552_1416530585388782_300186557201561371_n.jpg?stp=cp0_dst-jpg_p60x60&_nc_cat=105&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeHlAeQ1hKf0b22KF4050my2PsGObaMRe3w-wY5toxF7fBwQSnUCv94q_5qF9TDBi2UEuJhENTmn030HSUyPS-WU&_nc_ohc=P6VZlLFX1nQAX-jlGEA&_nc_ht=scontent.faly1-2.fna&oh=00_AT_C984yCQHgPuWgNpgNd-qgktjEUgkAQZPm6e8o_bA0sw&oe=62C85E75'),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 2.0, end: 2.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 7.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(bottom: 2.0, end: 2.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 7.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 7.0,
            ),
            const Text(
              'Ahmed Abdelaty',
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ); //Single Story Element

  Widget buildChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-1/240326552_1416530585388782_300186557201561371_n.jpg?stp=cp0_dst-jpg_p60x60&_nc_cat=105&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeHlAeQ1hKf0b22KF4050my2PsGObaMRe3w-wY5toxF7fBwQSnUCv94q_5qF9TDBi2UEuJhENTmn030HSUyPS-WU&_nc_ohc=P6VZlLFX1nQAX-jlGEA&_nc_ht=scontent.faly1-2.fna&oh=00_AT_C984yCQHgPuWgNpgNd-qgktjEUgkAQZPm6e8o_bA0sw&oe=62C85E75'),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: 2.0, end: 2.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 7.5,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: 2.0, end: 2.0),
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 7.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ahmed Abdelaty Ahmed Abdelaty Ahmed Abdelaty',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        maxLines: 1,
                        'hi, how are you? all fine?, pla pla pla pla',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 3.0,
                    ),
                    SizedBox(
                      width: 7.0,
                    ),
                    Text('02.08 pm'),
                  ],
                )
              ],
            ),
          )
        ],
      ); //Single Chat Element
}
