import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

abstract class PopupMenuUtils {
  static void openOptions(
    BuildContext context,
    LongPressStartDetails details, {
    required String editText,
    required String deleteText,
    required VoidCallback onEdit,
    required VoidCallback onDelete,
  }) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(details.globalPosition, details.globalPosition),
      Offset.zero & overlay.size,
    );

    showMenu<String>(
      context: context,
      position: position,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      items: [
        PopupMenuItem<String>(
          value: 'edit',
          child: Row(
            children: [
              const Icon(IconsaxPlusLinear.edit_2, size: 20),
              const SizedBox(width: 8),
              Text(editText),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'delete',
          child: Row(
            children: [
              const Icon(IconsaxPlusLinear.trash, color: Colors.red, size: 20),
              const SizedBox(width: 8),
              Text(
                deleteText,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    ).then((selectedOption) {
      // الحماية: التأكد من أن الشاشة ما زالت موجودة قبل تنفيذ الـ Callbacks
      if (!context.mounted) return;

      if (selectedOption == 'edit') {
        onEdit();
      } else if (selectedOption == 'delete') {
        onDelete();
      }
    });
  }
}