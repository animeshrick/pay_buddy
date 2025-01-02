import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pay_buddy/const/assets_const.dart';
import 'package:pay_buddy/const/color_const.dart';
import 'package:pay_buddy/extension/hex_color.dart';
import 'package:pay_buddy/extension/spacing.dart';
import 'package:pay_buddy/modules/group/modules/group_settings/bloc/group_settings_bloc.dart';
import 'package:pay_buddy/widget/custom_button.dart';
import 'package:pay_buddy/widget/custom_image.dart';
import 'package:pay_buddy/widget/custom_text.dart';
import 'package:pay_buddy/widget/custom_ui.dart';

class GroupSettingsView extends StatelessWidget {
  const GroupSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: CustomTextEnum('Group Settings').textMediumMD(),
      ),
      body: BlocProvider(
        create: (context) => GroupSettingsBloc(),
        child: BlocBuilder<GroupSettingsBloc, GroupSettingsState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomAssetImageView(
                            path: AssetsConst.app_logo,
                            height: 40,
                            width: 40,
                          ),
                          16.pw,
                          CustomTextEnum(
                            'Group Name',
                            color: HexColor.fromHex(ColorConst.baseHexColor),
                          ).textSemiboldMD(),
                        ],
                      ),
                      CustomIconButton(
                          icon: Icon(
                            LucideIcons.filePenLine,
                            color: HexColor.fromHex(ColorConst.baseHexColor),
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ),
                8.ph,
                Divider(
                    height: 0.2,
                    thickness: 0.2,
                    color: HexColor.fromHex(ColorConst.baseHexColor)),
                8.ph,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextEnum(
                    'Group Members',
                    color: HexColor.fromHex(ColorConst.baseHexColor),
                  ).textSM(),
                ),
                16.ph,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Icon(
                        LucideIcons.userRoundPlus,
                        color: HexColor.fromHex(ColorConst.baseHexColor),
                      ),
                      16.pw,
                      CustomTextEnum(
                        'App people to the GroupName',
                        color: HexColor.fromHex(ColorConst.primaryDark),
                      ).textMediumSM(),
                    ],
                  ),
                ),
                16.ph,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Icon(
                        LucideIcons.link2,
                        color: HexColor.fromHex(ColorConst.baseHexColor),
                      ),
                      16.pw,
                      CustomTextEnum(
                        'Invite via link',
                        color: HexColor.fromHex(ColorConst.primaryDark),
                      ).textMediumSM(),
                    ],
                  ),
                ),
                8.ph,
                Divider(
                    height: 0.2,
                    thickness: 0.2,
                    color: HexColor.fromHex(ColorConst.baseHexColor)),
                CustomContainer(
                  color: HexColor.fromHex(ColorConst.brand50),
                  height: state.isShowMembers.value == false? 40: 250,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextEnum(
                            'Group Members (10)',
                            color: HexColor.fromHex(ColorConst.primaryDark),
                          ).textSM(),
                          state.isShowMembers.value == true
                              ? CustomIconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(LucideIcons.arrowUpFromLine,
                                      color: HexColor.fromHex(
                                          ColorConst.baseHexColor)),
                                  onPressed: () {
                                    context
                                        .read<GroupSettingsBloc>()
                                        .add(IsShowMembers(isShow: false));
                                  })
                              : CustomIconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(LucideIcons.arrowDownFromLine,
                                      color: HexColor.fromHex(
                                          ColorConst.baseHexColor)),
                                  onPressed: () {
                                    context
                                        .read<GroupSettingsBloc>()
                                        .add(IsShowMembers(isShow: true));
                                  }),
                        ],
                      ),
                      if(state.isShowMembers.value == true)...[
                      8.ph,
                      Divider(
                          height: 0.2,
                          thickness: 0.2,
                          color: HexColor.fromHex(ColorConst.baseHexColor)),
                      8.ph],
                      if (state.isShowMembers.value == true) ...[
                        Expanded(
                          child: ListView.separated(
                              separatorBuilder: (_, __) => 8.ph,
                              itemCount: 8,
                              itemBuilder: (_, int index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CustomAssetImageView(
                                          path: AssetsConst.app_logo,
                                          height: 40,
                                          width: 40,
                                        ),
                                        16.pw,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomTextEnum(
                                              'Maya',
                                              color: HexColor.fromHex(
                                                  ColorConst.primaryDark),
                                            ).textSM(),
                                            CustomTextEnum(
                                              'xyz@gmail.com',
                                              color: HexColor.fromHex(
                                                  ColorConst.gray500),
                                            ).textSemiboldSM(),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomTextEnum(
                                          'gets  back Rs.20',
                                          color: HexColor.fromHex(
                                              ColorConst.success600),
                                        ).textSemiboldSM(),
                                        8.pw,
                                        CustomIconButton(
                                            icon: Icon(
                                              LucideIcons.circleEllipsis,
                                              size: 16,
                                              color: HexColor.fromHex(
                                                  ColorConst.gray500),
                                            ),
                                            onPressed: () {})
                                      ],
                                    ),
                                  ],
                                );
                              }),
                        )
                      ],
                    ],
                  ),
                ),
                Divider(
                    height: 0.2,
                    thickness: 0.2,
                    color: HexColor.fromHex(ColorConst.baseHexColor)),
                8.ph,
                CustomContainer(
                  color: HexColor.fromHex(ColorConst.white),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextEnum(
                        'Advanced settings',
                        color: HexColor.fromHex(ColorConst.primaryDark),
                      ).textSM(),
                      8.ph,
                      Divider(
                          height: 0.2,
                          thickness: 0.2,
                          color: HexColor.fromHex(ColorConst.baseHexColor)),
                      8.ph,
                      Row(
                        children: [
                          Icon(
                            LucideIcons.logOut,
                            color: HexColor.fromHex(ColorConst.gray500),
                          ),
                          16.pw,
                          Column(
                            children: [
                              CustomTextEnum(
                                'Leave Group',
                                color: HexColor.fromHex(ColorConst.gray500),
                              ).textMediumSM(),
                            ],
                          ),
                        ],
                      ),
                      8.ph,
                      Row(
                        children: [
                          Icon(
                            LucideIcons.trash2,
                            color: HexColor.fromHex(ColorConst.error600),
                          ),
                          16.pw,
                          CustomTextEnum(
                            'Delete Group',
                            color: HexColor.fromHex(ColorConst.error600),
                          ).textBoldSM(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
