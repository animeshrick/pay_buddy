import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pay_buddy/const/color_const.dart';
import 'package:pay_buddy/extension/hex_color.dart';
import 'package:pay_buddy/extension/spacing.dart';
import 'package:pay_buddy/utils/pop_up_items.dart';
import 'package:pay_buddy/utils/screen_utils.dart';
import 'package:pay_buddy/utils/text_utils.dart';
import 'package:pay_buddy/widget/custom_button.dart';
import 'package:pay_buddy/widget/custom_image.dart';
import 'package:pay_buddy/widget/custom_text.dart';
import 'package:pay_buddy/widget/custom_ui.dart';
import 'package:pay_buddy/widget/loading_widget.dart';

import '../../../const/assets_const.dart';
import '../../../data/bloc_data_model/dynamic_data.dart';
import '../bloc/account_bloc.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountBloc()..add(UserDetails()),
      child: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return state.userDetails.status == Status.error
              ? CustomTextEnum(state.userDetails.message ?? "Issue in account",
                      color: Colors.yellow)
                  .textSM()
              : state.userDetails.status == Status.loading
                  ? Center(child: LoadingWidget(width: 30,height: 30,))
                  : Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              CustomContainer(
                                color: HexColor.fromHex(
                                    ColorConst.lighter_baseHexColor),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircularProfileImage(
                                          imageUrl: state.userDetails.value?.image,
                                          assetImage: AssetsConst.profile_image,
                                          radius: 25,
                                        ),
                                        16.pw,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomTextEnum(
                                                    "${state.userDetails.value?.fname} ${state.userDetails.value?.lname}",
                                                    color: HexColor.fromHex(
                                                        ColorConst.primaryDark))
                                                .textMediumSM(),
                                            CustomTextEnum("${state.userDetails.value?.email}",
                                                    color: HexColor.fromHex(
                                                        ColorConst.gray500))
                                                .textSM(),
                                          ],
                                        ),
                                      ],
                                    ),
                                    CustomGOEButton(
                                        borderColor: HexColor.fromHex(
                                            ColorConst.gray400),
                                        size: const Size(82, 35),
                                        onPressed: () {},
                                        child: Row(
                                          children: [
                                            CustomTextEnum(
                                              "Edit",
                                              color: HexColor.fromHex(
                                                  ColorConst.primaryDark),
                                            ).textSM(),
                                            8.pw,
                                            Icon(LucideIcons.pen,
                                                size: 16,
                                                color: HexColor.fromHex(
                                                    ColorConst.primaryDark))
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomContainer(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: CustomGOEButton(
                            radius: 6,
                            size: Size(ScreenUtils.aw, 38),
                            backGroundColor:
                                HexColor.fromHex(ColorConst.baseHexColor),
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
                        ),
                      ],
                    );
        },
      ),
    );
  }
}
