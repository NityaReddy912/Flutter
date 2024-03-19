import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  
  //16.3
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  // Animation/1.1
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    // start the animationController
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }
  //6.2
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    // final filteredMeals = dummyMeals.
    // where((meal) => meal.categories.contains(category.id)).toList();
    //Navigator.push(context,route) or
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            //  MealsScreen(
            //   // title:'Some Title',
            //   title:category.title,
            //   meals: filteredMeals ),),
            MealsScreen(
          // title:'Some Title',
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }
  // /* 6.1 As there is no need of state to be maintained
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title:const Text('Pick your Category'),
      // ),
      // Animation 1.2
      body: AnimatedBuilder(
        animation: _animationController,

        child: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            //6.1

            for (final category in availableCategories)
              CategoryGridItem(
                  category: category,
                  // //6.1
                  // onSelectCategory: (){
                  //   _selectCategory(context);
                  // }
                  //6.2
                  onSelectCategory: () {
                    _selectCategory(context, category);
                  })
            //3.1
            // for(final category in availableCategories)
            //   CategoryGridItem(category: category)
          ],
        ),
        // Animation 1.3
        // builder: (context,child) => Padding(
        //   padding: EdgeInsets.only(
        //     top: 100 - _animationController.value * 100,
        //   ),
        //   child:child),
        // Animation 1.4 - SlideTransition
        builder: (context, child) =>
            // SlideTransition animates the position of a widget relative to
            // its normal position.
            SlideTransition(
          position: Tween(
            begin: const Offset(0, 0.3),
            end: const Offset(0, 0),
          ).animate(
            CurvedAnimation(
                parent: _animationController, curve: Curves.easeIn),
          ),
          child: child,
        ),
      ),
    );
  }
}
