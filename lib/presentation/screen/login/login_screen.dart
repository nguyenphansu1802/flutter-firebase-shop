
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/presentation/screen/login/widgets/login_form.dart';
import 'package:flutter_shop/presentation/screen/login/widgets/login_header.dart';

import '../../../configs/router.dart';
import '../../../configs/size_config.dart';
import '../../../constants/font_constant.dart';
import '../../../utils/translate.dart';
import 'bloc/login_bloc.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                LoginHeader(),
                LoginForm(),
              ],
            ),
          ),
          bottomNavigationBar: _buildNoAccountText(context),
        ),
      ),
    );
  }

  _buildNoAccountText(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize * 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            Translate.of(context).translate('don\'t_have_an_account'),
            style: FONT_CONST.REGULAR_DEFAULT_20,
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              AppRouter.INITIALIZE_INFO,
            ),
            child: Text(
              Translate.of(context).translate('register'),
              style: FONT_CONST.BOLD_PRIMARY_20,
            ),
          ),
        ],
      ),
    );
  }
}
