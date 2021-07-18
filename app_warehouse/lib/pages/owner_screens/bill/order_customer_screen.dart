import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/pages/owner_screens/bill/bill_widget.dart';
import 'package:app_warehouse/pages/owner_screens/bill/bill_widget_few.dart';
import 'package:app_warehouse/pages/owner_screens/bill/order_customer_widget.dart';
import 'package:app_warehouse/pages/owner_screens/bill/room_widget.dart';
import 'package:app_warehouse/pages/owner_screens/new_home_screen/tab_room_screen.dart';
import 'package:app_warehouse/provider/order.dart';
import 'package:flutter/material.dart';

class OrderCustomerScreen extends StatelessWidget {
  bool isStorage;
  bool inRoom;
  List<Order> listOrder;
  OrderCustomerScreen(
      {@required this.listOrder,
      @required this.inRoom,
      @required this.isStorage});
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
        backgroundColor: CustomColor.purple,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xfff0f0f0),
          child: Column(
            children: [
              for (int i = 0; i < listOrder.length; i++)
                if (listOrder[i].typeOrder == 'Combo')
                  BillWidget(
                    isHistory: true,
                    data: listOrder[i],
                    isCheckout: false,
                  )
                else if (listOrder[i].typeOrder == 'FewServices')
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        OrderCustomerWidget(
                          isHistory: true,
                          data: listOrder[i],
                          isCheckout: false,
                        ),
                        if (!inRoom)
                          Row(
                            mainAxisAlignment: !isStorage
                                ? MainAxisAlignment.spaceAround
                                : MainAxisAlignment.center,
                            children: [
                              !isStorage
                                  ? Container(
                                      color: Colors.white,
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: CustomButton(
                                          height: 40,
                                          text: 'Move',
                                          width: double.infinity,
                                          textColor: CustomColor.white,
                                          onPressFunction: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  RoomWidget(),
                                            ));
                                          },
                                          buttonColor: CustomColor.purple,
                                          borderRadius: 4),
                                    )
                                  : Container(),
                              Container(
                                color: Colors.white,
                                width: !isStorage
                                    ? MediaQuery.of(context).size.width * 0.45
                                    : MediaQuery.of(context).size.width * 0.6,
                                child: CustomButton(
                                    height: 40,
                                    text: 'Remove',
                                    width: double.infinity,
                                    textColor: CustomColor.white,
                                    onPressFunction: () {},
                                    buttonColor: CustomColor.red,
                                    borderRadius: 4),
                              ),
                            ],
                          )
                        else
                          Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: CustomButton(
                                height: 40,
                                text: 'Take Order',
                                width: double.infinity,
                                textColor: CustomColor.white,
                                onPressFunction: () {},
                                buttonColor: CustomColor.purple,
                                borderRadius: 4),
                          ),
                        CustomSizedBox(
                          context: context,
                          height: 50,
                        )
                      ],
                    ),
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
