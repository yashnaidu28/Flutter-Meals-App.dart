

import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_deatiled.dart';
import 'package:meals_app/widgets/meal_item_treat.dart';
import 'package:transparent_image/transparent_image.dart';

class Mealitem extends StatelessWidget {
  const Mealitem({super.key, required this.meal,//required this.onToggleFavorite
  });//,required this.onSelectmeal
  final Meal meal;
  // final void Function(Meal meal) onToggleFavorite;
  // final Void Function(BuildContext context, Meal meal)onSelectmeal;
  String get Complexitytext{
    return meal.complexity.name[0].toUpperCase()+
    meal.complexity.name.substring(1);
  }
  String get Affordabilitytext{
    return meal.affordability.name[0].toUpperCase()+
    meal.affordability.name.substring(1);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip
          .hardEdge, // to get shape correctly becouse we innectialise it outside stack
      elevation: 2, //to give animation
      child: InkWell(
        onTap: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealdetailedScreen(meal: meal,//onToggleFavorite:onToggleFavorite
            )));
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black45,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        MealItemtreat(
                            icon: Icons.schedule,
                            lable:'${meal.duration} min'), //to make it string type meal.duration.toString()
                            SizedBox(width: 12,),
                             MealItemtreat(
                            icon: Icons.work,
                            lable:Affordabilitytext),
                             SizedBox(width: 12,),
                             MealItemtreat(
                            icon: Icons.money,
                            lable:Complexitytext)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
