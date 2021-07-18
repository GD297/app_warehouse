import 'package:app_warehouse/common/bill_box_widget.dart';
import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:flutter/material.dart';

class DetailNotificationScreen extends StatelessWidget {
  Map<String, dynamic> dataBill;
  Map<String, dynamic> dataNoti;

  DetailNotificationScreen({@required this.dataBill, @required this.dataNoti});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mockUpData = {
      'orderId': dataBill['orderId'],
      'title': dataNoti['title'],
      'imagePath': 'assets/images/storage1.png',
      'name': dataBill['name'].toString(),
      'address': dataBill['address'].toString(),
      'rating': 4,
      'status': dataNoti['status'].toString()
    };
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            height: deviceSize.height * 1.7,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: CustomAppBar(
                    isHome: false,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: BillBoxWidget(
                    data: mockUpData,
                    isCheckout: false,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
