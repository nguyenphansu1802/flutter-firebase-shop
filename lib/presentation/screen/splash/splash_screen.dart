import 'package:flutter/material.dart';

import '../../../configs/config.dart';
import '../../../configs/size_config.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/image_constant.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_CONST.primaryColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              IMAGE_CONST.APP_LOGO,
              width: SizeConfig.defaultSize * 15,
              height: SizeConfig.defaultSize * 15,
            ),
            SizedBox(height: SizeConfig.defaultSize),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
