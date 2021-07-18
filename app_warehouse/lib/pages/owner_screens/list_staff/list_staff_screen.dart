import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/pages/owner_screens/list_staff/staff_widget.dart';
import 'package:flutter/material.dart';

class ListStaffScreen extends StatelessWidget {
  List<Map<String, dynamic>> listStaff = [
    {
      'avatarPath': 'assets/images/avatar.png',
      'phone': '0903775094',
      'storageName': 'Medium Storage',
      'salary': '7,000,000',
      'staffName': 'Clarent Daisy',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City'
    },
    {
      'avatarPath': 'assets/images/avatar2.png',
      'phone': '0903790042',
      'storageName': 'Prenium Storage',
      'salary': '7,000,000',
      'staffName': 'John Paker',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City'
    },
    {
      'avatarPath': 'assets/images/avatar.png',
      'phone': '0903775094',
      'storageName': 'Medium Storage',
      'salary': '17,000,000',
      'staffName': 'Jessica Daisy',
      'address':
          '12, Phan Van Tri Street, Go Vap District, Ward 5, Ho Chi Minh City'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomSizedBox(
            context: context,
            height: 16,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) {
                return StaffWidget(
                    data: listStaff[index], deviceSize: deviceSize);
              },
              itemCount: listStaff.length,
            ),
          ),
          CustomSizedBox(
            context: context,
            height: 32,
          )
        ],
      ),
    );
  }
}
