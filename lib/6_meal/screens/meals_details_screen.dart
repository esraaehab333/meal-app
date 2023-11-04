
import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavorite});
  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(249, 181, 114,1),
        title: Text(meal.title
        ,style: TextStyle(

          ),),
        actions: [
          IconButton(
            onPressed: ()=>onToggleFavorite(meal),
            icon: Icon(Icons.star),
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(250, 248, 237,1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(meal.imageUrl,
                height: 300, width: double.infinity, fit: BoxFit.cover),
            SizedBox(
              height: 14,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            SizedBox(
              height: 14,
            ),
            for (final ingr in meal.ingredients)
              Text(
                ingr,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            for (final st in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  st,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
