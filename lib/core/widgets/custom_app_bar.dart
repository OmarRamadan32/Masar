import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_styles.dart';

class CustomAppbar extends StatelessWidget {
  const new({super.key, required this.canPop});
  final bool canPop;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("مسار", style: AppStyles.secondaryBold24),
                canPop
                    ? IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(
                          IconsaxPlusLinear.arrow_left_1,
                          size: 24,
                        ),
                      )
                    : const Spacer(),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.black12, thickness: 0.5),
      ],
    );
  }
}
