
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/router.dart';
import '../../../configs/size_config.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/icon_constant.dart';
import 'icon_button_with_counter.dart';

// class CartButton extends StatelessWidget {
//   final Color color;
//
//   const CartButton({
//     Key? key,
//     this.color = COLOR_CONST.textColor,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartBloc, CartState>(
//         buildWhen: (prevState, currState) => currState is CartLoaded,
//         builder: (context, state) {
//           return IconButtonWithCounter(
//             icon: ICON_CONST.CART,
//             onPressed: () => Navigator.pushNamed(context, AppRouter.CART),
//             counter: state is CartLoaded ? state.cart.length : 0,
//             size: SizeConfig.defaultSize * 3,
//             color: color,
//           );
//         });
//   }
// }
