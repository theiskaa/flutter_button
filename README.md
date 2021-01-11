### `flutter_button` extension contains:

- 3D Button,
- Anime Press Button, Hover Button Animated Hover Button, Like Button, Opacity Button, Insta Double Tap Love Button/Card,
- Auth Button, Facebook Auth Button, Circle FB Auth Button, Magical FB Auth Button, Google Auth Button,
  Circle GG Auth Button, Magical GG Auth Button, Github Auth Button, Circle GI Auth Button,
  Magical Gi Auth Button, Twitter Auth Button, Circle TW Auth Button, Magical TW Auth Button,
- Text Button, Gradient Text Button.
- Custom FAB, Star FAB, Animated Custom FAB.


## Overview

**_Usage and everthing about this packages was underlined down below. if you wanna to know more about using this plugin check example repo_** [example repository](https://github.com/theiskaa/flutter_button/tree/main/example).

<img src="https://github.com/theiskaa/flutter_button/blob/main/example/assets/gif/3D.gif" width="200"> <img src="https://github.com/theiskaa/flutter_button/blob/main/example/assets/gif/social1.gif" width="200"> <img src="https://github.com/theiskaa/flutter_button/blob/main/example/assets/gif/social.gif" width="200"> <img src="https://github.com/theiskaa/flutter_button/blob/main/example/assets/gif/custom1.gif" width="200"> <img src="https://github.com/theiskaa/flutter_button/blob/main/example/assets/gif/custom.gif" width="200"> <img src="https://github.com/theiskaa/flutter_button/blob/main/example/assets/gif/text.gif" width="200"> <img src="https://github.com/theiskaa/flutter_button/blob/main/example/assets/gif/fab.gif" width="200">

# Installation and Usage.
add this line on the `pubspec.yaml`

```dart
dependencies:
  ...
  flutter_button: ^0.0.2
```

# OKI let's start using this 🏹

## 🛑 3D Button usage

**_Default Mode_**

```dart
import 'package:flutter_button/3d/3d_button.dart';

Button3D(
 onPressed: () {},
 child: Text("3d Button"),
),
```

**_3D Buttons With the custom properties_**

```dart
import 'package:flutter_button/3d/3d_button.dart';

 Button3D(
 style: StyleOf3dButton(
    backColor: Colors.red[900],
    topColor: Colors.red[400],
    borderRadius: BorderRadius.circular(30),
 ),
  height: 100,
  width: 200,
  onPressed: () {},
  child: Text("3d Button"),
),
```

# ⚛︎ Social Auth Buttons

**_Default Mode of Auth Button_**

```dart
import 'package:flutter_button/social/auth_button.dart';

AuthButton(
 onTap: () {},
 child: Text("Sign In"),
),
```

**_All Properties used version of Auth button_**

```dart
AuthButton(
  onTap: () {},
  child: childOfAuthButton(),

  /// [opacityValue] is providing the value of the tapped button's opacity value.
  opacityValue: .5,
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
```

**_Default Mode of facebook auth button_**

```dart
import 'package:flutter_button/social/facebook_auth_button.dart';

FacebookAuthButton(
  onTap: () {},
  borderRadius: BorderRadius.circular(30),
),
```

**_Facebook Auth Button with custom properties_**

```dart
import 'package:flutter_button/social/facebook_auth_button.dart';

FacebookAuthButton(
 onTap: () {},
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
   color: Colors.black,
  ),
 ],
),
```

**_Default Mode of Google Auth Button_**

```dart
import 'package:flutter_button/social/google_auth_button.dart';

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
```

**_Google Auth Button with custom properties_**

```dart
import 'package:flutter_button/social/google_auth_button.dart';

GoogleAuthButton(
 onTap: () {},
 wGradientColors: true,
 wOpacity: true,
 upperCasedTitle: true,
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
    color: Color(0xff4285F4),
  ),
 ]
),
```

**_Default Mode of github auth button_**

```dart
import 'package:flutter_button/social/github_auth_button.dart';

GithubAuthButton(
 borderRadius: BorderRadius.circular(30),
 onTap: () {},
),
```

**_Github Auth Button with custom properties_**

```dart
import 'package:flutter_button/social/github_auth_button.dart';

GithubAuthButton(
 onTap: () {},
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
```

**_Default Mode of Twitter auth button_**

```dart
import 'package:flutter_button/social/twitter_auth_button.dart';

TwitterAuthButton(
  borderRadius: BorderRadius.circular(30),
  onTap: () {},
),
```

**_Twitter Auth Button with custom properties_**

```dart
import 'package:flutter_button/social/twitter_auth_button.dart';

TwitterAuthButton(
  onTap: () {},
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
```

## Circular Auth Buttons

**_Facebook_**

```dart
import 'package:flutter_button/social/facebook_auth_button.dart';

CircularFBAuthButton(
  borderRadius: BorderRadius.circular(30),
  onTap: () {},
  shadows: [
    BoxShadow(
     spreadRadius: 1.5,
     blurRadius: 10,
     offset: Offset(2, 6),
     color: Colors.black,
    ),
  ],
),
```

**_Google_**

```dart
import 'package:flutter_button/social/google_auth_button.dart';

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
```

**_Github_**

```dart
import 'package:flutter_button/social/github_auth_button.dart';

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
```

**_Twitter_**

```dart
import 'package:flutter_button/social/twitter_auth_button.dart';

 CircularTWAuthButton(
  borderRadius: BorderRadius.circular(30),
  onTap: () {},
  wOpacity: true,
),
// you of course can customize for yourself this button button i like this button with the default style
```

## Magical Auth Buttons

**_Facebook_**

```dart
import 'package:flutter_button/social/facebook_auth_button.dart';

MagicalFBButton(
  title: "Sign In With Facebook",
  opacityValue: .5,
  onTap: () {},
),
```

**_Google_**

```dart
import 'package:flutter_button/social/google_auth_button.dart';

MagicalGGButton(
  title: "Sign In With Google",
  opacityValue: .5,
  onTap: () {},
),
```

**_Github_**

```dart
import 'package:flutter_button/social/github_auth_button.dart';

MagicalGIButton(
 title: "Sign In With Google",
 opacityValue: .5,
 onTap: () {},
),
```

**_Twitter_**

```dart
import 'package:flutter_button/social/twitter_auth_button.dart';

MagicalTWButton(
 title: "Sign In With Twitter",
 opacityValue: .5,
 onTap: () {},
),
```

# 💢 Custom Buttons: Hover, like, Opacity, Animation, Insta doubletap like...

## 🌪 Hover Button:

**_Default mode_**

```dart
import 'package:flutter_button/custom/hover_button.dart';

HoverButton(
  title: "Hover Button",
  onTap: () {},
),
```

**_All properties used version_**

```dart
import 'package:flutter_button/custom/hover_button.dart';

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
```

### 🌪 Animated Hover Button:

**_Default mode_**

```dart
import 'package:flutter_button/custom/hover_button.dart';

AnimatedHoverButton(
  title: "Animated Hover Button",
  onTap: () {},
),
```

**_All properties used version_**

```dart
import 'package:flutter_button/custom/hover_button.dart';

AnimatedHoverButton(
 onTap: () {},
 title: "Add To Cart",
 titleSize: 30,
 duration: Duration(milliseconds: 500),
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
```

## ❤️ Like Button:

**_Default mode_**

```dart
import 'package:flutter_button/custom/like_button.dart';

LikeButton(
  onTap: () {},
),
```

**_All properties used version_**

```dart
import 'package:flutter_button/custom/like_button.dart';

LikeButton(
  icon: Icons.home,
  deactiveColor: Colors.grey,
  activeColor: Colors.purple,
  deactiveSize: 50,
  activeSize: 55,
  curve: Curves.easeInExpo,
  onTap: () {},
),
```

## 👻 Opacity Button:

```dart
import 'package:flutter_button/custom/opacity_button.dart';

OpacityButton(
  onTap: () {},
  opacityValue: .3,
  child: Image.network(
    'https://picsum.photos/id/1/200/300',
    height: 60,
  ),
),
```

## ⭐️ Animation Button:

```dart
import 'package:flutter_button/custom/anime_press_button.dart';

AnimePressButton(
  borderRadius: BorderRadius.circular(100),
  color: Colors.red,
  wGradient: true,
  gradientColors: [
    Colors.pink,
    Colors.purpleAccent,
  ],
  title: "Animation Button",
  titleColor: Colors.white,
),
```

## ❤️ Insta DoubleTap Love Button:

**_Default Usage_**

```dart
import 'package:flutter_button/custom/insta_love_button.dart';

InstaLoveButton(
  image: NetworkImage("https://picsum.photos/200/300"),
  onTap: () {},
),
```

**_All Properties used mode and with asset's image_**

```dart
import 'package:flutter_button/custom/insta_love_button.dart';

InstaLoveButton(
  iconColor: Colors.red,
  icon: Icons.favorite_border,
  size: 80,
  height: 250,
  //width: MediaQuery.of(context).size.width,
  curve: Curves.bounceInOut,
  duration: Duration(seconds: 1),
  image: AssetImage("assets/photo.png"),
  //image: NetworkImage("https://picsum.photos/200/300"),
  onTap: () {},
),
```

# 🆃 Text Buttons

## Normal Text Button:

```dart
import 'package:flutter_button/text/text_button.dart';

FlutterTextButton(
  onTap: () {},
  title: "Flutter Normal TextButton",
  defaultSize: 25,
  textAlign: TextAlign.center,
  pressedSize: 22,
  color: Colors.red[700],
  fontWeight: FontWeight.bold,
  // [locale:] Whathever you want
  // [fontFamily:] type your fontFamily
),
```

## 🏳️‍🌈 Gradient text button:

```dart
import 'package:flutter_button/text/gradient_text_button.dart';

GradientTextButton(
  onTap: () {},
  title: "Gradient Text Button",
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
  textAlign: TextAlign.center,
  pressedSize: 22,
  fontWeight: FontWeight.bold,
  /// [locale:] Whathever you wanna
  /// [fontFamily:] type your fontFamily
),
```

# 🔵 Floating Action Buttons

## ⚫️ Custom FAB

**_Default Mode_**

```dart
import 'package:flutter_button/fabs/custom_fab.dart';

CustomFAB(
 child: Icon(Icons.add),
 onTap: () {},
)
```

**_Custom Fab with all properties_**

```dart
import 'package:flutter_button/fabs/custom_fab.dart';

CustomFAB(
 onTap: () {},
 child: Icon(Icons.add),
 backgroundColor: Colors.red,
 splashColor: Colors.black,
 hoverColor: Colors.blueGrey,
 topLeftRadius: 30,
 bottomRightRadius: 30,
 /// Also you can add this property [bottomLeftRadius:]
 /// And this [topRightRadius:]
),
```

## ⚫️🌪 Animated Custom FAB

**_Default Mode_**

```dart
import 'package:flutter_button/fabs/custom_fab.dart';

AnimatedCustomFAB(
  child: Icon(Icons.add,color: Colors.white),
  onTap: () {},
),
```

**_Animated Custom Fab with all properties_**

```dart
import 'package:flutter_button/fabs/custom_fab.dart';
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
  shadows: [
    BoxShadow(
      blurRadius: 15,
      offset: Offset(0, 15),
      spreadRadius: 2,
      color: Colors.black.withOpacity(.4)
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
```

## ⭐️ Star FAB

**_Default Mode_**

```dart
import 'package:flutter_button/fabs/star_fab.dart';

StarFAB(
 child: Icon(Icons.add),
 onTap: () {},
),
```

**_Custom Fab with all properties_**

```dart
import 'package:flutter_button/fabs/star_fab.dart';

StarFAB(
 backgroundColor: Colors.black,
 child: Icon(Icons.add),
 splashColor: Colors.red,
 elevation: 5,
 onTap: () {},
),
```

if you wanna to look this package's full usage exapmle, check the example repo which one is down to this package's repository: [example repository](https://github.com/theiskaa/flutter_button/tree/main/example).
