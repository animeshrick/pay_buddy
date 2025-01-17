import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pay_buddy/const/color_const.dart';
import 'package:pay_buddy/extension/hex_color.dart';
import 'package:pay_buddy/extension/spacing.dart';
import 'package:pay_buddy/modules/search/modules/friends_search/widget/search_friend_item.dart';
import 'package:pay_buddy/router/custom_router/custom_route.dart';
import 'package:pay_buddy/widget/custom_button.dart';
import 'package:pay_buddy/widget/custom_text.dart';
import 'package:pay_buddy/widget/custom_text_formfield.dart';

class FriendsSearchView extends StatefulWidget {
  const FriendsSearchView({super.key});

  @override
  State<FriendsSearchView> createState() => _FriendsSearchViewState();
}

class _FriendsSearchViewState extends State<FriendsSearchView> {
  TextEditingController search = TextEditingController(text: "Animesh");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        30.ph,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomTextFormField(
            hintText: "Search by friend name",
            controller: search,
            prefix: CustomIconButton(
                icon: const Icon(LucideIcons.arrowLeft), onPressed: () {
                  CustomRoute().back();
            }),
          ),
        ),
        16.ph,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomRichText(
            textSpanList: [
              CustomTextSpanEnum(
                      text: " - Users with `",
                      color: HexColor.fromHex(ColorConst.gray500))
                  .textSM(),
              CustomTextSpanEnum(
                      text: search.text,
                      color: HexColor.fromHex(ColorConst.white))
                  .textSemiboldSM(),
              CustomTextSpanEnum(
                      text: "` found.",
                      color: HexColor.fromHex(ColorConst.gray500))
                  .textSM(),
              CustomTextSpanEnum(
                      text: " (2 users)",
                      color: HexColor.fromHex(ColorConst.white))
                  .textSM(),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (_, int index) {
              return SearchFriendItem();
            },
          ),
        ),
      ],
    ));
  }
}
