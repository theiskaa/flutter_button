import 'package:flutter/material.dart';
import 'package:flutter_button/insta/insta_love_button.dart';
import 'package:flutter_button/insta/story_button.dart';

class InstaScreen extends StatelessWidget {
  const InstaScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            buildStoryButton(),
            SizedBox(height: 50),
            buildDivider(),
            SizedBox(height: 50),
            buildInstaDoubleTapLoveButtons(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget buildStoryButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StoryButton(
          size: 80,
          onPressed: () {},
          child: Image.asset(
            'assets/avatar.JPG',
            height: 70,
          ),
          strokeWidth: 3.5,
          radius: 100,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.pink,
              Colors.orange,
            ],
          ),
        ),
        SizedBox(width: 30),
        AnimatedStoryButton(
          onTap: (){},
          storyButton: StoryButton(
            size: 100,
            onPressed: () {},
            child: Image.network(
              'https://avatars1.githubusercontent.com/u/59066341?s=400&v=4',
              height: 80,
            ),
            strokeWidth: 5,
            radius: 100,
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.red,
                Colors.green,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column buildInstaDoubleTapLoveButtons() {
    return Column(
      children: [
        InstaLoveButton(
          image: AssetImage("assets/photo.png"),
          //image: NetworkImage("https://picsum.photos/200/300"),
          onTap: () {},
        ),
        SizedBox(height: 30),
        InstaLoveButton(
          iconColor: Colors.red,
          icon: Icons.favorite_border,
          size: 80,
          height: 250,
          //width: MediaQuery.of(context).size.width,
          curve: Curves.bounceInOut,
          duration: Duration(seconds: 1),
          image: NetworkImage("https://picsum.photos/200/300"),
          // image: AssetImage("assets/photo.png"),

          onTap: () {},
        ),
      ],
    );
  }

  Container buildDivider() {
    return Container(
      height: 2,
      color: Colors.black,
    );
  }
}
