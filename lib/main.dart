import 'package:flutter/material.dart';
import './dummy_data.dart';
import './modules/meal.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    //عرفت ماب عشان اعطيها قيم مفتاح وفاليو
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals =
      DUMMY_MEALS; // قيمة ال   available meal راح تساوي قيمة  DUMMY
//عشان ما استعدعي كل الوجبات الموجودة في الدومي ميل فقط نستعدي الوجبات المحدثة
  List<Meal> _favoritesMeals = []; //قائمة الوجبات المفضلة
  void _setFilters(_filterData) {
    //نوعها الFunction ماب  Map<String, bool>
    //مبدى عملها انو بعطيها الماب المسؤولة عن قيم الفلاتر المحدتة وهي ترجع تسند القيم الموجودة بالماب المحدثة الى الماب الاصلية الي فيها القيم الاصلية
    //Function معينه
    //راح تستقبل ماب
    //وراح نمررها الى الفلتر سكرين عن طريق الراوت
    //ال function تقوم بتحديد قيمة الفلاتر الخاصة بالتطبيق
    //نحتاج ال setState
    setState(() {
      //ال filters  الي نوعو ماب بسند الو قيمة ال filterData ال سوف احصل عليها
      _filters = _filterData;
//راح نعمل فلترة الها في ال Available
      //بنفلتر قائمة الماكولات
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && meal.isGlutenFree == false) {
          //المستخدم يريد اكلة خالية من الجلوتين
          return false; //انو ازا الاكلة ليست خالية من الجلوتين لا ترجعها احدفها
        }
        //معنى الكلام اذاالمستخدم حط فلتر معين والوجبة ما حققت الشرط راح يحدفها
        if (_filters['lactose'] == true && meal.isLactoseFree == false) {
          return false;
        }
        if (_filters['vegan'] == true && meal.isVegan == false) {
          return false;
        }
        if (_filters['vegetarian'] == true && meal.isVegetarian == false) {
          return false;
        }
        return true; //بخلافه نعم ارجع الوجبة
      }).toList();
    });
  }
  void _toggleFavorite(String mealId) {
    final existingIndex = _favoritesMeals.indexWhere((meal) =>
        meal.id ==
        mealId); //وظيفتها تبحت عن تحقق شرط معين وكل عنصر يوافق الشرط ترجعلي ال index الخاص به
    // اذا تطابق الاي دي قوم بارجاع ال ايندكس الخاص فيه
    if (existingIndex >= 0) {
      setState(() {
        _favoritesMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritesMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }
   bool _isMealFavorite(String id){
    //نوعها bool
     //any معنها اي
     //هل هناك اي عنصر يطابق الشرط الجواب هيكون ترو او فولس
     return _favoritesMeals.any((meal) => meal.id == id);
     //  ال meal راح يمر على كل ال favoritesMeals  ويتحقق ازا لاي دي يطابق الاي دي
 }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        //لون رئيسي
        accentColor: Colors.amber,
        //لون ثانوي
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        //لون مخصص اخدناه من ال  RGBO
        textTheme: ThemeData.light().textTheme.copyWith(
              //فائدة ال textTheme انو بضع تنسيق معين بقدر استخدمو بكل مرا بحتاجو فيه
              bodyText1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              //headline6 بدل ال title  بالتحديث الجديد
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: MyHomePage(),
      //home: CategoriesScreen(),
      routes: {
        '/': (context) => TapsScreen(_favoritesMeals),
        //home screen
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        //متى راح يتم الانتقال الى الراوت نيم الي تم تعريفو راح يتم نقلك الى ال category meals screen
        MealDetailScreen.routName: (context) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FiltersScreen.routeNamed: (context) =>
            FiltersScreen(_setFilters, _filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Application'),
      ),
      body: null,
    );
  }
}
