# <div align="center">Flutter Button</div>

<div align="center">flutter_button, which is a flutter package, contains animated, cool and awesome buttons. That you may like, thanks to this package you will be able to develop your application in a faster and cleaner code form.</div><br>  
<div align="center">
  <a href="https://flutter.dev">
    <img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter"
      alt="Platform" />
  </a>
  <a href="https://pub.dev/packages/flutter_button">
    <img src="https://img.shields.io/pub/v/flutter_button.svg"
      alt="Pub Package" />
  </a>
  <br>
  <a href="https://github.com/theiskaa/restnote/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/theiskaa/flutter_button?color=red"
      alt="License: MIT" />
  </a>
</div><br>

# Content's table

- [Installing](#installing)
- [Buttons Usage](#usage)
  - [3D Button](#3D-Buttons)
  - [Instagram Double Tap Love Button](#InstaLove)
  - [Instagram Story Button](#InstaStory)
  - [Hover Button](#Hover)
  - [Like Button](#Like)
  - [CheckBox Button](#CheckBox)
  - [Anime Press Button](#AnimePress)
  - [Animation FAB](#AnimationFAB)
  - [Custom FAB](#CustomFAB)
  - [Star FAB](#StarFAB)
  - [Image FAB](#ImaegFAB)
  - [Menu FAB](#MenuFAB)
  - [Flutter Text Button](#Text)
  - [Gradient Text Button](#GradientText)
  - [Social Auth Buttons](#Social)
- [Contributors](#contributors)

# Installing

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_button: ^0.0.4
```

and command pub get in termianal

```
$ flutter pub get
```

and time to import package.

```dart
import 'package:flutter_button/flutter_button.dart';
```

# Usage

## 3D-Buttons

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/3d.gif" align = "right" height = "350px">

```dart
Button3D(
  onPressed: () {},
  child: Text("3d Button"),
),

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

## InstaLove

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/instalove.gif" align = "right" height = "350px">

```dart
InstaLoveButton(
  image: AssetImage("assets/photo.png"),
  onTap: () {},
),

InstaLoveButton(
 iconColor: Colors.red,
 icon: Icons.favorite_border,
 size: 80,
 height: 250,
 //width: MediaQuery.of(context).size.width,
 curve: Curves.bounceInOut,
 duration: Duration(seconds: 1),
 image: NetworkImage("https://picsum.photos/200/300"),
 onTap: () {},
),
```

## InstaStory

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/story.gif" align = "right" height = "200px">

```dart
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
```

## Hover

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/hover.gif" align = "right" height = "300px">

```dart
HoverButton(
 title: "Hover Button",
 onTap: () {},
),

AnimatedHoverButton(
 title: "Animated Hover Button",
 onTap: () {},
),
```

**Note:** You can override so customise button with this parameters: `titleSize`, `titleColor`, `spashColor`, `tappedTitleColor`, `fontWeight`, `borderColor`, `borderRadius`.

## Like

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/like.gif" align = "right" height = "300px">

```dart
//Default mode
LikeButton(
 onTap: () {},
),
SizedBox(height: 30),
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
```

## CheckBox

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/checkbox.gif" align = "right" height = "300px">

```dart
AnimatedCheckBox(
 activeSize: 55,
 defaultSize: 50,
 activeColor: Colors.red,
 onChanged: () {
  value = !value;
 },
),
//
AnimatedTitleCheckBox(
  title: "L",
  onChanged: () {
   value1 = !value1;
   print("AnimatedTitleCheckBox's value = $value1");
 },
),
//
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
//
AnimatedIconCheckBox(
 icon: Icons.done,
 onChanged: () {
  value3 = !value3;
  print("AnimatedIconCheckBox's value = $value3");
 },
),
```

## Opacity

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/opacity.gif" align = "right" height = "250px">

```dart
OpacityButton(
  onTap: () {},
  opacityValue: .3,
  child: Image.asset(
    'assets/like.png',
    height: 60,
  ),
),
```

## AnimePress

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/animepress.gif" align = "right" height = "200px">

```dart
AnimePressButton(
 onTap: () {},
 title: "Anime Press Button",
),

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
```

## AnimationFAB

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/animatedFAB.gif" align = "right" height = "250px">

```dart
AnimatedCustomFAB(
 child: Icon(Icons.add, color: Colors.black),
 onTap: () {},
 backgroundColor: Colors.white,
 border: Border.all(color: Colors.black, width: 2),
),
```

**Note:** You can also override so customise button with this parameters: `size`, `tappedSize`, `duration`, `wGradient`, `wShadow`, `shadows`, `gradientColors`, `borderRadius`.
if `wGradient` property is true than `backgroundColor:` property won't work.

## CustomFAB

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/customFAB.gif" align = "right" height = "230px">

```dart
CustomFAB(
 child: Icon(Icons.add),
 onTap: () {},
 border: BorderSide(color: Colors.black),
),
```

**Note:** You can also override so customise button with this parameters: `backgroundColor`, `splashColor`, `hoverColor`, `topLeftRadius`, `bottomRightRadius`, `topRightRadius`, `bottomLeftRadius`.

## StarFAB

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/starFAB.gif" align = "right" height = "200px">

```dart
StarFAB(
 child: Icon(Icons.add),
 onTap: () {},
),

/// All properties was used
StarFAB(
 backgroundColor: Colors.black,
 child: Icon(Icons.add),
 splashColor: Colors.red,
 elevation: 5,
 onTap: () {},
),
```

## ImaegFAB

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/imageFAB.gif" align = "right" height = "200px">

```dart
ImageFAB(
 image: AssetImage("assets/earth.png"),
 child: Icon(Icons.favorite, color: Colors.red, size: 40),
 onTap: () {},
 wOpacity: true,
 opacityValue: .3,
),
```

**Note:** You can also override so customise button with this parameters: `borderRadius`, `border`, `shadows`, `onImageError`, `imageColorFilter`, `imageFit`, `imageAlignment`, `imageCenterSlice`, `imageRepeat`, `imageMatchTextDirection`, `imageScale`.

## MenuFAB

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/menuFAB.gif" align = "right" height = "350px">

```dart
MenuFAB(
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
```

## Text

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/text.gif" align = "right" height = "350px">

```dart
FlutterTextButton(
 title: "Text Button",
 onTap: () {},
),

// Full options used version of TextButton
FlutterTextButton(
  onTap: () {},
  wOpacity: true,
  opacityValue: .3,
  title: "Flutter Custom TextButton",
  defaultSize: 25,
  textAlign: TextAlign.center,
  pressedSize: 22,
  color: Colors.red[700],
  fontWeight: FontWeight.bold,

  /// [locale:] Whathever you wanna
  /// [fontFamily:] type your fontFamily
),
```

## GradientText

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/gradienttext.gif" align = "right" height = "350px">

```dart
GradientTextButton(
 title: "Press Me",
 onTap: () {},
),

/// Full options used version of TextButton
GradientTextButton(
  onTap: () {},
  title: "Gradient Text Button",
  wOpacity: true,
  opacityValue: .3,
  gradientColors: [...],
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

## Social

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/social.gif" align = "right" height = "350px">

```dart
GithubAuthButton(
  borderRadius: BorderRadius.circular(30),
  wOpacity: true,
  onTap: () {},
),

CircularGIAuthButton(
 borderRadius: BorderRadius.circular(30),
 onTap: () {},
wOpacity: true,
),

```

### **Note:**
**`GithubAuthButton`** can change with `FacebookAuthButton`, `GoogleAuthButton` and `TwitterAuthButton`. <br/>
And can take this parameters: <br/>
`title`, `backgroundColor`, `titleColor`, `iconColor`, `shadows`, `fontSize`, `iconSize`, `fontWeight`, `wGradientColors`, `opacityValue`, `gradientColors`, `beginGradient`, `endGradient`. <br/>
#
**`CircularGIAuthButton`** can change with `CircularFBAuthButton`, `CircularGGAuthButton` and `CircularTWAuthButton`. <br/>
And can take this parameters: <br/>
`backgorundColor`, `iconColor`, `wBorder`, `borderColor`, `opacityValue`, `size`, `iconSize`, `shadows`, `borderRadius.

## Magical

<img src="https://raw.githubusercontent.com/theiskaa/flutter_button/master/example/assets/gifer/magical.gif" align = "right" height = "350px">

```dart
MagicalFBButton(
 title: "Sign In With Facebook",
 opacityValue: .5,
 onTap: () {},
),

MagicalGGButton(
 title: "Sign In With Google",
 opacityValue: .5,
 onTap: () {},
),
```
**Note:** U can change only Magical`FB`Button with `GG`, `TW` or `GI` for get Magical Google, Twitter and Github buttons, <br/>
**Magial Buttons:**   `MagicalFBButton`, `MagicalGGButton`, `MagicalGIButton`, `MagicalTWButton`.

# How to Contribute this package?

See [Contributing.md](https://github.com/aagarwal1012/Animated-Text-Kit/blob/master/CONTRIBUTING.md).

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind are welcome! See [Contributing.md](https://github.com/aagarwal1012/Animated-Text-Kit/blob/master/CONTRIBUTING.md).
