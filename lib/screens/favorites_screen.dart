import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../modules/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen ( this.favoriteMeals) ;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty){
    return Center(
      child: Text("You have no favorites yet - start adding some! "),
    );
  }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            //categoryMeals
            id: favoriteMeals[index].id,
            imageUrl: favoriteMeals[index].imageUrl,
            title: favoriteMeals[index].title,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,

          );
        },
        itemCount: favoriteMeals.length,
      );

    }
  }
}
