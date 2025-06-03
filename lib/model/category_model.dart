import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(name: 'Category 1', iconPath: 'assets/icons/date.svg', boxColor: Color(0xffb259ff))
    );
 
    categories.add(
      CategoryModel(name: 'Category 2', iconPath: 'assets/icons/document.svg', boxColor: Color(0xff598bff))
    );
 
    categories.add(
      CategoryModel(name: 'Category 3', iconPath: 'assets/icons/histogram.svg', boxColor: Color(0xff59ffe9))
    );
 
    categories.add(
      CategoryModel(name: 'Category 4', iconPath: 'assets/icons/pie-chart.svg', boxColor: Color(0xff59ff5f))
    );
 
    return categories;
  }
}