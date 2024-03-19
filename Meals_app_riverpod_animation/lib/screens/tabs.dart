import 'package:flutter/material.dart';
// import 'package:meals_app/data/dummy_data.dart';
// import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorite_meal_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 16 - filter
const kInitialFilters = {
  Filter.glutenFree : false,
  Filter.lactoseFree : false,
  Filter.vegetarian : false,
  Filter.vegan : false,
};


// class TabsScreen extends StatefulWidget {

class TabsScreen extends ConsumerStatefulWidget {  
  const TabsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {

  //16
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  //9.1
  int _selectPageIndex = 0;

  // 9.1
  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  //15
  void _setScreen(String identifier) async {
    Navigator.of(context).pop(); // close the drawer

    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        // MaterialPageRoute(
        //   builder: (ctx) => const FiltersScreen(),
        // ),
        //17
         MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );
      //debugPrint(result.toString());
      //16
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  // //12.2
  // void _setScreen(String identifier){
  //   if(identifier == 'filters'){
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (ctx) => const FiltersScreen(),
  //         ),
  //     );
  //   }else{
  //     //Navigator.pop(context);// close the drawer
  //     Navigator.of(context).pop();// close the drawer
  //   }
  // }

  // // 11.2
  // void _setScreen(String identifier){
  //   if(identifier == 'filters'){

  //   }else{
  //     //Navigator.pop(context);// close the drawer
  //     Navigator.of(context).pop();// close the drawer
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    // riverpod/1
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meal){
    //   //16.1
    // final availableMeals = dummyMeals.where((meal){
      if(_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree){
        return false;
      }
      if(_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(_selectedFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();

    // Widget activePage = const CategoriesScreen();
    // var activePageTitle = 'Categories';

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectPageIndex == 1) {
      // activePage = const MealsScreen(title: 'Favorite Meal', meals: []);
      //9.4
      // activePage = const MealsScreen(meals: []);
      // activePage = MealsScreen(meals: [],
      //  onToggleFavorite: _toggleMealFavoriteStatus,);

      //10.4
      // activePage = MealsScreen(
      //   meals: _favoriteMeals,
      //   onToggleFavorite: _toggleMealFavoriteStatus,
      // );

      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );

      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Dynamic...'),
        title: Text(activePageTitle),
      ),
      // drawer: const Drawer(backgroundColor: Colors.red),
      // //11
      // drawer: const MainDrawer(),
      //11.1
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      //9.2
      bottomNavigationBar: BottomNavigationBar(
          //9.1
          onTap: _selectPage,
          //9.3 for highlighting the tab
          currentIndex: _selectPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ]),
    );
  }
}
