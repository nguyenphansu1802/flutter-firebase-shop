import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../configs/application.dart';
import '../../../local/pref.dart';
import '../auth/auth_event.dart';
import '../common_bloc.dart';
import '../language/language_event.dart';
import 'application_event.dart';
import 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final Application application = Application();

  ApplicationBloc() : super(ApplicationInitial());

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is SetupApplication) {
      /// Setup SharedPreferences
      await application.setPreferences();

      /// Get old settings
      final oldLanguage = LocalPref.getString("language");

      if (oldLanguage != null) {
        CommonBloc.languageBloc.add(LanguageChanged(Locale(oldLanguage)));
      }

      /// Authentication begin check
      CommonBloc.authencationBloc.add(AuthenticationStarted());

      yield ApplicationCompleted();
    }
  }
}
