import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:masar/features/notes/presentation/widgets/note_card.dart';

class NotesGridView extends StatelessWidget {
  const NotesGridView({super.key});

  static const List<String> texts = [
    "التأكد من تفاصيل حجز الطيران، مراجعة تأكيد الفندق، وإعداد قائمة الأماكن السياحية المخطط لزيارتها",
    "18 جرام بن بدرجة طحن متوسطة، 300 مل ماء عند درجة حرارة 92 مئوية",
    "إضافة دعم للوضع الداكن (Dark Mode)، ميزة تصدير البيانات بصيغة PDF، وتفعيل التذكيرات الذكية.",
    'لا يوجد محتوي',
  ];

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2, 
      mainAxisSpacing: 10, 
      crossAxisSpacing: 10, 
      itemCount: texts.length,
      itemBuilder: (context, index) {
        return NoteCard(text: texts[index]);
      },
    );
  }
}
