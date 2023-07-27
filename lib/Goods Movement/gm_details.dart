import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package
import '../connect.dart';

class gm_details_page extends StatefulWidget {
  gm_details_page({
    Key? key,
    required this.starting_point,
    required this.destination,
    required this.vehicle_no,
    required this.time,
    required this.date,
    required this.vehModel,
    required this.goodsType,
    required this.weight,
    required this.gm_ID,
  }) : super(key: key);

  var starting_point,
      destination,
      vehicle_no,
      time,
      date,
      goodsType,
      weight,
      vehModel,
      gm_ID;

  @override
  State<gm_details_page> createState() => _gm_details_pageState();
}

class _gm_details_pageState extends State<gm_details_page> {
  bool isCompleted = false;
  String poolId = ''; // Initialize poolId with an empty string

  // Function to initiate a phone call
  void _makePhoneCall() async {
    String phoneNumber =
        "<YOUR_PHONE_NUMBER>"; // Replace with the actual phone number you want to call
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void markCompleted() {
    setState(() {
      isCompleted = true;
    });
    updateStatus();

    // Navigate to the Specific_offer page
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => Offer_view(),
    //   ),
    // );
  }

  Future<void> updateStatus() async {
    var data = {
      "gm_id": widget.gm_ID,
    };
    print('>>>>>>>$data');

    var response = await http.post(
      Uri.parse("${con.url}goods_movement/completedStatus.php"),
      body: data,
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200 &&
        jsonDecode(response.body)[0]['result'] == 'success') {
      print("Status updated to 'completed'");
    } else {
      print("Failed to update status");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'GO Share',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xff068DA9),
            fontFamily: 'Times New Roman',
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Container(
                height: 500,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.starting_point,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      Text(
                        "to",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold,
                          color: Colors.black12,
                        ),
                      ),
                      Text(
                        widget.destination,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Vehicle No. :',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w500,
                              color: Colors.black38,
                            ),
                          ),
                          Text(
                            widget.vehicle_no,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w500,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Vehicle Model : ',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w500,
                              color: Colors.black38,
                            ),
                          ),
                          Text(
                            '${widget.vehModel}',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w500,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Weight Left :',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w500,
                              color: Colors.black38,
                            ),
                          ),
                          Text(
                            '${widget.weight} kg',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w500,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Goods Type :',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w500,
                              color: Colors.black38,
                            ),
                          ),
                          Text(
                            widget.goodsType,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w500,
                              color: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.time,
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w500,
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            widget.date,
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.w500,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            onPressed: () {
                              markCompleted();
                            },
                            child: Text('Completed'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed:
                                _makePhoneCall, // Call the function to make a phone call
                            child: Text('Contact'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (isCompleted)
                        Text(
                          'Status: Completed',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
