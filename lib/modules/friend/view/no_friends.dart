import 'package:flutter/material.dart';
import 'package:pay_buddy/widget/custom_text.dart';
import 'package:pay_buddy/widget/custom_ui.dart';

class NoFriends extends StatelessWidget {
  const NoFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextEnum("No friends yet.",color: Colors.white).textSM(),
      ],
    ));
  }
}
