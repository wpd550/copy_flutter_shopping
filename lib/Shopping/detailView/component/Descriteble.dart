import 'package:flutter/material.dart';
import 'package:picturecollection/Shopping/Model/Products.dart';
import 'package:picturecollection/constans.dart';

class Descritble extends StatelessWidget {
  const Descritble({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
