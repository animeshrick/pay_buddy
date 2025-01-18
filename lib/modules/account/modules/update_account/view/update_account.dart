import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pay_buddy/const/color_const.dart';
import 'package:pay_buddy/data/bloc_data_model/dynamic_data.dart';
import 'package:pay_buddy/data/model/user_model.dart';
import 'package:pay_buddy/extension/hex_color.dart';
import 'package:pay_buddy/extension/spacing.dart';
import 'package:pay_buddy/widget/app_bar.dart';
import 'package:pay_buddy/widget/custom_button.dart';
import 'package:pay_buddy/widget/custom_text.dart';
import 'package:pay_buddy/widget/custom_text_formfield.dart';
import 'package:pay_buddy/widget/custom_ui.dart';
import 'package:pay_buddy/widget/loading_widget.dart';

import '../../../../../utils/text_utils.dart';
import '../bloc/update_account_bloc.dart';

class UpdateAccount extends StatefulWidget {
  const UpdateAccount({super.key});

  @override
  State<UpdateAccount> createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController userName = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateAccountBloc(),
      child: BlocBuilder<UpdateAccountBloc, UpdateAccountState>(
        builder: (context, state) {
          return Scaffold(
            appBar: CustomAppbar(
              title: "Update Account",
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CustomGOEButton(
                  radius: 6,
                  backGroundColor: HexColor.fromHex(ColorConst.baseHexColor),
                  onPressed: () {
                    UserModel user = UserModel(
                      fname: name.text.split(" ").first,
                      lname: name.text.split(" ").last,
                      email: email.text,
                      dob: dob.text,
                      phone: phone.text,
                    );

                    bool? validateForm = formKey.currentState?.validate();
                    if (validateForm == true) {
                      context
                          .read<UpdateAccountBloc>()
                          .add(UpdatingAccount(user: user));
                      Navigator.of(context).pop("updated");
                    }
                  },
                  child: state.updatedUser.status == Status.loading
                      ? LoadingWidget(
                          height: 30,
                          width: 30,
                        )
                      : CustomTextEnum("Update").textMediumSM()),
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: userName,
                      hintText: TextUtils.enter_userName,
                      label: TextUtils.enter_userName,
                      keyboardType: TextInputType.text,
                      errorText: null,
                      /*validator: (value) {
                        if (Validator()
                                .onlyNameValidator(value: value, msg: '') !=
                            null) {
                          return '';
                        }
                        return null;
                      },*/
                    ),
                    16.ph,
                    CustomTextFormField(
                      controller: name,
                      hintText: TextUtils.enter_full_name,
                      label: TextUtils.enter_full_name,
                      keyboardType: TextInputType.text,
                      errorText: null,
                      /*validator: (value) {
                        if (Validator()
                                .onlyNameValidator(value: value, msg: '') !=
                            null) {
                          return '';
                        }
                        return null;
                      },*/
                    ),
                    16.ph,
                    CustomTextFormField(
                      controller: email,
                      hintText: TextUtils.enter_email,
                      label: TextUtils.enter_email,
                      keyboardType: TextInputType.emailAddress,
                      errorText: null,
                      enabled: false,
                      /*validator: (value) {
                        if (Validator().emailValidator(value) != null) {
                          return '';
                        }
                        return null;
                      },*/
                    ),
                    16.ph,
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            controller: phone,
                            hintText: TextUtils.enter_phone_number,
                            label: TextUtils.enter_phone_number,
                            keyboardType: TextInputType.number,
                            errorText: null,
                            /*validator: (value) {
                              if (Validator().phoneNumberValidator(value) !=
                                  null) {
                                return '';
                              }
                              return null;
                            },*/
                          ),
                        ),
                        16.pw,
                        Expanded(
                          child: CustomTextFormField(
                            controller: dob,
                            hintText: TextUtils.enter_dob,
                            label: TextUtils.enter_dob,
                            keyboardType: TextInputType.number,
                            errorText: null,
                            /*validator: (value) {
                              if (Validator().dobValidator(value: value) !=
                                  null) {
                                return '';
                              }
                              return null;
                            },*/
                          ),
                        ),
                      ],
                    ),
                    16.ph,
                    CustomContainer(
                        child: Row(
                      children: [
                        CustomTextEnum("Choose an profile image").textSM(),
                        16.pw,
                        CustomIconButton(
                            padding: const EdgeInsets.all(10),
                            icon: const Icon(LucideIcons.image),
                            onPressed: () {}),
                        4.pw,
                        CustomIconButton(
                            padding: const EdgeInsets.all(10),
                            icon: const Icon(LucideIcons.folder),
                            onPressed: () {}),
                      ],
                    )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
