//كلاس اعتيادي يتم استعمالو لعرض معلومات معينه
// وهو ليس widget
import 'package:flutter/material.dart';
class Category {
  //كلاس يحتوي على مجموعة من المتغيرات
  final String id;
  final String title;
  final Color color;

  const Category({
    required this.id,
    required this.title,
     this.color = Colors.orange,
  });
}


