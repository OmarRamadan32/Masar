import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_app_bar.dart';

class CustomScreen extends StatelessWidget {
  const new({
    super.key,
    required this.canPop,
    required this.child,
    this.action,
  });
  final bool canPop;
  final Widget child;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(canPop: canPop, action: action),
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
