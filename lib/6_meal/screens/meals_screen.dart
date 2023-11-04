
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
import 'meals_details_screen.dart';

class Meals extends StatelessWidget {
  const Meals({super.key,  this.title, required this.meals, required this.onToggle});
  final String ?title;
  final List<Meal> meals;
  final void Function (Meal meal) onToggle;
  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return content(context);
    } else {
      return Scaffold(
        backgroundColor: Color.fromRGBO(250, 248, 237,1),
      appBar: AppBar(
        title: Text(title!),
        backgroundColor: Color.fromRGBO(249, 181, 114,1), // عشان يظهر عندي ف الاب
      ),
      body:content(context), // هنا بقا اعرضها ازاي
    );
    }
  }
  //احنا عملنا دي عشان تبقي اسهل ف اللي فوق و كان عندنا مشكله ان
  // التايتل بيبقي مكتوب برضوا ف احنا شيلناه من الريكويرد
  SingleChildScrollView content (BuildContext context )
  {
    return  SingleChildScrollView(
      child: Column(
        children: meals
            .map((meal) => MealItem(
          meal: meal,
          onSelectMeal: (Meal meal) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => MealDetailsScreen(meal: meal , onToggleFavorite: onToggle,)));
          },
        )
          // دي ابسط طريقه للعرض
        )
            .toList(),
      ),
    );
  }
}
