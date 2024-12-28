import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/color_const.dart';
import '../data/model/custom_file.dart';
import '../extension/hex_color.dart';
import 'custom_button.dart';
import 'custom_image.dart';
import 'custom_text.dart';
import 'custom_ui.dart';

class FileView extends StatelessWidget {
  const FileView(
      {super.key,
      required this.customFile,
      this.height = 120,
      this.width = 100,
      required this.onRemove});

  final CustomFile customFile;

  final double height, width;
  final void Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: CustomContainer(
            height: height,
            width: width,
            padding: const EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(6),
            borderColor: HexColor.fromHex(ColorConst.gray400),
            child: customFile.name?.toUpperCase().contains(".PDF") == true
                ? Column(
                    children: [
                      CustomSvgAssetImageView(
                        path: "AssetsConst.pdfIcon",
                        height: height - 42,
                        width: width,
                      ),
                      CustomTextEnum(
                        customFile.name ?? "",
                        color: HexColor.fromHex(ColorConst.primaryDark),
                        maxLines: 2,
                      ).textSemiboldXS()
                    ],
                  )
                : customFile.bytes != null
                    ? Image.memory(
                        customFile.bytes ?? Uint8List.fromList([]),
                        height: height,
                        width: width,
                      )
                    : customFile.path != null
                        ? Image.file(
                            File(customFile.path ?? ""),
                            height: height,
                            width: width,
                          )
                        : CustomAssetImageView(
                            path: "AssetsConst.ssNoImageLogo",
                            height: height,
                            width: width,
                          ),
          ),
        ),
        CustomIconButton(
          iconSize: 24,
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
          color: HexColor.fromHex(ColorConst.gray600),
          icon: const Icon(CupertinoIcons.clear_circled),
          onPressed: onRemove,
        ),
      ],
    );
  }
}

class NetworkFileView extends StatelessWidget {
  const NetworkFileView(
      {super.key,
      required this.fileUrl,
      required this.fileName,
      this.height = 120,
      this.width = 100,
      required this.onRemove});

  final String fileUrl, fileName;
  final double height, width;
  final void Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: CustomContainer(
            height: height,
            width: width,
            padding: const EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(6),
            borderColor: HexColor.fromHex(ColorConst.gray400),
            child: fileName.toUpperCase().contains(".PDF") == true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomSvgAssetImageView(
                        path: "AssetsConst.pdfIcon",
                        height: height - 56,
                        width: width,
                      ),
                      CustomTextEnum(
                        fileName,
                        color: HexColor.fromHex(ColorConst.primaryDark),
                        maxLines: 2,
                      ).textSemiboldXS()
                    ],
                  )
                : CustomNetWorkImageView(
                    url: fileUrl,
                    height: height,
                    width: width,
                  ),
          ),
        ),
        CustomIconButton(
          iconSize: 24,
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
          color: HexColor.fromHex(ColorConst.gray600),
          icon: const Icon(CupertinoIcons.clear_circled),
          onPressed: onRemove,
        ),
      ],
    );
  }
}
