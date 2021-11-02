import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var args;
  final List<String> imageURLList = [
    'https://picsum.photos/200',
    'https://picsum.photos/200',
    'https://picsum.photos/200',
    'https://picsum.photos/200'
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   args = ModalRoute.of(context)!.settings.arguments as String;
  // }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.deepOrange),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Product name",
            style: TextStyle(color: Colors.deepOrange),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(children: [
            Container(
                child: CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: imageURLList
                  .map((e) => ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              e,
                              height: 600,
                              width: 600,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ))
          ]),
        ));
  }
}
