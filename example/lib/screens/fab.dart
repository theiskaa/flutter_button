import 'package:flutter/material.dart';
import 'package:flutter_button/fabs/custom_fab.dart';
import 'package:flutter_button/flutter_button.dart';

class FabScreen extends StatelessWidget {
  const FabScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MenuFAB(
        curve: Curves.bounceInOut,
        animatedIcon: AnimatedIcons.add_event,
        activeColor: Colors.purple,
        inactiveColor: Colors.pink,
        firstItem: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.favorite),
        ),
        seccondItem: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.mail),
        ),
        thirdItem: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.remove),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Column(
            children: [
              buildCustomFabs(),
              SizedBox(height: 50),
              buildDivider(),
              SizedBox(height: 50),
              Column(
                children: [
                  ImageFAB(
                    image: AssetImage("assets/earth.png"),
                    child: Icon(Icons.favorite, color: Colors.red, size: 40),
                    onTap: () {},
                    wOpacity: true,
                    opacityValue: .3,
                  ),
                  SizedBox(height: 50),
                  AnimatedImageFAB(
                    image: AssetImage("assets/moon.png"),
                    onTap: () {},
                    duration: Duration(milliseconds: 150),

                    /// [child:]=
                    /// [defaultSize:]
                    /// [tappedSize:]
                  ),
                ],
              ),
              SizedBox(height: 50),
              buildDivider(),
              SizedBox(height: 50),
              buildStarFabs(),
            ],
          ),
        ),
      ),
    );
  }

  Column buildStarFabs() {
    return Column(
      children: [
        /// Default Star FAB
        StarFAB(
          child: Icon(Icons.add),
          onTap: () {},
        ),
        SizedBox(height: 50),

        /// All properties was used
        StarFAB(
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          splashColor: Colors.red,
          elevation: 5,
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

  Column buildCustomFabs() {
    return Column(
      children: [
        /// Default Custom FAB
        CustomFAB(
          child: Icon(Icons.add),
          onTap: () {},
          border: BorderSide(color: Colors.black),
        ),
        SizedBox(height: 50),

        /// All properties was used
        CustomFAB(
          onTap: () {},
          border: BorderSide(color: Colors.red, width: 3),
          child: Icon(Icons.add, color: Colors.red),
          backgroundColor: Colors.white,
          splashColor: Colors.red,
          hoverColor: Colors.redAccent[700],
          topLeftRadius: 30,
          bottomRightRadius: 30,

          /// Also you can add this property [bottomLeftRadius:]
          /// And this [topRightRadius:]
        ),
        SizedBox(height: 50),
        AnimatedCustomFAB(
          child: Icon(Icons.add, color: Colors.black),
          onTap: () {},
          backgroundColor: Colors.white,
          border: Border.all(color: Colors.black, width: 2),
        ),
        SizedBox(height: 50),
        // Animated Custom FAB with all properties
        AnimatedCustomFAB(
          child: Icon(
            Icons.add_a_photo,
            color: Colors.white,
          ),
          onTap: () {},
          size: 80,
          tappedSize: 70,
          duration: Duration(seconds: 1),
          wGradient: true,
          wShadow: true,

          ///  also u can give [border:] property of the AnimatedCustomFAB
          shadows: [
            BoxShadow(
              blurRadius: 15,
              offset: Offset(0, 15),
              spreadRadius: 2,
              color: Colors.black.withOpacity(.4),
            ),
          ],
          gradientColors: [
            Colors.black,
            Colors.blue[700],
          ],

          /// if [wGradient] property is true than [backgroundColor:] property won't work
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        )
      ],
    );
  }
}
