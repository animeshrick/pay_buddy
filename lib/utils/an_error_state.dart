import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_buddy/utils/pop_up_items.dart';
import 'package:pay_buddy/utils/screen_utils.dart';
import 'package:pay_buddy/utils/text_utils.dart';
import 'package:pay_buddy/widget/custom_text.dart';

import '../const/color_const.dart';
import '../extension/hex_color.dart';
import '../modules/account/bloc/account_bloc.dart';
import '../widget/custom_button.dart';

class AnErrorState extends StatelessWidget {
  final String? errorMessage;

  const AnErrorState({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextEnum(errorMessage ?? "Issue in account. Please re-login",
                color: Colors.yellow)
            .textSM(),
        CustomGOEButton(
          radius: 6,
          size: Size(ScreenUtils.aw, 38),
          backGroundColor: HexColor.fromHex(ColorConst.baseHexColor),
          onPressed: () async {
            PopUpItems().cupertinoPopup(
                okBtnText: TextUtils.sign_out,
                content: TextUtils.sign_out_content,
                title: TextUtils.sign_out_title,
                cancelBtnPresses: () {},
                okBtnPressed: () {
                  context.read<AccountBloc>().add(Logout());
                });
          },
          child: CustomTextEnum(
            "Logout",
            color: HexColor.fromHex(ColorConst.white),
          ).textMediumMD(),
        ),
      ],
    );
  }
}
