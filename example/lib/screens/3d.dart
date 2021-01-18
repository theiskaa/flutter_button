import 'package:flutter/material.dart';
import 'package:flutter_button/flutter_button.dart';

class Button3DScreen extends StatelessWidget {
  const Button3DScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Default style
            Button3D(
              onPressed: () {},
              child: Text("3d Button"),
            ),
            SizedBox(height: 30),
            //Used things
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
          ],
        ),
      ),
    );
  }
}
