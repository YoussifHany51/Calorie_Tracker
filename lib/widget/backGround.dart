import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/img/welcome.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
      )),
    );
  }
}
