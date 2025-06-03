import 'package:flutter/material.dart';

class ForyouModel {
  String name;
  String iconPath;
  String description_1;
  String description_2;
  Color boxColor;

  ForyouModel({
    required this.name,
    required this.description_1,
    required this.description_2,
    required this.iconPath,
    required this.boxColor,
  });

  static List<ForyouModel> getForYou(){
    List<ForyouModel> forYou = [];

    forYou.add(
      ForyouModel(name: 'For You 1', description_1: 'Smile', description_2: 'Sweet', iconPath: 'assets/icons/date.svg', boxColor: Color(0xff59ffe9))
    );

    forYou.add(
      ForyouModel(name: 'For You 2', description_1: 'Sadistic', description_2: 'Surpirse', iconPath: 'assets/icons/document.svg', boxColor: Color(0xff9659ff))
    );

    forYou.add(
      ForyouModel(name: 'For You 3', description_1: 'Surpirse', description_2: 'Sadistic', iconPath: 'assets/icons/histogram.svg', boxColor: Color(0xffff596f))
    );

    forYou.add(
      ForyouModel(name: 'For You 4', description_1: 'Sweet', description_2: 'Smile', iconPath: 'assets/icons/pie-chart.svg', boxColor: Color(0xffc2ff59))
    );

    return forYou;
  }
}