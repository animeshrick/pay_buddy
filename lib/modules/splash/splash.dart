import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pay_buddy/modules/auth/model/user_token.dart';
import 'package:pay_buddy/router/custom_router/custom_route.dart';
import 'package:pay_buddy/service/value_handler.dart';
import 'package:pay_buddy/storage/local_preferences.dart';

import '../../const/color_const.dart';
import '../../extension/hex_color.dart';
import '../../router/router_name.dart';
import '../../service/context_service.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {

      String? string_token =
          await LocalPreferences().getString(key: LocalPreferences.token);

      if (ValueHandler().isTextNotEmptyOrNull(string_token)) {
        CustomRoute().clearAndNavigate(RouteName.dashboardView);

      } else {
        Future.delayed(const Duration(seconds: 3), () {
          CustomRoute().clearAndNavigate(RouteName.dashboardView);
          // CustomRoute().clearAndNavigate(RouteName.auth);
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex("#000000"),
      body: Center(
        child: Text(
          "Welcome",
          style: TextStyle(
            color: HexColor.fromHex(ColorConst.primaryDark),
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
