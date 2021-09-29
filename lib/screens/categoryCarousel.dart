import 'package:flutter/material.dart';

import 'package:calorie_tracker/models/category.dart';
import 'package:calorie_tracker/screens/mealsScreen.dart';

class CategoryCarousel extends StatefulWidget {
  final int control;
  CategoryCarousel({
    required this.control,
  });

  @override
  _CategoryCarouselState createState() => _CategoryCarouselState();
}

List<Category> categories = [
  Category(
    name: 'Meat',
    image: 'images/img/meat.jpg',
  ),
  Category(
    name: 'Fruit',
    image: 'images/img/fruit.jpeg',
  ),
  Category(
    name: 'Vegetables',
    image: 'images/img/vegtables.jpg',
  ),
  Category(
    name: 'Dessert',
    image: 'images/img/dessert.jpg',
  ),
  Category(
    name: 'SeaFood',
    image: 'images/img/seafood.jpg',
  ),
  Category(
    name: 'Nuts',
    image: 'images/img/nuts.jpeg',
  ),
  Category(
    name: 'Egg',
    image: 'images/img/egg.jpg',
  ),
  Category(
    name: 'Milk & Dairy',
    image: 'images/img/milk-dairy.jpeg',
  ),
  Category(
    name: 'Hot Drinks',
    image: 'images/img/hotDrinks.jpeg',
  ),
  Category(
    name: 'Cold Drinks',
    image: 'images/img/cold2.jpeg',
  ),
];

class _CategoryCarouselState extends State<CategoryCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      // color: Colors.blue,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Category category = categories[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MealScreen(
                              category: category,
                              controllerRes: widget.control,
                            )));
              },
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 100,
                      width: 110,
                      child: Hero(
                        tag: category.image,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image(
                            image: AssetImage(category.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
