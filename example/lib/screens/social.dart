import 'package:flutter/material.dart';
import 'package:flutter_button/social/facebook_auth_button.dart';
import 'package:flutter_button/social/google_auth_button.dart';
import 'package:flutter_button/social/github_auth_button.dart';
import 'package:flutter_button/social/twitter_auth_button.dart';
import 'package:flutter_button/social/auth_button.dart';

class Social extends StatelessWidget {
  const Social({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(height: 30),
          builAuthButtons(context),
          SizedBox(height: 50),
          buildDivider(),
          SizedBox(height: 50),
          buildFacebookContainer(),
          SizedBox(height: 50),
          buildDivider(),
          SizedBox(height: 50),
          buildGoogleContainer(),
          SizedBox(height: 50),
          buildDivider(),
          SizedBox(height: 50),
          buildGithubButtons(),
          SizedBox(height: 50),
          buildDivider(),
          SizedBox(height: 50),
          buildTwitterButtons(),
          SizedBox(height: 50),
          buildDivider(),
          SizedBox(height: 50),
          buildFacebooksMagicals(),
          SizedBox(height: 50),
          buildDivider(),
          SizedBox(height: 50),
          buildGooglesMagicals(),
          SizedBox(height: 50),
          buildDivider(),
          SizedBox(height: 50),
          buildGithubsMagicals(),
          SizedBox(height: 50),
          buildDivider(),
          SizedBox(height: 50),
          buildTwitterMagicals(),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Column builAuthButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Default mode of Auth Button
        AuthButton(
          onTap: () => print("default mode of auth mode"),
          child: Text("Sign In"),
        ),
        SizedBox(height: 30),

        /// All Properties used version of auth button
        AuthButton(
          onTap: () => print("All Properties used version of auth button"),

          /// [opacityValue] is providing the value of the tapped button's opacity value.
          opacityValue: .5,
          child: childOfAuthButton(),
          height: 55,
          width: MediaQuery.of(context).size.width / 1.2,
          border: Border.all(color: Colors.white),
          wGradient:
              true, // if [wGradient] propert is true than [backgroundColor] property won't work
          gradientColors: [
            Colors.black.withOpacity(.7),
            Colors.blue[700].withOpacity(.7),
          ],
          topLeftRadius: 0,
          topRightRadius: 40,
          bottomLeftRadius: 40,
          bottomRightRadius: 0,
          shadow: [
            BoxShadow(
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3),
              color: Colors.grey[900],
            ),

            /// Also you can add [decorationImage] val
          ],
        ),
      ],
    );
  }

  Text childOfAuthButton() {
    return Text(
      "Sing Up for free",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Column buildTwitterMagicals() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //You can add title, opacity value and onTap method on MagicalTWButton
        MagicalTWButton(
          title: "Sign In With Twitter",
          opacityValue: .5,
          onTap: () {},
        ),
      ],
    );
  }

  Column buildTwitterButtons() {
    return Column(
      children: [
        //Default Usage
        TwitterAuthButton(
          borderRadius: BorderRadius.circular(30),
          onTap: () {},
        ),
        SizedBox(height: 20),

        /// All Properties was used mode
        TwitterAuthButton(
          onTap: () {},
          title: "Register With Twitter",
          wGradientColors: true,
          wOpacity: true,
          iconColor: Colors.black,
          titleColor: Colors.black,
          iconSize: 30,
          borderRadius: BorderRadius.circular(30),
          opacityValue: .4,
          gradientColors: [
            Colors.white,
            Colors.white,
          ],
          shadows: [
            BoxShadow(
              spreadRadius: 1.5,
              blurRadius: 10,
              offset: Offset(0.5, 6),
              color: Colors.black,
            ),
          ],
        ),
        SizedBox(height: 30),
        //Default usage
        CircularTWAuthButton(
          borderRadius: BorderRadius.circular(30),
          onTap: () {},
          wOpacity: true,
        ),
        SizedBox(height: 20),

        /// All Properties was used mode
        CircularTWAuthButton(
          backgorundColor: Colors.white,
          opacityValue: .5,
          wOpacity: true,
          wBorder: true,
          iconColor: Colors.black,
          shadows: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0.5, 3),
              color: Colors.black,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          onTap: () {},
        ),
      ],
    );
  }

  Column buildGithubsMagicals() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // You can add title, opacity value and onTap method
        MagicalGIButton(
          title: "Sign In With Google",
          opacityValue: .5,
          onTap: () {},
        ),
      ],
    );
  }

  Column buildGithubButtons() {
    return Column(
      children: [
        //Default Usage
        GithubAuthButton(
          borderRadius: BorderRadius.circular(30),
          wOpacity: true,
          onTap: () {},
        ),
        SizedBox(height: 20),

        /// All Properties was used mode
        GithubAuthButton(
          onTap: () {},
          title: "Sign In With Github",
          fontSize: 22,
          wGradientColors: true,
          wOpacity: true,
          iconColor: Colors.black,
          titleColor: Colors.black,
          iconSize: 30,
          borderRadius: BorderRadius.circular(30),
          opacityValue: .4,
          gradientColors: [
            Colors.white,
            Colors.white,
          ],
          shadows: [
            BoxShadow(
              spreadRadius: 1.5,
              blurRadius: 10,
              offset: Offset(0.5, 6),
              color: Colors.black,
            ),
          ],
        ),
        SizedBox(height: 30),
        //Default usage
        CircularGIAuthButton(
          borderRadius: BorderRadius.circular(30),
          onTap: () {},
        ),
        SizedBox(height: 20),

        /// All Properties was used mode
        CircularGIAuthButton(
          backgorundColor: Colors.white,
          opacityValue: .7,
          wOpacity: true,
          wBorder: true,
          iconColor: Colors.black,
          shadows: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0.5, 3),
              color: Colors.black,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          onTap: () {},
        ),
      ],
    );
  }

  Column buildGooglesMagicals() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // You can add title, opacity value and onTap method
        MagicalGGButton(
          title: "Sign In With Google",
          opacityValue: .5,
          onTap: () {},
        ),
      ],
    );
  }

  Column buildFacebooksMagicals() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // You can add title, opacity value and onTap method
        MagicalFBButton(
          title: "Sign In With Facebook",
          opacityValue: .5,
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

  Column buildGoogleContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google auth button with shadow
        GoogleAuthButton(
          onTap: () {},
          borderRadius: BorderRadius.circular(30),
          shadows: [
            BoxShadow(
              spreadRadius: 1.5,
              blurRadius: 10,
              offset: Offset(2, 7),
              color: Color(0xff4285F4),
            ),
          ],
        ),
        SizedBox(height: 20),
        // Google Auth button with custom gradient and with custom opacity value and uppered case title
        GoogleAuthButton(
          onTap: () {},
          title: "Sign In With Google",
          fontSize: 22,
          wGradientColors: true,
          wOpacity: true,
          iconColor: Colors.white,
          titleColor: Colors.white,
          borderRadius: BorderRadius.circular(30),
          opacityValue: .5,
          gradientColors: [
            Colors.black,
            Colors.blueGrey,
          ],
          shadows: [
            BoxShadow(
              spreadRadius: 1.5,
              blurRadius: 10,
              offset: Offset(2, 7),
              color: Colors.black,
            ),
          ],
        ),
        SizedBox(height: 20),
        // Circular Google auth button with default mode and with border radius and with shadow,
        CircularGGAuthButton(
          borderRadius: BorderRadius.circular(30),
          onTap: () {},
          shadows: [
            BoxShadow(
              spreadRadius: 1.5,
              blurRadius: 10,
              offset: Offset(2, 6),
              color: Color(0xff4285F4),
            ),
          ],
        ),
        SizedBox(height: 20),
        // Circular Facebook auth button with icon color and shadow,
        CircularGGAuthButton(
          borderRadius: BorderRadius.circular(30),
          onTap: () {},
          wOpacity: true,
          backgorundColor: Colors.white,
          iconColor: Colors.black,
          shadows: [
            BoxShadow(
              spreadRadius: 1.5,
              blurRadius: 10,
              offset: Offset(2, 6),
              color: Colors.black,
            ),
          ],
        ),
      ],
    );
  }
}

