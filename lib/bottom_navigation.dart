
import 'package:flutter/material.dart';
import 'package:flutter_shop/presentation/screen/profile/profile_screen.dart';
import 'package:flutter_shop/utils/translate.dart';

import 'constants/color_constant.dart';
import 'constants/font_constant.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigation>
    with WidgetsBindingObserver {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  ///On change tab bottom menu
  void onItemTapped(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: [

          // HomeScreen(),
          ProfileScreen(),
        ],
        index: selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: Translate.of(context).translate('home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: Translate.of(context).translate('profile'),
          ),
        ],
        selectedLabelStyle: FONT_CONST.BOLD_DEFAULT,
        selectedItemColor: COLOR_CONST.primaryColor,
        unselectedFontSize: 12,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
