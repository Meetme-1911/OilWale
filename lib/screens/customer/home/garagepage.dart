import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';

class GaragePage extends StatefulWidget {
  @override
  _GaragePageState createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  var args;
  final TextStyle heading1 = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28.0,
    color: Colors.black,
  );
  final TextStyle heading2 = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black);
  final TextStyle desc = const TextStyle(
      fontWeight: FontWeight.normal, fontSize: 14.0, color: Colors.grey);
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
            "Garage name",
            style: TextStyle(color: Colors.deepOrange),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      child: CarouselSlider(
                    options: CarouselOptions(
                        height: MediaQuery.of(context).size.height / 2,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false),
                    items: imageURLList
                        .map((e) => ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Image.network(
                                      e,
                                      height: 600,
                                      width: 600,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ],
                              ),
                            ))
                        .toList(),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Garage A",
                      textAlign: TextAlign.center,
                      style: heading1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "xyz street, navragpura, ahemdabad.",
                      style: desc,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "PINCODE: 345441",
                      style: desc,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Contact Details",
                      style: heading2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Owner: ABC Sharma",
                      style: desc,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Phone: 0123456789",
                      style: desc,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Alt. Phone: 0123456789",
                      style: desc,
                    ),
                  ),
                ]),
          ),
        ));
  }
}