Column buildFacebookContainer() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Facebook auth button default mode
      FacebookAuthButton(
        onTap: () {},
        borderRadius: BorderRadius.circular(30),
      ),
      SizedBox(height: 20),
      // Facebook Auth button with custom gradient and with custom opacity value and shadow
      FacebookAuthButton(
        onTap: () {},
        title: "Sign Up With Facebook",
        fontSize: 20,
        wGradientColors: true,
        wOpacity: true,
        borderRadius: BorderRadius.circular(30),
        opacityValue: .4,
        gradientColors: [
          Colors.black,
          Colors.blueGrey,
        ],
        shadows: [
          BoxShadow(
            spreadRadius: 1.5,
            blurRadius: 10,
            offset: Offset(2, 8),
            color: Color(0xff4267B2),
          ),
        ],
      ),
      SizedBox(height: 20),
      // Circular Facebook auth button with default mode and with border radius,
      CircularFBAuthButton(
        borderRadius: BorderRadius.circular(30),
        onTap: () {},
      ),
      SizedBox(height: 20),
      // Circular Facebook auth button with icon color and shadow,
      CircularFBAuthButton(
        borderRadius: BorderRadius.circular(30),
        onTap: () {},
        wOpacity: true,
        backgorundColor: Colors.white,
        iconColor: Colors.black,
        shadows: [
          BoxShadow(
            spreadRadius: 1.5,
            blurRadius: 10,
            offset: Offset(2, 6),
            color: Colors.black,
          ),
        ],
      ),
    ],
  );
}
