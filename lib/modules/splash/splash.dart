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
  late AnimationController _controller;
  late Animation<int> _characterCount;

  final String _text = "me.com";

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _controller = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this,
      );

      _characterCount = StepTween(begin: 0, end: _text.length)
          .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

      _controller.forward();

      String? string_token =
          await LocalPreferences().getString(key: LocalPreferences.token);

      if (ValueHandler().isTextNotEmptyOrNull(string_token)) {
        CustomRoute().clearAndNavigate(RouteName.dashboardView);

      } else {
        Future.delayed(const Duration(seconds: 3), () {
          CustomRoute().clearAndNavigate(RouteName.auth);
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex("#000000"),
      body: Center(
        child: AnimatedBuilder(
          animation: _characterCount,
          builder: (context, child) {
            String currentText = _text.substring(0, _characterCount.value);
            return Text(
              currentText,
              style: TextStyle(
                color: HexColor.fromHex(ColorConst.primaryDark),
                fontSize: 24,
              ),
            );
          },
        ),
      ),
    );
  }
}
