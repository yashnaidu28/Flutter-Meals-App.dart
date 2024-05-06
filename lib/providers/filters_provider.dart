
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.lactoseFree: false,
          Filter.glutenFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });
  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filtersMealsProvider= Provider((ref) {
 final meals= ref.watch(mealProvider);
 final activeprovider =ref.watch(filterProvider);
return meals.where((Meal) {
      if (activeprovider[Filter.glutenFree]! && !Meal.isGlutenFree) {
        return false;
      }
      if (activeprovider[Filter.lactoseFree]! && !Meal.isLactoseFree) {
        return false;
      }
      if (activeprovider[Filter.vegan]! && !Meal.isVegan) {
        return false;
      }
      if (activeprovider[Filter.vegetarian]! && !Meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
});