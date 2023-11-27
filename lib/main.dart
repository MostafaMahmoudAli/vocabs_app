import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vocabs_note/bloc_observer.dart';
import 'package:vocabs_note/features/layout/presentation/cubits/write_word_cubit/write_word_cubit.dart';
import 'config/app_theme.dart';
import 'core/app_strings.dart';
import 'features/layout/data/model/word_type_adapter.dart';
import 'features/layout/presentation/cubits/read_word_cubit/read_word_cubit.dart';
import 'features/layout/presentation/view/layout_screen.dart';
import 'injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(WordTypeAdapter());
  await Hive.openBox(AppStrings.wordsBox);
  injectorSetUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>ReadWordCubit()..fetchWords()),
        BlocProvider(create: (context)=>WriteWordCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, _) {
          return GestureDetector(
            onTap: ()
            {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus)
              {
                currentFocus.unfocus();
              }
            },
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: LayOutScreen(),
              theme: AppTheme.appTheme(),
            ),
          );
        },
      ),
    );
  }
}
