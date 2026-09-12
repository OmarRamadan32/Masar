import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_app_bar.dart';

class CustomScreen extends StatelessWidget {
  const new({super.key, required this.canPop, required this.child});
  final bool canPop;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppbar(canPop: canPop),
        canPop != true ? AppSizes.h10 : const SizedBox.shrink(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: child,
          ),
        ),
      ],
    );
  }
}
