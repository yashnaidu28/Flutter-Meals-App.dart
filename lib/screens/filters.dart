import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
// import 'package:meals_app/screens/tabs.dart';
 //import 'package:meals_app/widgets/main_drawer.dart';
// enum Filter{
//   glutenFree,
//   lactoseFree,
//   vegetarian,
//   vegan
// }

//class FilterScreen extends StatefulWidget {
  //class FilterScreen extends ConsumerStatefulWidget {
    class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key,
  //required this.currentfilter
  });
//   //final Map<Filter, bool>currentfilter;
//   @override
//   ConsumerState<FilterScreen> createState() {
//     return _FilterScreenState();
//   }
// }

// class _FilterScreenState extends ConsumerState<FilterScreen> {
//   var _glutenFreeeFilterSet = false;
//   var _lactosFreeeFilterSet = false;
//   var _vegetarinFreeeFilterSet = false;
//   var _vegenFreeeFilterSet = false;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   final activeFilter = ref.read(filterProvider);
  //   // _glutenFreeeFilterSet=widget.currentfilter[Filter.glutenFree]!;
  //   // _lactosFreeeFilterSet=widget.currentfilter[Filter.lactoseFree]!;
  //   // _vegenFreeeFilterSet=widget.currentfilter[Filter.vegan]!;
  //   // _vegenFreeeFilterSet=widget.currentfilter[Filter.vegetarian]!;
  //   _glutenFreeeFilterSet=activeFilter[Filter.glutenFree]!;
  //   _lactosFreeeFilterSet=activeFilter[Filter.lactoseFree]!;
  //   _vegenFreeeFilterSet=activeFilter[Filter.vegan]!;
  //   _vegenFreeeFilterSet=activeFilter[Filter.vegetarian]!;
  // }
  @override
  //Widget build(BuildContext context) {
    Widget build(BuildContext context, WidgetRef ref) {
      final activefilters=ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: Maindrawer(onSelectScreen: ((identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context)
      //         .pushReplacement(MaterialPageRoute(builder: (ctx) => TabsScreen()));
      //   }
      // },),),
      body:
  // PopScope(
  // canPop: false,
  // onPopInvoked: (bool didPop) 
  // {
  //    ref.read(filterProvider.notifier).setFilters({
  //     Filter.glutenFree: _glutenFreeeFilterSet,
  //     Filter.lactoseFree: _lactosFreeeFilterSet,
  //     Filter.vegetarian: _vegetarinFreeeFilterSet,
  //      Filter.vegan: _vegenFreeeFilterSet,
  //    });
  //   if(didPop) return;
  //  // Navigator.of(context).pop(
  //   //   {
  //   //   Filter.glutenFree: _glutenFreeeFilterSet,
  //   //   Filter.lactoseFree: _lactosFreeeFilterSet,
  //   //   Filter.vegetarian: _vegetarinFreeeFilterSet,
  //   //   Filter.vegan: _vegenFreeeFilterSet,
  //   // }
  //  // );
  // },
  //       child:
   Column(
          children: [
            SwitchListTile(
              value: activefilters[Filter.glutenFree]!,
              onChanged: (isChecked) {
                // setState(() {
                //   _glutenFreeeFilterSet = isChecked;
                // });
                ref.read(filterProvider.notifier).setFilter(Filter.glutenFree, isChecked);
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include gluten-free',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activefilters[Filter.lactoseFree]!,
              onChanged: (isChecked) {
                // setState(() {
                //   _glutenFreeeFilterSet = isChecked;
                // });
                ref.read(filterProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
              },
              title: Text(
                'Lactos-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Lactos-free',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
             value: activefilters[Filter.vegetarian]!,
              onChanged: (isChecked) {
                // setState(() {
                //   _glutenFreeeFilterSet = isChecked;
                // });
                ref.read(filterProvider.notifier).setFilter(Filter.vegetarian, isChecked);
              },
              title: Text(
                'Vegen',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Vegen',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: activefilters[Filter.vegan]!,
              onChanged: (isChecked) {
                // setState(() {
                //   _glutenFreeeFilterSet = isChecked;
                // });
                ref.read(filterProvider.notifier).setFilter(Filter.vegan, isChecked);
              },
              title: Text(
                'Vegiterian',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Vegetarian',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
      );
  }
}
