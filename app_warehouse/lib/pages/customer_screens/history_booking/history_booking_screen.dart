import 'package:app_warehouse/common/bill_combo_widget.dart';
import 'package:app_warehouse/common/bill_few_widget.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:flutter/material.dart';

class HistoryBookingScreen extends StatelessWidget {
  List<Order> listOrder;
  HistoryBookingScreen({@required this.listOrder});
  List<Map<String, dynamic>> mockUpData = [
    {
      'imagePath': 'assets/images/storage1.png',
      'name': 'Lakeview self storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'rating': 4,
    },
    {
      'imagePath': 'assets/images/storage2.png',
      'name': 'USA self Storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'rating': 4,
    },
    {
      'imagePath': 'assets/images/storage3.png',
      'name': 'Chalmetter super Storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'rating': 4,
    },
    {
      'imagePath': 'assets/images/storage4.png',
      'name': 'Mountain Storage',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City',
      'rating': 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Order"),
        backgroundColor: CustomColor.purple,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xfff0f0f0),
          child: Column(
            children: [
              for (int i = 0; i < listOrder.length; i++)
                if (listOrder[i].typeOrder == 'Combo')
                  BillComboWidget(
                    isHistory: true,
                    data: listOrder[i],
                    isCheckout: false,
                  )
                else if (listOrder[i].typeOrder == 'FewServices')
                  Builder(
                    builder: (BuildContext context) {
                      return BillFewWidget(
                        isHistory: true,
                        data: listOrder[i],
                        isCheckout: false,
                      );
                    },
                  )
                else
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 250),
                      child: Text("No Order Here"),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
