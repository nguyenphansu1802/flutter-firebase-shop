
import 'package:flutter/material.dart';

import '../../../../configs/size_config.dart';
import '../../../../constants/color_constant.dart';
import '../../../../constants/font_constant.dart';
import '../../../../utils/translate.dart';


class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: SizeConfig.defaultSize * 15,
        bottom: SizeConfig.defaultSize * 3,
        right: SizeConfig.defaultSize * 1.5,
        left: SizeConfig.defaultSize * 1.5,
      ),
      color: COLOR_CONST.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Translate.of(context).translate("welcome_back"),
            style: FONT_CONST.BOLD_WHITE_32,
          ),
          Text(
            Translate.of(context).translate("login_slogan"),
            style: FONT_CONST.MEDIUM_WHITE_20,
          ),
        ],
      ),
    );
  }
}
