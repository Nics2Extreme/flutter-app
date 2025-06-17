import 'package:flutter/material.dart';
import 'package:flutter_application/layout/layout.dart';
import 'package:flutter_application/model/product_model.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    products = await ProductModel.getAllProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Layout(title: "Products", child: _productsList());
  }

  Column _productsList() {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two columns
              childAspectRatio:
                  0.7, // Adjust this based on your card height/width
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: products[index].boxColor.withValues(alpha: 0.3),
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 0.5, // Border width
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:
                            products[index].thumbnail.isNotEmpty
                                ? Image.network(products[index].thumbnail)
                                : Placeholder(),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              products[index].name,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              products[index].price.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
