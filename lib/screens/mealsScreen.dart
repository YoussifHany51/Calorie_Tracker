import 'package:calorie_tracker/provider/selectedItem.dart';
import 'package:flutter/material.dart';

import 'package:calorie_tracker/models/category.dart';
import 'package:calorie_tracker/models/lists.dart';
import 'package:calorie_tracker/models/meals.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MealScreen extends StatefulWidget {
  final Category category;
  Meal? meal;
  MealScreen({
    required this.category,
  });

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  List<Meal> choosenList(dynamic name) {
    switch (name) {
      case 'Meat':
        return meatList;
      case 'Fruit':
        return fruitList;
      case 'Vegetables':
        return vegetableList;
      case 'Milk & Dairy':
        return dairyList;
      case 'Egg':
        return eggList;
      case 'Nuts':
        return nutsList;
      case 'Dessert':
        return dessertList;
      case 'Cold Drinks':
        return coldDrinkList;
      case 'Hot Drinks':
        return hotDrinkList;
      case 'SeaFood':
        return seafoodList;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.category.image,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: Image(
                      image: AssetImage(
                        widget.category.image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 10,
                bottom: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.category.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Container(
                height: 270,
                //  height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView.builder(
                  itemCount: choosenList(widget.category.name).length,
                  itemBuilder: (context, i) {
                    return Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Container(
                            //  height: 70,
                            width: 100,
                            child: Card(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Builder(
                                        builder: (context) => InkWell(
                                          onTap: () {
                                            SelectedItem selectedItem =
                                                Provider.of<SelectedItem>(
                                                    context,
                                                    listen: false);
                                            selectedItem.addItem(choosenList(
                                                widget.category.name)[i]);
                                            var snackbar = SnackBar(
                                              content: Text('meal added'),
                                              backgroundColor:
                                                  Colors.blue.shade800,
                                              duration: Duration(seconds: 1),
                                            );
                                            Scaffold.of(context)
                                              // ignore: deprecated_member_use
                                              ..showSnackBar(snackbar);
                                          },
                                          child: Icon(
                                            Icons.add,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 20)),
                                          Text(
                                            choosenList(widget.category.name)[i]
                                                .name,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Text('cal for 100g')),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(right: 20),
                                                child: Text(
                                                  choosenList(widget
                                                              .category.name)[i]
                                                          .kcal +
                                                      " kcal",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.red[900]),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )));
                  },
                )),
          )
        ],
      ),
    );
  }
}
