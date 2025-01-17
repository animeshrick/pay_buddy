import 'package:flutter/material.dart';

import '../service/context_service.dart';

//ignore: must_be_immutable
class LoadingWidget extends StatelessWidget {
  LoadingWidget({
    super.key,
    this.height = 300,
    this.width = 300,
    this.backgroundColor = Colors.transparent,
    this.child,
  });

  double width;
  double height;
  Color? backgroundColor;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: width,
      height: height,
      child: child ?? const CircularProgressIndicator(color: Colors.white),
    );
  }
}

void showLoading() {
  showDialog(
    context: CurrentContext().context,
    builder: (context) =>
        const Center(child: CircularProgressIndicator(color: Colors.white)),
    barrierDismissible: false,
  );
}
