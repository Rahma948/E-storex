import 'package:e_storex/core/DI/get_it.dart';
import 'package:e_storex/core/routing/app_route.dart';
import 'package:e_storex/core/routing/routes.dart';
import 'package:e_storex/core/theme/app_theme.dart';
import 'package:e_storex/feature/auth/login/logic/cubit/login_cubit.dart';
import 'package:e_storex/feature/auth/register/data/models/auth_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_links/app_links.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  late final AppLinks _appLinks;
  AppRouter get _router => widget.appRouter;

  @override
  void initState() {
    super.initState();
    _initDeepLinks();
  }

  Future<void> _initDeepLinks() async {
    _appLinks = AppLinks();

    try {
      final Uri? initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _handleDeepLink(initialUri);
        });
      }

      _appLinks.uriLinkStream.listen((Uri uri) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _handleDeepLink(uri);
        });
      });
    } catch (e) {
      debugPrint('❌ Deep link error: $e');
    }
  }

  Future<void> _handleDeepLink(Uri uri) async {
    print('🔗 Received deep link: $uri');
    if (uri.path.contains('/api/v1/Account/confirm-email')) {
      final userId = uri.queryParameters['UserId'];
      final token = uri.queryParameters['Token'];

      debugPrint('✅ UserId: $userId');
      debugPrint('✅ Token: $token');

      await Future.delayed(const Duration(milliseconds: 600));

      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.login,
          (route) => false,
        );
      }
    } else if (uri.scheme == 'estorex' &&
        uri.host == 'auth' &&
        uri.path == '/login') {
      print('🔑 Deep link to login page detected');

      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.login,
          (route) => false,
          // غيّريها للصفحة اللي عايزاها
        );
      }
    } else if (uri.scheme == 'estorex' && uri.host == 'store') {
      if (widget.navigatorKey.currentState == null) {
        await Future.delayed(const Duration(seconds: 1));
      }
      print('🔑 Deep link to Home page detected');
      final token = uri.queryParameters['token'];
      final refreshToken = uri.queryParameters['refreshToken'];
      final userName = uri.queryParameters['userName'];
      final userId = uri.queryParameters['userId'];

      if (token != null) {
        final authResponse = AuthResponseModel(
          token: token,
          refreshToken: refreshToken,
          userName: userName,
        );
        getIt<LoginCubit>().handleExternalLoginSuccess(authResponse);

        print('✅ Token: $token');
        print('✅ UserId: $userId');

        if (mounted) {
          widget.navigatorKey.currentState?.pushNamedAndRemoveUntil(
            Routes.home,
            (route) => false,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
         return MaterialApp(
  navigatorKey: widget.navigatorKey,
  debugShowCheckedModeBanner: false,
  theme: AppTheme.lightTheme(context),
  darkTheme: AppTheme.darkTheme(context),
  themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
  onGenerateRoute: _router.generateRoute,
  initialRoute: Routes.home,
);

      },
    );
  }
}
