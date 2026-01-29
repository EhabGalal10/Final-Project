import 'package:flutter/material.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthAutoValidate extends AuthState {
  final AutovalidateMode autovalidateMode;

  AuthAutoValidate({
    this.autovalidateMode = AutovalidateMode.always,
  });
}


class SignUpSuccess extends AuthState {}
class SignUpFailure extends AuthState {
  final String errorMessage;

  SignUpFailure(this.errorMessage);
}
class SignUpLoading extends AuthState {}