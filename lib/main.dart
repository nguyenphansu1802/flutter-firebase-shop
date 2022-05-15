import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop/bottom_navigation.dart';
import 'package:flutter_shop/presentation/common_blocs/common_bloc.dart';
import 'package:flutter_shop/presentation/common_blocs/simple_bloc_observer.dart';
import 'package:flutter_shop/presentation/screen/home/home_screen.dart';

import 'app_view.dart';
import 'configs/config.dart';
// import 'configs/size_config.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  // Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp(
  // options: FirebaseOptions(
  //     apiKey: 'apiKey',
  //     appId: 'AIzaSyDu9QaTEI2Tk5-2fE_kVQeSzuI1Tr_DmvY',
  //     messagingSenderId: 'messagingSenderId',
  //     projectId: 'fir-shop-c5a68'
  //
  //       )
  );
  runApp(MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: CommonBloc.blocProviders,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return AppView();
            },
          );
        },
      ),
    );
  }
}