import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class CustomAppbar extends StatelessWidget {
  const new({super.key, required this.canPop, this.action});
  final bool canPop;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("مسار", style: AppStyles.secondaryBold24),
                Row(
                  children: [
                    action ?? const SizedBox.shrink(),
                    action != null ? AppSizes.w10 : const SizedBox.shrink(),
                    canPop
                        ? IconButton(
                            onPressed: () => context.pop(),
                            icon: const Icon(
                              IconsaxPlusLinear.arrow_left_1,
                              size: 24,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.black12, thickness: 0.5),
      ],
    );
  }
}
