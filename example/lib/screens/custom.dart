import 'package:flutter/material.dart';
import 'package:flutter_button/flutter_button.dart';

// ignore: must_be_immutable
class Custom extends StatelessWidget {
  Custom({Key key}) : super(key: key);
  bool value = false;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
            buildCheckBoxs(), //IT'S JUST DEMO
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
      ),
    );
  }

  Row buildCheckBoxs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedCheckBox(
          activeSize: 55,
          defaultSize: 50,
          activeColor: Colors.red,
          onChanged: () {
            value = !value;
          },
        ),
        SizedBox(width: 15),
        AnimatedTitleCheckBox(
          title: "L",
          onChanged: () {
            value1 = !value1;
            print("AnimatedTitleCheckBox's value = $value1");
          },
        ),
        SizedBox(width: 15),
        AnimatedTitleCheckBox(
          inactiveColor: Colors.grey[300],
          activeSize: 50,
          defaultSize: 45,
          activeTitleSize: 22,
          defaultTitleSize: 16,
          title: "YES",
          onChanged: () {
            value2 = !value2;
            print("Customized AnimatedTitleCheckBox's value = $value2");
          },
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        SizedBox(width: 15),
        AnimatedIconCheckBox(
          icon: Icons.done,
          onChanged: () {
            value3 = !value3;
            print("AnimatedIconCheckBox's value = $value3");
          },
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
          title: "Animated Hover Button",
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
