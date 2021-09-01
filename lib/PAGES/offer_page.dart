import 'package:flutter/material.dart';
import '../PAGES/offers.dart';
import '../PAGES/products.dart';
import '../PAGES/home_page.dart';
import '../PAGES/profile.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  int _currentindex = 0;
  final List<Widget> _children = [
    HomePage(),
    OffersPage(),
    ProductsPage(),
    Profile()
  ];
  final bool showcart = false;
  final floatingbtn = [
    null,
    null,
    FloatingActionButton(
      elevation: 2.0,
      onPressed: () {},
      child: Icon(Icons.shopping_cart),
      backgroundColor: Colors.white,
      foregroundColor: Colors.deepOrange,
    ),
    null
  ];
  void onTapped(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        actions: [
          PopupMenuButton(
              offset: const Offset(0.0, 50.0),
              icon: Icon(
                Icons.more_vert,
                color: Colors.deepOrange,
              ),
              color: Colors.grey[300],
              itemBuilder: (context) => [
                    PopupMenuItem(
                        child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.deepOrange,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text("Settings"),
                      ],
                    )),
                    PopupMenuItem(
                        child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.deepOrange,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text("Logout")
                      ],
                    ))
                  ])
        ],
        title: Text(
          "Oil Wale",
          style: TextStyle(color: Colors.deepOrange),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: _children[_currentindex],
      floatingActionButton: floatingbtn[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: onTapped,
        currentIndex: _currentindex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: "Offers"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: "Products"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
