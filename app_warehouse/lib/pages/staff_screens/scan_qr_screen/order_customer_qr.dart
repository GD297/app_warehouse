import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/pages/owner_screens/bill/bill_widget.dart';
import 'package:app_warehouse/pages/owner_screens/bill/bill_widget_few.dart';
import 'package:app_warehouse/pages/owner_screens/bill/order_customer_widget.dart';
import 'package:app_warehouse/pages/staff_screens/scan_qr_screen/bill_qr_widget.dart';
import 'package:app_warehouse/pages/staff_screens/scan_qr_screen/order_qr_widget.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:flutter/material.dart';

class OrderCustomerQR extends StatelessWidget {
  bool isDelivery;
  bool isStored;
  List<Order> listOrder;
  OrderCustomerQR(
      {@required this.listOrder,
      @required this.isDelivery,
      @required this.isStored});
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
    print(isDelivery);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.purple,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xfff0f0f0),
          child: Column(
            children: [
              for (int i = 0; i < listOrder.length; i++)
                if (listOrder[i].typeOrder == 'Combo')
                  BillQRWidget(
                    isHistory: true,
                    data: listOrder[i],
                    isCheckout: false,
                  )
                else if (listOrder[i].typeOrder == 'FewServices')
                  OrderQRWidget(
                    isStored: isStored,
                    isHistory: true,
                    isDelivery: isDelivery,
                    data: listOrder[i],
                    isCheckout: false,
                  )
            ],
          ),
        ),
      ),
    );
  }
}
