import 'package:bloc/bloc.dart';
import 'package:e_storex/feature/auth/forgetPass/data/models/forget_pass_model.dart';
import 'package:e_storex/feature/auth/forgetPass/data/repo/forget_pass_repo.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPassRepo) : super(ForgetPasswordInitial());
  final ForgetPassRepo forgetPassRepo;
  void forgetPassword(ForgetPassModel forgetPassModel) async {
    emit(ForgetPasswordLoading());
    final result = await forgetPassRepo.forgetPassword(forgetPassModel);
    if (result.isSuccess) {
      emit(ForgetPasswordSuccess());
    } else {
      emit(
        ForgetPasswordFailure(
          result.error!.message ?? 'An unknown error occurred',
        ),
      );
    }
  }
}
