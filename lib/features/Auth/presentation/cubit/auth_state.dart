import 'package:flutter/material.dart';

class AuthState {}

class AuthInitial extends AuthState {}
class AuthAutoValidate extends AuthState {
  final AutovalidateMode autovalidateMode;

  AuthAutoValidate({
    this.autovalidateMode = AutovalidateMode.always,
  });
}