import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CategoryModel {
  final String name;
  final String slug;
  final String url;
  final String iconPath;
  final Color boxColor;

  CategoryModel({
    required this.name,
    required this.slug,
    required this.url,
    required this.iconPath,
    required this.boxColor,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      slug: json['slug'],
      url: json['url'],
      iconPath: 'assets/icons/pie-chart.svg',
      boxColor: const Color(0xff598bff),
    );
  }

  static Future<List<CategoryModel>> getCategories() async {
    const url = 'https://dummyjson.com/products/categories';
    final dio = Dio();

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        
        return data
            .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
