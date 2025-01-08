import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pay_buddy/const/color_const.dart';
import 'package:pay_buddy/extension/hex_color.dart';
import 'package:pay_buddy/extension/spacing.dart';
import 'package:pay_buddy/service/value_handler.dart';
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

class AddNewGroup extends StatelessWidget {
  const AddNewGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNewGroupBloc(),
      child: BlocBuilder<AddNewGroupBloc, AddNewGroupState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: CustomTextEnum("Add a new group").textMediumSM(),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextFormField(
                    label: "Group Name",
                  ),
                  16.ph,
                  CustomContainer(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextEnum("Upload a group image (Optional)")
                              .textSM(),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  List<CustomFile> pickFiles =
                                      state.selectedFiles.value ?? [];
                                  CustomFile? newPickFile =
                                      await CustomFilePicker().cameraPicker();

                                  if (newPickFile != null) {
                                    if (pickFiles
                                            .where((element) =>
                                                element.name ==
                                                newPickFile.name)
                                            .isEmpty &&
                                        context.mounted) {
                                      pickFiles.add(newPickFile);
                                      context
                                          .read<AddNewGroupBloc>()
                                          .add(UpdatePickFile(files: pickFiles));
                                    } else {
                                      PopUpItems().toastMessage(
                                          TextUtils.file_already_selected,
                                          Colors.grey);
                                    }
                                  }
                                },
                                child: CustomContainer(
                                    color: HexColor.fromHex(ColorConst.brand50),
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
                                      await CustomFilePicker().galleryPicker();

                                  if (newPickFile != null) {
                                    if (pickFiles
                                        .where((element) =>
                                    element.name ==
                                        newPickFile.name)
                                        .isEmpty &&
                                        context.mounted) {
                                      pickFiles.add(newPickFile);
                                      context
                                          .read<AddNewGroupBloc>()
                                          .add(UpdatePickFile(files: pickFiles));
                                    } else {
                                      PopUpItems().toastMessage(
                                          TextUtils.file_already_selected,
                                          Colors.grey);
                                    }
                                  }
                                },
                                child: CustomContainer(
                                    color: HexColor.fromHex(ColorConst.brand50),
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
                          ),
                        ],
                      ),
                    ],
                  )),
                  16.ph,
                  if (state.selectedFiles.value != null &&
                      state.selectedFiles.value!.isNotEmpty) ...[
                    10.ph,
                    SizedBox(
                      height: 140,
                      child: ListView.separated(
                          padding: const EdgeInsets.only(right: 12),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          separatorBuilder: (_, __) => 10.pw,
                          itemCount:
                          state.selectedFiles.value?.length ?? 0,
                          itemBuilder: (_, int index) {
                            return FileView(
                              height: 120,
                              width: 100,
                              customFile: state.selectedFiles.value!
                                  .elementAt(index),
                              onRemove: () {
                                context.read<AddNewGroupBloc>().add(
                                    RemoveImageAtIndex(index: index));
                              },
                            );
                          }),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
