import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar/core/di/service_locator.dart';
import 'package:masar/core/routing/app_router.dart';
import 'package:masar/core/theme/app_themes.dart';
import 'package:masar/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:masar/features/notes/presentation/cubit/notes_cubit.dart';
import 'package:intl/date_symbol_data_local.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar', null);
 await setupServiceLocator();
  runApp(const Masar());
}

class Masar extends StatelessWidget {
  const Masar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'مسار',
      theme: AppThemes.lightTheme,

      themeMode: ThemeMode.light,

      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      // we returned a media query widget to add a text scaling feature to the app
      builder: (context, child) {
        // final mediaQueryData = MediaQuery.of(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.noScaling),
            child: MultiBlocProvider(providers: [
              BlocProvider(create: (context) => getIt<CategoriesCubit>(),),
              BlocProvider(create: (context) => getIt<NotesCubit>(),),
            ], child: child!)
          ),
        );
      },
    );
  }
}
