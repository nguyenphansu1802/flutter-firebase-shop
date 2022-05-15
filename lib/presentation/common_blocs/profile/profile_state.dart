import 'package:equatable/equatable.dart';

import '../../../models/user_model.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserModel loggedUser;

  ProfileLoaded(this.loggedUser);

  List<Object> get props => [loggedUser];

  @override
  String toString() {
    return "{ProfileLoaded: loggedUser:${this.loggedUser.toString()}}";
  }
}

class ProfileLoadFailure extends ProfileState {
  final String error;

  ProfileLoadFailure(this.error);

  List<Object> get props => [error];
}
