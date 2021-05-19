import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:task_instagram_app_ui/model/post_model.dart';
import 'package:task_instagram_app_ui/model/story_model.dart';

class FeedPage extends StatefulWidget {
  static final String id = 'feed_page';

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<Story> _stories = [
    Story("assets/images/user_1.jpg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpg", "Lavina"),
    Story("assets/images/user_1.jpg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpg", "Lavina"),
  ];

  List<Post> _posts = [
    Post(
        username: "Brianne",
        userImage: "assets/images/user_1.jpg",
        postImage: "assets/images/feed_1.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Henri",
        userImage: "assets/images/user_2.jpeg",
        postImage: "assets/images/feed_2.jpg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        username: "Mariano",
        userImage: "assets/images/user_3.jpg",
        postImage: "assets/images/feed_3.jpg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(),
            // Buttons: Stories || Watch All
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Stories', style: TextStyle(color: Colors.grey),),
                  Text('Watch All', style: TextStyle(color: Colors.grey),),
                ],
              ),
            ),

            // storylist
            Container(
              height: 110,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _stories.map((story) {
                  return _itemOfStory(story);
                }).toList(),
              ),
            ),

            // postlist
            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _posts.length,
                itemBuilder: (ctx, i) {
                  return _itemOfPost(_posts[i]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemOfStory(Story story) {
    return Column(
      children: [
        // storyImage
        Container(
          margin: EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: Color(0xFF8e44ad),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        SizedBox(height: 10,),

        Text(story.name, style: TextStyle(color: Colors.grey),),
      ],
    );
  }

  Widget _itemOfPost(Post post) {
    return Container(
      child: Column(
        children: [
          // header
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // profileImage
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.postImage),
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(width: 10,),

                    // username
                    Text(post.username, style: TextStyle(color: Colors.grey),),
                  ],
                ),

                IconButton(
                  icon: Icon(SimpleLineIcons.options, color: Colors.grey,),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // postImage
          FadeInImage(
            image: AssetImage(post.postImage),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            placeholder: AssetImage('assets/images/placeholder.png'),
          ),

          // Buttons: like || comment || share || save
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(FontAwesome.heart_o, color: Colors.grey,),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(FontAwesome.comment_o, color: Colors.grey,),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(FontAwesome.send_o, color: Colors.grey,),
                    onPressed: () {},
                  ),
                ],
              ),

              IconButton(
                icon: Icon(FontAwesome.bookmark_o, color: Colors.grey,),
                onPressed: () {},
              ),
            ],
          ),

          // Liked By
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            width: MediaQuery.of(context).size.width,
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Liked By ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                    text: 'Sigmund, Yessenia, Dayana ',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'and ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                    text: '1263 others',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 5,),

          // caption
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            width: MediaQuery.of(context).size.width,
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${post.username} ',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: post.caption,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 5,),

          // postDate
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: Text('February 2021', style: TextStyle(color: Colors.grey), textAlign: TextAlign.start,),
          ),
        ],
      ),
    );
  }
}
