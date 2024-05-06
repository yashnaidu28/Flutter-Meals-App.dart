import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';

const kInitialFilters = {
  Filter.lactoseFree: false,
  Filter.glutenFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

//class TabsScreen extends StatefulWidget {
  class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  //State<TabsScreen> createState() {
    ConsumerState<TabsScreen> createState() {
    return _TabsSceenState();
  }
}

//class _TabsSceenState extends State<TabsScreen> {
  class _TabsSceenState extends ConsumerState<TabsScreen> {
  int _selectpageindex = 0;
 // final List<Meal> _favoriteMeal = [];
 // Map<Filter, bool> _selectedFilter = kInitialFilters;
  // void _showMassage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars(); // to show popup
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(message)));
  // }

  // void _ToggleFavoritemealState(Meal meal) {
  //   final _isExisting = _favoriteMeal.contains(meal);
  //   if (_isExisting) {
  //     setState(() {
  //       _favoriteMeal.remove(meal);
  //     });
  //     _showMassage('Item remove from Favorite');
  //   } else {
  //     setState(() {
  //       _favoriteMeal.add(meal);
  //     });
  //     _showMassage('Item added to Favorite');
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectpageindex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop(); //to colse the drower
    if (identifier == 'filter') {
      //final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
              builder: (ctx) => FilterScreen(
                   // currentfilter: _selectedFilter,
                  )));
      // setState(() {
      //   _selectedFilter = result ?? kInitialFilters;
      // });
    }
    //else{
//   Navigator.of(context).pop();
// }
  }

  @override
  Widget build(BuildContext context) {
  //  final meals= ref.watch(mealProvider);
  //  final activeprovider= ref.watch(filterProvider);
    final availableMeals = ref.watch(filtersMealsProvider);
    // meals.where((Meal) {
    //   if (activeprovider[Filter.glutenFree]! && !Meal.isGlutenFree) {
    //     return false;
    //   }
    //   if (activeprovider[Filter.lactoseFree]! && !Meal.isLactoseFree) {
    //     return false;
    //   }
    //   if (activeprovider[Filter.vegan]! && !Meal.isVegan) {
    //     return false;
    //   }
    //   if (activeprovider[Filter.vegetarian]! && !Meal.isVegetarian) {
    //     return false;
    //   }
    //   return true;
    // }).toList();
    Widget activepage = CategoriesScreen(
      //onToggleFavorite: _ToggleFavoritemealState,
      availableMeals: availableMeals,
    );
    var activepagetitle = 'Categories';
    if (_selectpageindex == 1) {
      final favoriteMeal= ref.watch(favoriteMealprovider);
      activepage = MealsScreen(
       // meals: _favoriteMeal,
        meals: favoriteMeal,
       // onToggleFavorite: _ToggleFavoritemealState,
      );
      activepagetitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      drawer: Maindrawer(
        onSelectScreen: _setScreen,
      ),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectpageindex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            )
          ]),
    );
  }
}
