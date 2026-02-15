import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/features/Auth/presentation/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? email;
  String? password;
  String? confirmPassword;
  String? name;
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();

  void enableAutoValidate() {
    emit(AuthAutoValidate());
  }

  void signUp() async {
    emit(SignUpLoading());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email!.trim(),
            password: password!.trim(),
          );
      await credential.user?.sendEmailVerification();
      final uid = credential.user!.uid;
      await addUserData(uid);
      await FirebaseAuth.instance.signOut();
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailure('The Account already exists'));
      }
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }

  void sendEmailVerification() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  void login() async {
    emit(LoginLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!.trim(),
        password: password!.trim(),
      );
      await credential.user?.reload();
      if (credential.user != null && credential.user!.emailVerified) {
        emit(LoginSuccess());
      } else {
        await FirebaseAuth.instance.signOut();
        emit(LoginEmailNotVerified());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure('Wrong password'));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> addUserData(String uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': name,
      'email': email,
    });
  }
}
