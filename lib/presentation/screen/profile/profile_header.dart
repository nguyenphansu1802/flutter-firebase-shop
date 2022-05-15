import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../configs/size_config.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/font_constant.dart';
import '../../../constants/icon_constant.dart';
import '../../../constants/image_constant.dart';
import '../../../models/user_model.dart';
import '../../common_blocs/profile/profile_bloc.dart';
import '../../common_blocs/profile/profile_event.dart';
import '../../common_blocs/profile/profile_state.dart';
import '../../widgets/buttons/circle_icon_button.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  void onUploadAvatar(BuildContext context) async {
    ImagePicker picker = ImagePicker();
    File imageFile;
    final file = await picker.getImage(source: ImageSource.gallery);
    if (file != null) {
      imageFile = File(file.path);
      BlocProvider.of<ProfileBloc>(context).add(UploadAvatar(imageFile));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.defaultSize * 30,
      color: COLOR_CONST.primaryColor,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildProfilePicture(context, state.loggedUser),
                Text(
                  "${state.loggedUser.name}",
                  style: FONT_CONST.BOLD_WHITE_26,
                )
              ],
            );
          }
          return Center(child: Text("Something went wrongs."));
        },
      ),
    );
  }

  _buildProfilePicture(BuildContext context, UserModel loggedUser) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: SizeConfig.defaultSize * 15,
          width: SizeConfig.defaultSize * 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: CircleAvatar(
            backgroundImage: loggedUser.avatar.isNotEmpty
                ? NetworkImage(loggedUser.avatar)
                : AssetImage(IMAGE_CONST.DEFAULT_AVATAR)
                    as ImageProvider<Object>,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: CircleIconButton(
            onPressed: () => onUploadAvatar(context),
            svgIcon: ICON_CONST.CAMERA,
            color: COLOR_CONST.cardShadowColor,
            size: SizeConfig.defaultSize * 3,
          ),
        )
      ],
    );
  }
}
