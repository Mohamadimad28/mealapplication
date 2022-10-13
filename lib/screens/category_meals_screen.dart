import 'package:flutter/material.dart';
import '../modules/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals';
  //استقبلت متغير
  final List<Meal> availableMeals;//عشان استقبل الAvailable  الي عملت فلترة للDummy واخدت الMeal  منو
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;

  List<Meal>? displayMeals;

  @override
  //بتنفد الدالة قبل بناء ال  widget
  void didChangeDependencies() {
    //ننفك الضغط عن ال id  و ال title
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    //ننعمل فلترة لل ميلز بنعمل فلترة وبنرجع نحولها الى ليست بنوخد فقط العناصر الي بتوخد الشرط المعين تم نرحع نبني العناصر الى ليست وبنخزنها باسم اخر
    displayMeals = widget.availableMeals.where((meal) {
      //ال  displayMeals  ما اخدت الميل من ال dummy  بشكل مباشر اخدتو من المتغير الي اسمو available نوعو ليست
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    //راح تحدف العنصر ال بطابق الاي دي
    //removeWhere معنها احدف هاد العنصر الي بحقق الشرط
    setState(() {
      displayMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            //categoryMeals
            id: displayMeals![index].id,
            imageUrl: displayMeals![index].imageUrl,
            title: displayMeals![index].title,
            duration: displayMeals![index].duration,
            complexity: displayMeals![index].complexity,
            affordability: displayMeals![index].affordability,
            //removeItem: _removeMeal,
          );
        },
        itemCount: displayMeals!.length,
      ),
    );
  }
}
