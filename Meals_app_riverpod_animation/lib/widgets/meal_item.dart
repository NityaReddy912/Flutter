import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';

import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key,
      required this.meal,
      //8.2
      required this.onSelectMeal,});
  //7.1
  final Meal meal;

  //8.2
  final void Function(Meal meal) onSelectMeal;

  //7.4 getter for MealItem class
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    //7.2
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // enforce any content goes out of shape should get clip
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        //7.1
        onTap: () {
          // debugPrint('Meal Item - ${meal.title}');
          //8.2
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            //Image.network(meal.imageUrl),
            Hero(
              tag:meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(children: [
                  Text(
                    meal.title,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis, // very long text ...
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  // 7.3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MealItemTrait(
                          icon: Icons.schedule, label: '${meal.duration} min'),
                      const SizedBox(width: 12),
                      MealItemTrait(icon: Icons.work, label: complexityText),
                      const SizedBox(width: 12),
                      MealItemTrait(
                          icon: Icons.attach_money, label: affordabilityText),
                    ],
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
