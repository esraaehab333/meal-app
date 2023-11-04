import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import '../screens/meals_details_screen.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});
  final Meal meal;
  final void Function(Meal meal )onSelectMeal;
  String get complexitytext{
    switch(meal.complexity){
      case Complexity.simple : return "Simple";break;
      case Complexity.hard : return "Hard";break;
      case Complexity.challenging :return "Challenging";break;
      default: return "Unknowen";
    }
  }
  String get afford{
    switch(meal.affordability){
      case Affordability.affordable : return "Affordable";break;
      case Affordability.pricey: return "Pricey";break;
      case Affordability.luxurious :return "Luxurious";break;
      default: return "Unknowen";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      color: Colors.black45,
      child: InkWell(
        onTap:() => onSelectMeal(meal),
        // قدام انا هحتاج اني اخليها قابله للضغط عشان توديني صفحه تانيه
        child: Column(
          children: [
            Stack(
              // حاجه فوق بعض
              children: [
              //  Image.network(meal.imageUrl),
                Image.asset(meal.imageUrl,
                    height: 300, width: double.infinity, fit: BoxFit.cover),
                //انت عندك صوره ع الانتر نت فيه حاجه اسها placehorder عقبال متحمل دي هتظهرلك
                Positioned(
                  // دي ويدجيت جديده بتقولك مكان
                  // كم اليومين و فوق و تحت و كله بكتب هو علي بعد قط اي
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                    color: Colors.black45,
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.schedule, color: Colors.white,),
                                  SizedBox(width: 6,),
                                  Text("${meal.duration} min", style: TextStyle(
                                      color: Colors.white
                                  ))
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.work ,  color: Colors.white,),
                                  SizedBox(width: 6,),
                                  Text(complexitytext , style: TextStyle(
                                    color: Colors.white
                                  ),)
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.attach_money, color: Colors.white,),
                                  SizedBox(width: 6,),
                                  Text(afford, style: TextStyle(
                                      color: Colors.white
                                  ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
