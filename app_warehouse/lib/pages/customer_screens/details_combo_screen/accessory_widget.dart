import 'package:app_warehouse/common/custom_accessories.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/provider/accessory.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccesoryWidget extends StatelessWidget {
  final oCcy = new NumberFormat("#,##0", "en_US");
  Accessory accessory;
  Map<String, dynamic> listCombo;

  AccesoryWidget({@required this.accessory, @required this.listCombo});
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: AccessoriesCard(
        nameAccess: accessory.name,
        price: oCcy.format(accessory.price) + " VND",
        size: accessory.size,
        imgPath: accessory.imagePath,
        isCart: true,
        quantity: Text(
          listCombo.keys.first,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
        tooltipIcon: accessory.tooltipIcon,
        tooltipImage: accessory.tooltipImage,
        tooltipMessage: Container(
          height: deviceSize.height / 1.9,
          child: Column(
            children: [
              Image.asset(accessory.tooltipImage),
              CustomSizedBox(
                context: context,
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
