//8
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorite_meal_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({super.key, required this.meal,});

  final Meal meal;

  @override
  // Widget build(BuildContext context) {
    
    //riverpod

    Widget build(BuildContext context,WidgetRef ref) {
      final favouriteMeals=ref.watch(favoriteMealsProvider);
      final isFavourite = favouriteMeals.contains(meal);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        // 10.5
        actions: [
          IconButton(
            onPressed: (){
                final wasAdded = ref.read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded
                    ?'Meal added as a Favorite'
                    :'Meal removed from Favorite List'),
                  ),
                );
            }, 
            // 
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child,animation){
                return RotationTransition(
                  turns: Tween(begin:0.8,end:1.0).animate(animation),
                  child:child,
                );
              },
              child: Icon(
                isFavourite ? Icons.star :Icons.star_border,
                key:ValueKey(isFavourite),
              )
            ),
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag:meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Text(
                  step,
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
  
  // AnimationSwitcher({required Duration duration, required RotationTransition Function(dynamic child, dynamic animation) TransitionBuilder, required Icon child}) {}
}

// //8
// import 'package:flutter/material.dart';
// import 'package:meals_app/models/meal.dart';

// class MealDetails extends StatelessWidget {
//   const MealDetails({super.key,
//   required this.meal});

//   final Meal meal;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(meal.title),
//       ),
//       body: 
//         Image.network(
//           meal.imageUrl,
//           height: 300,
//           width: double.infinity,
//           fit:BoxFit.cover,
//         ),
//     );
//   }
// }