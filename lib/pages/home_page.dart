import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:task_instagram_app_ui/pages/feed_page.dart';

class HomePage extends StatefulWidget {
  static final String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _pages = [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text('Instagram', style: TextStyle(color: Colors.grey),),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Feather.camera, color: Colors.grey,),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Feather.tv, color: Colors.grey,),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesome.send_o, color: Colors.grey,),
          ),
        ],
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i) {
          setState(() {
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Foundation.home),
              title: Text("Feed")
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.search),
              title: Text("Search")
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.plus_square),
              title: Text("Upload")
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.heart),
              title: Text("Likes")
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.user),
              title: Text("Account")
          ),
        ],
      ),
    );
  }
}
