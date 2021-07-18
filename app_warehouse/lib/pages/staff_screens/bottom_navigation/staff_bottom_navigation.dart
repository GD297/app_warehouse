import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_staff_bottm_navigation.dart';
import 'package:app_warehouse/pages/customer_screens/profile/profile_screen.dart';
import 'package:app_warehouse/pages/staff_screens/home_screen/home_screen.dart';
import 'package:app_warehouse/pages/staff_screens/scan_qr_screen/screen_qr_screen.dart';
import 'package:app_warehouse/pages/staff_screens/schedule_today_screen/schedule_today_screen.dart';
import 'package:flutter/material.dart';

class StaffBottomNavigation extends StatefulWidget {
  @override
  _StaffBottomNavigationState createState() => _StaffBottomNavigationState();
}

class _StaffBottomNavigationState extends State<StaffBottomNavigation> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _index = 0;
  }

  void _tapTab(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      // drawerScrimColor: Color.fromARGB(51, 51, 51, 5),
      resizeToAvoidBottomInset: true,
      backgroundColor: CustomColor.white,
      // resizeToAvoidBottomPadding: false,
      body: Stack(
        children: [
          IndexedStack(
            index: _index,
            children: [
              HomeScreenStaff(),
              ScanQRScreen(
                isStored: false,
              ),
              ScheduleTodayScreen(),
              ProfileScreen()
            ],
          ),
          CustomStaffBottomNavigation(
            deviceSize: deviceSize,
            index: _index,
            tapTab: _tapTab,
          )
        ],
      ),
    );
  }
}
