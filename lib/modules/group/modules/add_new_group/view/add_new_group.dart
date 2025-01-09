import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pay_buddy/const/assets_const.dart';
import 'package:pay_buddy/const/color_const.dart';
import 'package:pay_buddy/extension/hex_color.dart';
import 'package:pay_buddy/extension/spacing.dart';
import 'package:pay_buddy/router/custom_router/custom_route.dart';
import 'package:pay_buddy/utils/screen_utils.dart';
import 'package:pay_buddy/widget/custom_button.dart';
import 'package:pay_buddy/widget/custom_image.dart';
import 'package:pay_buddy/widget/custom_text.dart';
import 'package:pay_buddy/widget/custom_text_formfield.dart';
import 'package:pay_buddy/widget/custom_ui.dart';

import '../../../../../data/model/custom_file.dart';
import '../../../../../extension/file_picker.dart';
import '../../../../../utils/pop_up_items.dart';
import '../../../../../utils/text_utils.dart';
import '../../../../../widget/file_view.dart';
import '../bloc/add_new_group_bloc.dart';

class AddNewGroup extends StatefulWidget {
  const AddNewGroup({super.key});

  @override
  State<AddNewGroup> createState() => _AddNewGroupState();
}

class _AddNewGroupState extends State<AddNewGroup> {
  final List<String> friends = ["Alice", "Bob", "Charlie", "Daisy"];

  TextEditingController groupName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNewGroupBloc(),
      child: BlocBuilder<AddNewGroupBloc, AddNewGroupState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: CustomTextEnum("Add a new group").textMediumMD(),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomTextFormField(
                    label: "Group Name",
                    controller: groupName,
                  ),
                ),
                16.ph,
                CustomContainer(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextEnum("Upload a group image (Optional)")
                                .textSM(),
                            if (state.selectedFiles.value?.isEmpty == true) ...[
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      List<CustomFile> pickFiles =
                                          state.selectedFiles.value ?? [];
                                      CustomFile? newPickFile =
                                          await CustomFilePicker()
                                              .cameraPicker();

                                      if (newPickFile != null) {
                                        if (pickFiles
                                                .where((element) =>
                                                    element.name ==
                                                    newPickFile.name)
                                                .isEmpty &&
                                            context.mounted) {
                                          pickFiles.add(newPickFile);
                                          context.read<AddNewGroupBloc>().add(
                                              UpdatePickFile(files: pickFiles));
                                        } else {
                                          PopUpItems().toastMessage(
                                              TextUtils.file_already_selected,
                                              Colors.grey);
                                        }
                                      }
                                    },
                                    child: CustomContainer(
                                        color: HexColor.fromHex(
                                            ColorConst.brand50),
                                        height: 50,
                                        width: 50,
                                        borderRadius: BorderRadius.circular(6),
                                        borderColor: HexColor.fromHex(
                                            ColorConst.lighter_baseHexColor),
                                        child: Icon(LucideIcons.focus,
                                            color: HexColor.fromHex(
                                                ColorConst.baseHexColor))),
                                  ),
                                  16.pw,
                                  GestureDetector(
                                    onTap: () async {
                                      List<CustomFile> pickFiles =
                                          state.selectedFiles.value ?? [];
                                      CustomFile? newPickFile =
                                          await CustomFilePicker()
                                              .galleryPicker();

                                      if (newPickFile != null) {
                                        if (pickFiles
                                                .where((element) =>
                                                    element.name ==
                                                    newPickFile.name)
                                                .isEmpty &&
                                            context.mounted) {
                                          pickFiles.add(newPickFile);
                                          context.read<AddNewGroupBloc>().add(
                                              UpdatePickFile(files: pickFiles));
                                        } else {
                                          PopUpItems().toastMessage(
                                              TextUtils.file_already_selected,
                                              Colors.grey);
                                        }
                                      }
                                    },
                                    child: CustomContainer(
                                        color: HexColor.fromHex(
                                            ColorConst.brand50),
                                        height: 50,
                                        width: 50,
                                        borderRadius: BorderRadius.circular(6),
                                        borderColor: HexColor.fromHex(
                                            ColorConst.lighter_baseHexColor),
                                        child: Icon(LucideIcons.images,
                                            color: HexColor.fromHex(
                                                ColorConst.baseHexColor))),
                                  ),
                                ],
                              )
                            ],
                          ],
                        ),
                      ],
                    )),
                if (state.selectedFiles.value!.isNotEmpty) ...[
                  16.ph,
                  CustomContainer(
                    height: 120,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.separated(
                        padding: const EdgeInsets.only(right: 12),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        separatorBuilder: (_, __) => 10.pw,
                        itemCount: state.selectedFiles.value?.length ?? 0,
                        itemBuilder: (_, int index) {
                          return FileView(
                            height: 120,
                            customFile:
                                state.selectedFiles.value!.elementAt(index),
                            onRemove: () {
                              context
                                  .read<AddNewGroupBloc>()
                                  .add(RemoveImageAtIndex(index: index));
                            },
                          );
                        }),
                  ),
                ],
                8.ph,
                Divider(
                    height: 0.2,
                    thickness: 0.1,
                    color: HexColor.fromHex(ColorConst.baseHexColor)),
                8.ph,
                Expanded(
                  child: CustomContainer(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextEnum("Add group members").textSM(),
                          16.ph,
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (_, __) => 4.ph,
                              itemCount: friends.length,
                              itemBuilder: (_, int index) {
                                return Row(
                                  children: [
                                    CustomCheckbox(
                                        value: state.selectedFriends.value
                                                ?.contains(
                                                    friends.elementAt(index)) ??
                                            false,
                                        onChanged: (bool? value) {
                                          List<String> data =
                                              state.selectedFriends.value ?? [];

                                          if (data.contains(
                                              friends.elementAt(index))) {
                                            data.remove(
                                                friends.elementAt(index));
                                          } else {
                                            data.add(friends.elementAt(index));
                                          }

                                          context
                                              .read<AddNewGroupBloc>()
                                              .add(SelectFriend(name: data));
                                        }),
                                    8.pw,
                                    CircularProfileImage(
                                        assetImage: AssetsConst.profile_image,
                                        radius: 20),
                                    8.pw,
                                    CustomTextEnum(friends.elementAt(index))
                                        .textSM(),
                                  ],
                                );
                              }),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomGOEButton(
                      size: Size(ScreenUtils.aw, 38),
                      radius: 6,
                      backGroundColor:
                          HexColor.fromHex(ColorConst.baseHexColor),
                      onPressed: () {
                        CustomRoute().back();
                      },
                      child: CustomTextEnum(
                        "Continue",
                        color: HexColor.fromHex(ColorConst.white),
                      ).textSM()),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
