import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../routes/routes.dart';
import '../../../core/util/bloc/database/database_bloc.dart';
import '../../../core/util/constants.dart';

class SplashScaffold extends StatelessWidget {
  const SplashScaffold();

  @override
  Widget build(BuildContext context) {
    return BlocListener<DatabaseBloc, DatabaseState>(
      listener: (context, state) async {
        await Future.delayed(Duration(seconds: 1));
        log('Message : SplashScaffold $state');
        if (state is DatabaseLoaded) {
          Navigator.of(context).pushReplacementNamed(RouteGenerator.tabScreen);
        } else if (state is DatabaseFailed) {
          Navigator.of(context)
              .pushReplacementNamed(RouteGenerator.databaseError);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 0,
          systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: kAppIconBorderRadius,
                child: Image.asset(
                  'assets/images/core/svg/app_logo.png',
                  width: 128.w,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
