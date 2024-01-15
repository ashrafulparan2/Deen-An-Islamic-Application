import 'package:bloc/bloc.dart';
import 'package:deen/src/features/MosqueTracker/mosqueTracker.dart';
import 'package:deen/src/features/tracking/screen/search_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../bookmark/screen/bookmark_screen.dart';
import '../../../home/screen/home_screen.dart';
import '../../../quran/screen/quran_screen.dart';
import '../../../setting/screen/setting_screen.dart';
import '../../../tracking/screen/sign_in.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabState(0, pages[0])) {
    on<TabEvent>((event, emit) async {
      if (event is SetTab) {
        emit(TabState(
          event.index,
          pages[event.index],
        ));
      }
    });
  }
}

User? user = FirebaseAuth.instance.currentUser;
final List<Widget> pages = [
  HomeScreen(),
  (user == null) ? SignInPage() : SearchScreen(),
  // QuranScreen(fromNav: true),
  MosqueScreen(),
  BookmarkScreen(),
  SettingScreen(),
];
