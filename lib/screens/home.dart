import 'package:calorie_tracker/models/meal.dart';
import 'package:calorie_tracker/provider/selectedItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import 'categoryCarousel.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static TextEditingController controller = TextEditingController();
  String controllerValue = '0';
  List<String> nameList = [];

  @override
  void initState() {
    super.initState();
    getController();
    getNameList();
  }

  var res;
  int convert(String x) {
    res = int.parse(x);
    return res;
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validate() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff123456),
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    children: [
                      Text(
                        "Hello ",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      Icon(
                        CupertinoIcons.heart_fill,
                        size: 40,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Center(child: Consumer<SelectedItem>(
                    builder: (context, selectedItem, child) {
                      return CircularPercentIndicator(
                        radius: 220,
                        lineWidth: 12,
                        backgroundColor: Colors.blue.shade800,
                        percent:
                            (convert(controllerValue) - selectedItem.totalCal) >
                                    selectedItem.currentKcal
                                ? convert(controllerValue) != 0
                                    ? (selectedItem.totalCal /
                                        convert(controllerValue))
                                    : 0
                                : 1,
                        progressColor: Colors.white,
                        circularStrokeCap: CircularStrokeCap.round,
                        animation: true,
                        center: Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          height: 200.0,
                          width: 200.0,
                          child: LiquidCircularProgressIndicator(
                            value: (convert(controllerValue) -
                                        selectedItem.totalCal) >
                                    selectedItem.currentKcal
                                ? convert(controllerValue) != 0
                                    ? (selectedItem.totalCal /
                                        convert(controllerValue))
                                    : 0
                                : 1,
                            valueColor: AlwaysStoppedAnimation(Colors.blue),
                            backgroundColor: Colors.lightBlue.shade900,
                            borderColor: Colors.black54,
                            borderWidth: 0.0,
                            direction: Axis.vertical,
                            center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  convert(controllerValue) != 0
                                      ? '${((selectedItem.totalCal / convert(controllerValue)) * 100).toStringAsFixed(1)} ' +
                                          "%"
                                      : '0 ' + '%',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      selectedItem.totalCal.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      " kcal",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "Enter your daily needed calories before adding meals ",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.arrow_downward_outlined, color: Colors.white)
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.blue.shade800,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.fastfood, size: 40, color: Colors.white),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Remaining',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                                // Consumer beginning
                                Consumer<SelectedItem>(
                                    builder: (context, selectedItem, child) {
                                  return Row(
                                    children: [
                                      // ignore: unnecessary_null_comparison
                                      controllerValue == null
                                          ? Text(
                                              '0',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : Text(
                                              '${(convert(controllerValue) - selectedItem.totalCal)}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                      Text(
                                        " Kcal",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  );
                                }),

                                // Consumer Ending
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // daily needed calories container
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: InkWell(
                        onTap: () {
                          _showMyDialog();
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.blue.shade800,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.add, size: 30, color: Colors.white),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Needed',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      'calories',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // end daily needed calories container
                  ],
                ),

                Center(
                  child: Text(
                    "Choose your meal",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),

                //
                CategoryCarousel(),
                //

                Flex(direction: Axis.horizontal, children: [
                  Expanded(
                    child: Column(
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                            onPressed: () async {
                              showSheet();
                            },
                            child: Text(
                              "View Meals",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                  ),
                ]),

                //
              ],
            ),
          ),
        )));
  }

  Future showSheet() => showSlidingBottomSheet(context,
      builder: (context) => SlidingSheetDialog(
            snapSpec: SnapSpec(
              snappings: [0.4, 0.7],
            ),
            cornerRadius: 28,
            builder: buildSheet,
            headerBuilder: header,
          ));

  Widget buildSheet(
    BuildContext contxt,
    state,
  ) =>
      Material(
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(
                width: 2,
                color: Colors.white,
              )),
          child: ListView.builder(
            itemCount:
                Provider.of<SelectedItem>(context, listen: false).meals.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (BuildContext context, int index) {
              List<Meal> meals =
                  Provider.of<SelectedItem>(context, listen: false).meals;

              return ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(
                  meals[index].name,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  meals[index].kcal + " Kcal",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                trailing: Text(
                  DateFormat('kk:mm a').format(DateTime.now()),
                ),
              );
            },
          ),
        ),
      );

  Widget header(BuildContext context, SheetState state) => Material(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Container(
                  width: 32,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Today's meals",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      );

  Future<void> _showMyDialog() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Enter your daily needed calories'),
              content: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (input) {
                          if (input!.isEmpty || input.length < 4) {
                            return "Please enter a number not less than 1000";
                          } else {
                            return null;
                          }
                        },
                        controller: controller,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          labelText: 'Enter calories',
                          labelStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                      ),
                      TextButton(
                        child: Text('Submit'),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            setController(controller.text);
                            Navigator.of(context).pop();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        super.widget));
                          }
                        },
                      )
                    ],
                  ),
                ),
              ));
        });
  }

  Future<void> setController(value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('caloriesController', value);
  }

  void getController() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    controllerValue = prefs.getString('caloriesController')!;
    setState(() {});
  }

  void getNameList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    nameList = prefs.getStringList('nameList')!;
    setState(() {});
  }
}
