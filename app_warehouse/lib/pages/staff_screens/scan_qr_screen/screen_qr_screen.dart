import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/pages/staff_screens/scan_qr_screen/detail_room_screen.dart';
import 'package:app_warehouse/pages/staff_screens/scan_qr_screen/order_customer_qr.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:app_warehouse/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanQRScreen extends StatelessWidget {
  bool isStored;

  ScanQRScreen({@required this.isStored});
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Orders>(context);
    List<Order> listOrder = order.orders;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 70),
                  child: Image.asset('assets/images/qr.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Image.asset('assets/images/big_qr.png'),
                )
              ],
            ),
            CustomSizedBox(
              context: context,
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: CustomButton(
                  height: 40,
                  text: 'Scan',
                  width: double.infinity,
                  textColor: CustomColor.white,
                  onPressFunction: () {
                    if (!isStored) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => OrderCustomerQR(
                            isDelivery: false,
                            isStored: false,
                            listOrder: [listOrder[0]],
                          ),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => DetailRoomScreen(),
                        ),
                      );
                    }
                  },
                  buttonColor: CustomColor.purple,
                  borderRadius: 4),
            ),
          ],
        ),
      ),
    );
  }
}
