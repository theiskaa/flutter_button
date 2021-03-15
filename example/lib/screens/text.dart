import 'package:flutter/material.dart';
import 'package:flutter_button/flutter_button.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          buildFlutterTextButtons(),
          SizedBox(height: 50),
          divider(),
          SizedBox(height: 50),
          buildGradientTextButtons(),
        ],
      ),
    );
  }

  Column buildGradientTextButtons() {
    return Column(
      children: [
        /// TextButton Default mode
        GradientTextButton(
          title: "Press Me",
          onTap: () {},
        ),
        SizedBox(height: 30),

        /// Full options used version of TextButton
        GradientTextButton(
          onTap: () {},
          title: "Gradient Text Button",
          wOpacity: true,
          opacityValue: .3,
          gradientColors: [
            Colors.red,
            Colors.orange[800],
            Colors.yellow[700],
            Colors.limeAccent[400],
            Colors.blue[900],
            Colors.purple,
            Colors.purple[900]
          ],
          beginGradient: Alignment.topCenter,

          /// [endGradient: ...] also you can add this endGradient function
          defaultSize: 25,
          titleAlign: TextAlign.center,
          tappedSize: 22,
          titleWeight: FontWeight.bold,

          /// [locale:] Whathever you wanna
          /// [fontFamily:] type your fontFamily
        ),
      ],
    );
  }

  Container divider() {
    return Container(
      height: 2,
      color: Colors.black,
    );
  }

  Column buildFlutterTextButtons() {
    return Column(
      children: [
        // TextButton Default mode
        FlutterTextButton(
          wAnimation: true,
          title: "Text Button",
          onTap: () {},
        ),
        SizedBox(height: 30),
        // Full options used version of TextButton
        FlutterTextButton(
          onTap: () {},
          wOpacity: true,
          opacityValue: .3,
          title: "Flutter Custom TextButton",
          defaultSize: 25,
          titleAlign: TextAlign.center,
          tappedSize: 22,
          titleColor: Colors.red[700],
          titleWeight: FontWeight.bold,

          /// [locale:] Whathever you wanna
          /// [fontFamily:] type your fontFamily
        ),
      ],
    );
  }
}
