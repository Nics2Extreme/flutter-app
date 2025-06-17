import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application/model/sub-models/dimensions_model.dart';
import 'package:flutter_application/model/sub-models/review_model.dart';
import 'package:flutter_application/model/sub-models/meta_model.dart';

class ProductModel {
  final int id;
  final String name;
  final String description;
  final String category;
  final double price;
  final double? discountPercentage;
  final double? rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final double? weight;
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
  final String thumbnail;
  final List<String> images;
  final String iconPath;
  final Color boxColor;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.thumbnail,
    required this.images,
    required this.iconPath,
    required this.boxColor,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      stock: json['stock'] ?? 0,
      tags: _parseTags(json['tags']),
      brand: json['brand'] ?? '',
      sku: json['sku'] ?? '',
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      dimensions: _parseDimensions(json['dimensions']),
      warrantyInformation: json['warrantyInformation'] ?? '',
      shippingInformation: json['shippingInformation'] ?? '',
      availabilityStatus: json['availabilityStatus'] ?? '',
      reviews: _parseReviews(json['reviews']),
      returnPolicy: json['returnPolicy'] ?? '',
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 1,
      meta: _parseMeta(json['meta']),
      thumbnail: json['thumbnail'] ?? '',
      images: _parseImages(json['images']),
      iconPath: 'assets/icons/document.svg',
      boxColor: const Color(0xff598bff),
    );
  }

  static List<String> _parseTags(dynamic tagsJson) {
    return (tagsJson as List<dynamic>?)?.map((tag) => tag.toString()).toList() ?? [];
  }

  static List<String> _parseImages(dynamic imagesJson) {
    return (imagesJson as List<dynamic>?)?.map((img) => img.toString()).toList() ?? [];
  }

  static Dimensions _parseDimensions(dynamic dimensionsJson) {
    return dimensionsJson != null
        ? Dimensions.fromJson(dimensionsJson)
        : Dimensions(width: 0.0, height: 0.0, depth: 0.0);
  }

  static List<Review> _parseReviews(dynamic reviewsJson) {
    return (reviewsJson as List<dynamic>?)?.map((r) => Review.fromJson(r)).toList() ?? [];
  }

  static Meta _parseMeta(dynamic metaJson) {
    return metaJson != null
        ? Meta.fromJson(metaJson)
        : Meta(
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            barcode: '',
            qrCode: '',
          );
  }

  static Future<List<ProductModel>> getProducts() async {
    const url =
        "https://dummyjson.com/products?limit=10&skip=10&sortBy=title&order=asc&select=title,price,brand,category";
    final dio = Dio();

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        final List<dynamic> productsJson = data['products'];

        return productsJson
            .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  static Future<List<ProductModel>> getAllProducts() async {
    const url = 'https://dummyjson.com/products?sortBy=title&order=asc';
    final dio = Dio();

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        final List<dynamic> productsJson = data['products'];

        return productsJson
            .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
