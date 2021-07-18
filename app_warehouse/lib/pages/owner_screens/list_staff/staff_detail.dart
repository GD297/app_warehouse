import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:flutter/material.dart';

class StaffDetail extends StatefulWidget {
  final data;
  final deviceSize;

  StaffDetail({this.data, this.deviceSize});

  @override
  _StaffDetailState createState() => _StaffDetailState();
}

class _StaffDetailState extends State<StaffDetail> {
  String _storageName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _storageName = widget.data['storageName'];
  }

  void onChangeDropdownCButton(String value) {
    setState(() {
      _storageName = value;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            CustomAppBar(
              isHome: false,
              isOwner: true,
            ),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            Container(
              width: widget.deviceSize.width / 4,
              height: widget.deviceSize.width / 4,
              child: Stack(children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(widget.deviceSize.width / 8),
                  child: Container(
                      width: widget.deviceSize.width / 4,
                      height: widget.deviceSize.width / 4,
                      child: Image.asset(widget.data['avatarPath'])),
                ),
              ]),
            ),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: 'Name: ',
                    color: CustomColor.black,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                CustomText(
                  text: widget.data['staffName'],
                  color: CustomColor.black,
                  context: context,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: 'Phone: ',
                    color: CustomColor.black,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                CustomText(
                  text: widget.data['phone'],
                  color: CustomColor.black,
                  context: context,
                  fontSize: 16,
                ),
              ],
            ),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: 'Address: ',
                    color: CustomColor.black,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                Container(
                  width: widget.deviceSize.width / 2,
                  child: CustomText(
                    text: widget.data['address'],
                    color: CustomColor.black,
                    textAlign: TextAlign.right,
                    context: context,
                    maxLines: 2,
                    fontSize: 14,
                  ),
                )
              ],
            ),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: 'Salary: ',
                    color: CustomColor.black,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                CustomText(
                  text: widget.data['salary'],
                  color: CustomColor.purple,
                  context: context,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: 'Storage: ',
                    color: CustomColor.black,
                    context: context,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: CustomColor.black[3], width: 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: DropdownButton(
                      icon: ImageIcon(
                        AssetImage('assets/images/arrowDown.png'),
                      ),
                      iconSize: 16,
                      hint: CustomText(
                          text: 'Storage',
                          color: CustomColor.black[2],
                          context: context,
                          fontSize: 16),
                      underline: Container(
                        width: 0,
                      ),
                      value: _storageName,
                      onChanged: onChangeDropdownCButton,
                      items: <String>[
                        'Medium Storage',
                        'Prenium Storage',
                        'Large Storage'
                      ]
                          .map((e) => DropdownMenuItem<String>(
                              value: e,
                              child: CustomText(
                                  text: e,
                                  color: CustomColor.black,
                                  context: context,
                                  fontSize: 16)))
                          .toList()),
                ),
              ],
            ),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            CustomButton(
                height: 32,
                text: 'Submit',
                width: double.infinity,
                textColor: CustomColor.white,
                onPressFunction: () {},
                buttonColor: CustomColor.purple,
                borderRadius: 4),
          ],
        ),
      ),
    );
  }
}
