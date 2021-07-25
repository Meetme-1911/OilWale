import 'package:flutter/material.dart';

class Product {
  int? id;
  String? name;
  double? price;
  String? description;
  Product({this.id, this.name, this.price, this.description});
}

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.deepOrange),
        // color: Colors.deepOrange,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${product.name}",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            Text(
              "${product.price}",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
            Text(
              "${product.description}",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            )
          ],
        ));
  }
}

List<Product> allProducts = [
  new Product(
      id: 1, name: "Product1", price: 1500, description: "example product"),
  new Product(
      id: 2, name: "Product2", price: 100, description: "example product"),
  new Product(
      id: 3, name: "Product3", price: 250, description: "example product"),
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
                if (p.name!.toLowerCase().contains(inpLowercase)) {
                  return true;
                } else if (p.description!
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
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder()),
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
