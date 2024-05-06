import 'package:flutter/material.dart';
import 'package:meals_app/models/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key, //required this.onToggleFavorite,
      required this.availableMeals});
  // final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;
  void _SelectCatrgory(BuildContext context, Category category) {
    final filteredmeals = availableMeals
        .where((Meal) => Meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: filteredmeals,
          title: category.title,
          // onToggleFavorite: onToggleFavorite,
        ),
      ),
    ); //Navigotor.of(context).push(MaterialPageRoute(builder: ))
  }

  @override
  Widget build(context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15),
      children: [
        // availableCategories.map((category)=>CategoryGridItem(category: category).to string())
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _SelectCatrgory(context, category);
            },
          )
      ],
    );
  }
}
