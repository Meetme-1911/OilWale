import 'package:flutter/material.dart';
import './oilwale_theme.dart';
import '../models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.deepOrange))),
        // color: Colors.deepOrange,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${product.name}",
              style: deepOrangeTS(fontSize: 20),
            ),
            Text(
              "${100}",
              style: deepOrangeTS(fontSize: 12),
            ),
            Text(
              "${product.specification}",
              style: deepOrangeTS(fontSize: 12),
            )
          ],
        ));
  }
}

List<Product> allProducts = [
  new Product(id: '1', name: "Product1", specification: "example product"),
  new Product(id: '2', name: "Product2", specification: "example product"),
  new Product(id: '3', name: "Product3", specification: "example product"),
];

class ProductListView extends StatefulWidget {
  ProductListView({Key? key}) : super(key: key);

  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  List<Product> _pList = [];

  @override
  void initState() {
    super.initState();
    _pList = allProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: (String input) {
            print("User entered: " + input);
            setState(() {
              String inpLowercase = input.toLowerCase();
              _pList = allProducts.where((p) {
                if (p.name.toLowerCase().contains(inpLowercase)) {
                  return true;
                } else if (p.specification!
                    .toLowerCase()
                    .contains(inpLowercase)) {
                  return true;
                } else {
                  return false;
                }
              }).toList();
            });
          },
          decoration: InputDecoration(
              hintText: 'Search',
              suffixIcon: Icon(
                Icons.search,
                color: Colors.deepOrange,
              ),
              labelStyle: TextStyle(color: Colors.deepOrange),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: Colors.deepOrange,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange)),
              hintStyle: TextStyle(color: Colors.deepOrange)),
        ),
        Expanded(
          // height: (MediaQuery.of(context).size.height - 179),
          child: ListView.builder(
            itemCount: _pList.length,
            itemBuilder: (context, index) {
              return ProductTile(product: _pList[index]);
            },
          ),
        ),
      ],
    );
  }
}
