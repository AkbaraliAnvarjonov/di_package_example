import 'package:dio_package/data/models/products.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryIdPage extends StatelessWidget {
  CategoryId categoryId;
  CategoryIdPage({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product")),
    );
  }
}
