import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makdad_app/core/utils/constant.dart';
import 'package:makdad_app/features/data/models/user_model.dart';
import 'package:makdad_app/features/data/presentation/manger/social_cubit/social_state.dart';
import 'package:makdad_app/features/data/presentation/views/chats/chats.dart';
import 'package:makdad_app/features/data/presentation/views/feeds/feeds.dart';
import 'package:makdad_app/features/data/presentation/views/settings/settings.dart';
import 'package:makdad_app/features/data/presentation/views/users/users.dart';

class SocialCubit extends Cubit<SocialState> {
  SocialCubit() : super(SocialIntialState());
  static SocialCubit get(context) {
    return BlocProvider.of(context);
  }

  UserModel? userModel;
  void getUserData() {
    emit(SocialGetUserLoadinState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      emit(SocialGetUserSuccesState());
    }).catchError((error) {
      print(error.toString());
      emit(
        SocialGetUserErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  int currentIndex = 0;
  List<Widget> screensNave = const [
    FeedsScreen(),
    ChatsScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];
  List<String> titlels = const [
    'Home',
    'Chats',
    'Friends',
    'Settings',
  ];
  void changeBottomNav(index) {
    if(index==2){
      emit(SocialNewPostBottomNavState());
    }
 else   {currentIndex = index;
 emit(SocialChangeBottomNavState());}
    
  }
}
