import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../../../const/color_const.dart';
import '../../../../../data/bloc_data_model/dynamic_data.dart';
import '../../../../../data/model/custom_file.dart';
import '../../../../../extension/hex_color.dart';
import '../../../../../service/context_service.dart';
import '../../../../../utils/pop_up_items.dart';
import '../../../../../widget/loading_widget.dart';

part 'add_new_group_event.dart';
part 'add_new_group_state.dart';

class AddNewGroupBloc extends Bloc<AddNewGroupEvent, AddNewGroupState> {
  AddNewGroupBloc()
      : super(AddNewGroupState(
          selectedFiles: DynamicBlocData<List<CustomFile>>.init(value: []),
          selectedFriends: DynamicBlocData<List<String>>.init(value: []),
        )) {
    on<AddNewGroupEvent>((event, emit) {
      if (event is UpdatePickFile) {
        showLoading();
        emit(state.copyWith(
            selectedFiles: DynamicBlocData<List<CustomFile>>.loading()));

        // UploadReturnImageModel? uploadImageResponse =
        //     await ReturnSummeryRepo().uploadReturnImage(file: event.files);

        // if (uploadImageResponse?.status == "2000") {
        PopUpItems().toastfy(
            message: "Image uploaded successfully",
            type: ToastificationType.success,
            color: HexColor.fromHex(ColorConst.light_green));
        emit(state.copyWith(
            selectedFiles:
                DynamicBlocData<List<CustomFile>>.success(value: event.files)));
        // } else {
        //   PopUpItems().toastMessage(uploadImageResponse?.message ?? "",
        //       HexColor.fromHex(ColorConst.error500));
        //   emit(state.copyWith(
        //     uploadedImageResponse:
        //     DynamicBlocData.error(message: uploadImageResponse?.message),
        //     selectedFiles:
        //     DynamicBlocData.error(message: uploadImageResponse?.message),
        //   ));
        // }

        BuildContext context = CurrentContext().context;
        if (context.mounted) {
          Navigator.pop(context);
        }
      }

      /// Remove image at index
      else if (event is RemoveImageAtIndex) {
        List<CustomFile> imageList = state.selectedFiles.value ?? [];
        imageList.removeAt(event.index);
        emit(state.copyWith(
            selectedFiles: DynamicBlocData<List<CustomFile>>.loading()));
        emit(state.copyWith(
            selectedFiles:
                DynamicBlocData<List<CustomFile>>.success(value: imageList)));
      }

      /// add members
      else if (event is SelectFriend) {
        emit(state.copyWith(
            selectedFriends: DynamicBlocData<List<String>>.loading()));
        emit(state.copyWith(
            selectedFriends:
                DynamicBlocData<List<String>>.success(value: event.name)));
      }
    });
  }
}
