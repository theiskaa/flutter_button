import 'package:flutter/material.dart';
import 'package:flutter_button/custom/animated_checkbox.dart';
import 'package:flutter_button/custom/hover_button.dart';
import 'package:flutter_button/custom/insta_love_button.dart';
import 'package:flutter_button/custom/like_button.dart';
import 'package:flutter_button/custom/opacity_button.dart';
import 'package:flutter_button/custom/anime_press_button.dart';
import 'package:flutter_button/custom/story_button.dart';

class Custom extends StatelessWidget {
  const Custom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedCheckBox(
                activeSize: 55,
                defaultSize: 50,
                activeColor: Colors.red,
              ),
              SizedBox(width: 15),
              AnimatedTitleCheckBox(
                title: "L",
              ),
              SizedBox(width: 15),
              AnimatedTitleCheckBox(
                inactiveColor: Colors.grey[300],
                activeSize: 50,
                defaultSize: 45,
                activeTitleSize: 22,
                defaultTitleSize: 16,
                title: "YES",
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              SizedBox(width: 15),
              AnimatedIconCheckBox(
                icon: Icons.done,
              ),
            ],
          ),
          SizedBox(height: 50),
          buildStoryButton(),
          SizedBox(height: 50),
          buildInstaDoubleTapLoveButtons(),
          SizedBox(height: 50),
          buildDivider(),
          SizedBox(height: 50),
          buildHoverButtons(),
          SizedBox(height: 50),
          buildDivider(),
          SizedBox(height: 50),
          buildAnimatedHoverButtons(),
          SizedBox(height: 50),
          buildDivider(),
          SizedBox(height: 50),
          lovebuttons(),
          SizedBox(height: 50),
          buildDivider(),
          SizedBox(height: 50),
          buildOpacityButtons(),
          SizedBox(height: 50),
          buildDivider(),
          SizedBox(height: 50),
          buildAnimePressButton(),
        ],
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
            'assets/like.png',
            height: 40,
          ),
          strokeWidth: 3.5,
          radius: 100,
          gradient: LinearGradient(colors: [
            Colors.pink,
            Colors.orange,
          ]),
        ),
        SizedBox(width: 15),
        AnimatedStoryButton(
          storyButton: StoryButton(
            size: 100,
            onPressed: () {},
            child: Image.asset(
              'assets/like.png',
              height: 40,
            ),
            strokeWidth: 5,
            radius: 100,
            gradient: LinearGradient(
              colors: [
                Colors.pink,
                Colors.orange,
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

  Column buildAnimePressButton() {
    return Column(
      children: [
        AnimePressButton(
          onTap: () {
            print("Tapped Anime Press Button");
          },
          title: "Anime Press Button",
        ),
        SizedBox(height: 30),
        AnimePressButton(
          borderRadius: BorderRadius.circular(100),
          color: Colors.red,
          onTap: () {},
          wGradient: true,
          gradientColors: [
            Colors.pink,
            Colors.purpleAccent,
          ],
          title: "Animation Button",
          titleColor: Colors.white,
        ),
      ],
    );
  }

  Column buildOpacityButtons() {
    return Column(
      children: [
        /// Opacity Button with default [opacityValue]
        OpacityButton(
          onTap: () {},
          child: Image.asset(
            'assets/like.png',
            height: 50,
          ),
        ),
        SizedBox(height: 30),

        /// Opacity Button with the custom [opacityValue]
        OpacityButton(
          onTap: () {},
          opacityValue: .3,
          child: Image.asset(
            'assets/like.png',
            height: 60,
          ),
        ),
      ],
    );
  }

  Column lovebuttons() {
    return Column(
      children: [
        //Default mode
        LikeButton(
          onTap: () {},
        ),
        SizedBox(height: 30),

        /// Attention! if you do some changing on like button you must to do [hot reolad] for view changes
        // Like Button with fully options
        LikeButton(
          icon: Icons.home,
          deactiveColor: Colors.grey,
          activeColor: Colors.purple,
          deactiveSize: 50,
          activeSize: 55,
          curve: Curves.easeInExpo,
          onTap: () {},
        ),
      ],
    );
  }

  Column buildAnimatedHoverButtons() {
    return Column(
      children: [
        // Default Mode
        AnimatedHoverButton(
          //title: "Animated Hover Button",
          onTap: () {},
        ),
        SizedBox(height: 50),
        // Hover button with custom spalsh color,custom title size and border radius
        AnimatedHoverButton(
          onTap: () {},
          title: "Buy Now",
          spashColor: Colors.red,
          titleSize: 20,
          borderRadius: BorderRadius.circular(30),
          duration: Duration(milliseconds: 500),
        ),
        SizedBox(height: 50),
        // And this is all options used version
        AnimatedHoverButton(
          onTap: () {},
          title: "Add To Cart",
          titleSize: 30,
          titleColor: Colors.orange[900],
          spashColor: Colors.yellow,
          tappedTitleColor: Colors.black,
          fontWeight: FontWeight.bold,
          borderColor: Colors.orange[900],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ],
    );
  }

  Column buildHoverButtons() {
    return Column(
      children: [
        // Default Mode
        HoverButton(
          title: "Hover Button",
          onTap: () {},
        ),
        SizedBox(height: 50),
        // Hover button with custom spalsh color,custom title size and border radius
        HoverButton(
          onTap: () {},
          title: "Buy Now",
          spashColor: Colors.red,
          titleSize: 20,
          borderRadius: BorderRadius.circular(30),
        ),
        SizedBox(height: 50),
        // And this is all options used version
        HoverButton(
          onTap: () {},
          title: "Add To Cart",
          titleSize: 30,
          titleColor: Colors.orange[900],
          spashColor: Colors.yellow,
          tappedTitleColor: Colors.black,
          fontWeight: FontWeight.bold,
          borderColor: Colors.orange[900],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
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
