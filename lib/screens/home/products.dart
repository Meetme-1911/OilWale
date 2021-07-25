import 'package:flutter/material.dart';
import '../../components/productlist.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ProductListView(),
    );
  }
}
