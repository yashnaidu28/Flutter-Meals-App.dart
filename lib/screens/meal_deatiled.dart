import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//class MealdetailedScreen extends StatelessWidget {
class MealdetailedScreen extends ConsumerWidget {
  const MealdetailedScreen({
    super.key,
    required this.meal, //required this.onToggleFavorite
  });
  final Meal meal;
  //final void Function(Meal meal) onToggleFavorite;
  @override
  // Widget build(BuildContext context) {
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeal=ref.watch(favoriteMealprovider);
    final isfavorite= favoriteMeal.contains(meal);
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
                onPressed: () {
                  // onToggleFavorite(meal);
                  final wasAdded = ref
                      .read(favoriteMealprovider.notifier)
                      .toggleMealFavoriteStatus(meal);
                  {
                    ScaffoldMessenger.of(context)
                        .clearSnackBars(); // to show popup
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(wasAdded
                            ? 'meal added to favorite'
                            : 'meal removed from favorite')));
                  }
                },
                icon:  Icon(isfavorite? Icons.star : Icons.star_border))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Ingridients',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(
                height: 20,
              ),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Ingridients',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              for (final steps in meal.steps)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    textAlign: TextAlign.center,
                    steps,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
            ],
          ),
        ));
  }
}
