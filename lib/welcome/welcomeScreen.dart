import 'package:calorie_tracker/screens/home.dart';
import 'package:calorie_tracker/widget/widget.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackGround(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 350,
                  ),
                  Text(
                    "Track",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 46,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "your daily",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 46,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Calories.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 46,
                        fontWeight: FontWeight.bold),
                  ),
                  // ignore: deprecated_member_use
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Home()));
                    },
                    child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              )))
    ]);
  }
}
