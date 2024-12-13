import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _characterCount = StepTween(begin: 0, end: _text.length)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      kIsWeb
          ? CurrentContext().context.goNamed(RouteName.auth)
          : CurrentContext().context.pushNamed(RouteName.auth);
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
