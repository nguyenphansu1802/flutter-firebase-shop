
import 'package:flutter/material.dart';
import '../../../configs/router.dart';
import '../../../configs/size_config.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/icon_constant.dart';
import 'icon_button_with_counter.dart';

class MessageButton extends StatelessWidget {
  final Color color;

  const MessageButton({
    Key? key,
    this.color = COLOR_CONST.textColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButtonWithCounter(
      icon: ICON_CONST.MESSAGE,
      onPressed: () {
        Navigator.pushNamed(context, AppRouter.MESSAGES);
      },
      counter: 0,
      size: SizeConfig.defaultSize * 3,
      color: color,
    );
  }
}
