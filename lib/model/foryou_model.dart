import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ForyouModel {
  final String name;
  final String iconPath;
  final double price;
  final String brand;
  final String category;
  final Color boxColor;

  ForyouModel({
    required this.name,
    required this.iconPath,
    required this.price,
    required this.brand,
    required this.category,
    required this.boxColor,
  });

  factory ForyouModel.fromJson(Map<String, dynamic> json) {
    return ForyouModel(
      name: json['title'],
      iconPath: 'assets/icons/document.svg',
      price: json['price'],
      brand: json['brand'] ?? '',
      category: json['category'],
      boxColor: const Color(0xff598bff),
    );
  }

  static Future<List<ForyouModel>> getForYou() async {
    const url = "https://dummyjson.com/products?limit=10&skip=10&select=title,price,brand,category";
    final dio = Dio();
    
    try{
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        final List<dynamic> productsJson = data['products'];
        
        return productsJson
            .map((item) => ForyouModel.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
