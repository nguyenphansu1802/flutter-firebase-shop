
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/presentation/screen/profile/profile_header.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../configs/router.dart';
import '../../../configs/size_config.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/icon_constant.dart';
import '../../../utils/translate.dart';
import '../../common_blocs/auth/auth_bloc.dart';
import '../../common_blocs/auth/auth_event.dart';
import '../../widgets/others/custom_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(),
              _buildProfileMenuButton(
                text: Translate.of(context).translate("settings"),
                icon: ICON_CONST.SETTING,
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.SETTING);
                },
              ),
              _buildProfileMenuButton(
                text: Translate.of(context).translate("cart"),
                icon: ICON_CONST.CART,
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.CART);
                },
              ),
              _buildProfileMenuButton(
                text: Translate.of(context).translate("my_orders"),
                icon: ICON_CONST.ORDER,
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.MY_ORDERS);
                },
              ),
              _buildProfileMenuButton(
                text: Translate.of(context).translate("delivery_address"),
                icon: ICON_CONST.ADDRESS,
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.DELIVERY_ADDRESS);
                },
              ),
              _buildProfileMenuButton(
                text: Translate.of(context).translate("log_out"),
                icon: ICON_CONST.LOG_OUT,
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildProfileMenuButton({
    required String text,
    required String icon,
    required Function() onPressed,
  }) {
    return CustomListTile(
      leading: SvgPicture.asset(
        icon,
        color: COLOR_CONST.primaryColor,
        width: SizeConfig.defaultSize * 3,
      ),
      title: text,
      onPressed: onPressed,
      trailing: Icon(Icons.arrow_forward_ios, color: COLOR_CONST.textColor),
    );
  }
}
