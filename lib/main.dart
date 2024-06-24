import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/home/persentation/cubit/home_cubit.dart';
import 'features/home/persentation/views/home_view.dart';
import 'features/home_review/persentation/cubit/expense_cubit.dart';
import 'firebase_options.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<HomeCubit>()),
        BlocProvider(
            create: (context) => sl<ExpenseCubit>()
              ..getBudgets()
              ..getTransactions()),
      ],
      child: ScreenUtilInit(
        designSize: Size(size.width, size.height),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // hoverColor: Colors.transparent,
            // highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            brightness: Brightness.dark,
          ),
          home: const HomeView(),
        ),
      ),
    );
  }
}
