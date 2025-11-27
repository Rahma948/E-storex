import 'package:dio/dio.dart';
import 'package:e_storex/core/networking/dio_factory.dart';
import 'package:e_storex/core/networking/estorex_api_service.dart';
import 'package:e_storex/feature/auth/forgetPass/data/repo/forget_pass_repo.dart';
import 'package:e_storex/feature/auth/forgetPass/logic/cubit/forget_password_cubit.dart';
import 'package:e_storex/feature/auth/login/data/repos/login_repo.dart';
import 'package:e_storex/feature/auth/login/logic/cubit/login_cubit.dart';
import 'package:e_storex/feature/auth/register/data/register_repo.dart';
import 'package:e_storex/feature/auth/register/logic/cubit/register_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());
  getIt.registerLazySingleton<EstorexApiService>(
    () => EstorexApiService(getIt<Dio>()),
  );

  // ✅ Repos Lazy
  getIt.registerLazySingleton<RegisterRepo>(
    () => RegisterRepo(getIt<EstorexApiService>()),
  );
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(getIt<EstorexApiService>()),
  );
  getIt.registerLazySingleton<ForgetPassRepo>(
    () => ForgetPassRepo(getIt<EstorexApiService>()),
  );

  // ✅ Cubits Factories
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterRepo>()),
  );
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  getIt.registerFactory<ForgetPasswordCubit>(
    () => ForgetPasswordCubit(getIt<ForgetPassRepo>()),
  );
}
