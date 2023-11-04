
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meal.dart';
import '../screens/meals_screen.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({required this.category, super.key, required this.onToggle, required this.availableMeals});

  final Category category;
  final void Function (Meal meal)onToggle;
  final List<Meal>availableMeals ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // GestureDector //الاتنين دول بيخلوا اي ويدجيت قابله للضغط
      onTap: () {
        final filterdMeal = availableMeals.where(
          (meal) => meal.categories.contains(category.id),
          //هنا بقوله هي ليست هي بتحتوي ع العنصر اللي ال اي دي بتاعه دا
          // من وسط الليست هو اختار دا بتشوفه
        ).toList();
        // هعمل فلتره للعناصر
        // اي هو الشرط اللي هيتشك عليه اصلا بيفلتره
        // هل هي تحتوي العنصر المعين اللي هو كاتيجوري اي دي
        // برجع اعملها to list عشان تبقي عندي لسته
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Meals(
              title: category.title,
              // لازم استعمله و احطه هناك عشان يظهر
              meals:filterdMeal, onToggle: onToggle,
              //مش هعرف اديها الليست اللي عندي دي كلها
              // هديها الليست اللي بتحتوي عليهم
            ),
          ),
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage(category.img),
            fit:BoxFit.cover
          ),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.3),
            category.color.withOpacity(00.9)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
          margin: EdgeInsets.symmetric(vertical: 20,horizontal: 1),
          color: Colors.black45,
          child: Text(category.title,
              style: TextStyle(
                color: Colors.white,
              )
          ),
        ),
      ),
    );
  }
}
