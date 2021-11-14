import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oilwale/screens/garage/garage_scaffold.dart';
import 'package:oilwale/widgets/OffersWidget.dart';
import 'package:oilwale/models/OffersCatalog.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key,required this.gotoOffer}) : super(key: key);

  final Function gotoOffer;

  @override
  _HomePageState createState() => _HomePageState(this.gotoOffer);

}

class _HomePageState extends State<HomePage> {
  get offers => null;
  late Function gotoOffer;
  _HomePageState(Function jabadaba) {
    this.gotoOffer = jabadaba;
  }
  bool showoffers = false;


  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              Container(
                height: 100.0,
                color: Colors.white,
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 0.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(blurRadius: 2.0, color: Colors.grey),
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(25.0, 25.0, 5.0, 5.0),
                            child: Text(
                              "Referral Code",
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5.0, 40.0, 5.0, 25.0),
                            child: Text(
                              "546127123456",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30.0, 0.0, 10.0, 0.0),
                        width: 1,
                        height: 50.0,
                        color: Colors.deepOrange,
                      ),
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(25.0, 25.0, 5.0, 5.0),
                            child: Text(
                              "Credit Points",
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(38.0, 40.0, 5.0, 25.0),
                            child: Center(
                              child: Text(
                                "500",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " Recent Offers ",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    gotoOffer();
                  },
                  child: Text(
                    "See more offers",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          // Column(
          //   children: [
          ListView.builder(
            shrinkWrap: true,
              itemCount: CatalogModel.offers.length,
              itemBuilder: (context, index) {
                return OffersWidget(
                  offers: CatalogModel.offers[index],
                );
              }),
          // Card(
          //   elevation: 4.0,
          //   margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 1,
          //         child: Container(
          //           height: 50.0,
          //           width: 50.0,
          //           margin: EdgeInsets.all(15.0),
          //           child: Icon(Icons.local_offer_rounded, color: Colors.deepOrange,),
          //         ),
          //       ),
          //       Expanded(
          //         flex: 3,
          //         child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children :[
          //               Text("50% off on Oils 2021",
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //               SizedBox(height: 5.0,),
          //               Text("claim a discount of 50% and more on buying newly introduced oils .",
          //                 style: TextStyle(
          //                     fontSize: 10.0
          //                 ),)
          //             ]
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Card(
          //   elevation: 4.0,
          //   margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         flex: 1,
          //         child: Container(
          //           height: 50.0,
          //           width: 50.0,
          //           margin: EdgeInsets.all(15.0),
          //           child: Icon(Icons.local_offer_rounded,color: Colors.deepOrange,),
          //         ),
          //       ),
          //       Expanded(
          //         flex: 3,
          //         child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children :[
          //               Text("50% off on Oils 2021",
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //               SizedBox(height: 5.0,),
          //               Text("claim a discount of 50% and more on buying newly introduced oils .",
          //                 style: TextStyle(
          //                     fontSize: 10.0
          //                 ),)
          //             ]
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          //   ],
          // )
        // ],
    ]
      ),
    );
  }
}
