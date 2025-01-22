import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_buddy/const/assets_const.dart';
import 'package:pay_buddy/data/bloc_data_model/dynamic_data.dart';
import 'package:pay_buddy/data/model/user_model.dart';
import 'package:pay_buddy/extension/hex_color.dart';
import 'package:pay_buddy/extension/spacing.dart';
import 'package:pay_buddy/modules/friend/view/no_friends.dart';
import 'package:pay_buddy/utils/pop_up_items.dart';
import 'package:pay_buddy/widget/custom_image.dart';
import 'package:pay_buddy/widget/custom_text.dart';
import 'package:pay_buddy/widget/dash_horizontal_divider.dart';
import 'package:pay_buddy/widget/loading_widget.dart';

import '../../../const/color_const.dart';
import '../../../router/custom_router/custom_route.dart';
import '../../../router/router_name.dart';
import '../../../utils/screen_utils.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_ui.dart';
import '../bloc/friend_bloc.dart';

class FriendsView extends StatefulWidget {
  @override
  State<FriendsView> createState() => _FriendsViewState();
}

class _FriendsViewState extends State<FriendsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FriendBloc()..add(AllFriendsList()),
      child: BlocBuilder<FriendBloc, FriendState>(
        builder: (context, state) {
          return Scaffold(
              body: Column(
            children: [
              8.ph,
              DashHorizontalDivider(
                separatedWidth: 4,
                color: HexColor.fromHex(ColorConst.baseHexColor_shade_2),
              ),
              8.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      CustomRoute().goto(RouteName.receivedFriendRequests);
                    },
                    child: CustomContainer(
                        width: 150,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            bottomLeft: Radius.circular(6)),
                        color: HexColor.fromHex(ColorConst.gray800),
                        padding: const EdgeInsets.all(6),
                        child: Center(
                            child: Badge(
                                backgroundColor:
                                    HexColor.fromHex(ColorConst.error600),
                                alignment: Alignment.topRight,
                                isLabelVisible: true,
                                child: CustomTextEnum("Received Requests")
                                    .textMediumSM()))),
                  ),
                  InkWell(
                    onTap: () {
                      CustomRoute().goto(RouteName.sentFriendRequests);
                    },
                    child: CustomContainer(
                        width: 150,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(6),
                            bottomRight: Radius.circular(6)),
                        color: HexColor.fromHex(ColorConst.brand800),
                        padding: const EdgeInsets.all(6),
                        child: Center(
                            child: CustomTextEnum("Sent Requests")
                                .textMediumSM())),
                  ),
                ],
              ),
              8.ph,
              DashHorizontalDivider(
                separatedWidth: 4,
                color: HexColor.fromHex(ColorConst.baseHexColor_shade_2),
              ),
              8.ph,
              Expanded(
                child: state.allFriends.status == Status.loading
                    ? Center(
                        child: LoadingWidget(
                        height: 30,
                        width: 30,
                      ))
                    : state.allFriends.value?.data?.friendList?.isEmpty == true
                        ? NoFriends()
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 0.9,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: state.allFriends.value?.data?.friendList
                                    ?.length ??
                                0,
                            itemBuilder: (context, index) {
                              UserModel? fiend = state
                                  .allFriends.value?.data?.friendList
                                  ?.elementAt(index);
                              return CustomContainer(
                                color: HexColor.fromHex(ColorConst.gray500),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(6)),
                                boxShadow: [
                                  BoxShadow(
                                    color: HexColor.fromHex(ColorConst.grey4),
                                    blurRadius: 2.0,
                                    offset: const Offset(0, 2),
                                    spreadRadius: 1,
                                  ),
                                ],
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          CustomAssetImageView(
                                              path: AssetsConst.profile_image,
                                              height: 120),
                                          Padding(
                                            padding: const EdgeInsets.all(7),
                                            child: CustomTextEnum(
                                                    "${fiend?.fname} ${fiend?.lname}",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center)
                                                .textSM(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomGOEButton(
                                        size: Size(ScreenUtils.aw * 0.5, 35),
                                        radius: 0,
                                        backGroundColor: HexColor.fromHex(
                                            ColorConst.gray200),
                                        onPressed: () {
                                          PopUpItems().cupertinoPopup(
                                              title: "Remove ${fiend?.fname} !",
                                              content:
                                                  "Are you sure you want to remove this friend?",
                                              cancelBtnPresses: () {},
                                              okBtnPressed: () {});
                                        },
                                        child: Center(
                                          child: CustomTextEnum("Remove Friend",
                                                  color: HexColor.fromHex(
                                                      ColorConst.primaryDark))
                                              .textSM(),
                                        )),
                                  ],
                                ),
                              );
                            },
                          ),
              ),
              16.ph,
              CustomContainer(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: CustomGOEButton(
                  radius: 6,
                  size: Size(ScreenUtils.aw, 38),
                  backGroundColor: HexColor.fromHex(ColorConst.baseHexColor),
                  onPressed: () {
                    CustomRoute().goto(RouteName.friends_search);
                  },
                  child: CustomTextEnum(
                    "Add a new Friend",
                    color: HexColor.fromHex(ColorConst.white),
                  ).textMediumMD(),
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}
