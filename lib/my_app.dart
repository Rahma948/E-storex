import 'package:e_storex/core/networking/dio_factory.dart';
import 'package:e_storex/core/networking/estorex_api_service.dart';
import 'package:e_storex/core/theme/app_theme.dart';
import 'package:e_storex/feature/auth/register/data/register_repo.dart';
import 'package:e_storex/feature/auth/register/logic/cubit/register_cubit.dart';
import 'package:e_storex/feature/auth/register/ui/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (_, __) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => RegisterCubit(
              registerRepo: RegisterRepo(
                apiService: EstorexApiService(DioFactory.getDio()),
              ),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          home: RegisterScreen(),
        ),
      ),
    );
  }
}
