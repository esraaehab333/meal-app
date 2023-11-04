import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../widgets/category_grid_item.dart';

class CategoryScreens extends StatelessWidget {
  const CategoryScreens({super.key, required this.onToggle, required this.availableMeals});
  final void Function (Meal meal)onToggle;
  final List<Meal>availableMeals ;
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15
          ),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 3/2

            ),
            children: [
              for(final category in availableCategories)
              CategoryGridItem(category:category, onToggle: onToggle, availableMeals: availableMeals, ),
            ],
          ),

      );
  }
}
