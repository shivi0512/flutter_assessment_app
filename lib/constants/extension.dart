import 'package:get/get.dart';
import '../Utils.dart';
import '../api/response_helper.dart';
import '../models/response/app_errors.dart';
import 'app_strings.dart';


extension FutureResult<T> on Future<Response<T>> {
  void result(Function(T) onResult) {
    then((value) {
      Utils.hideDialog();
      final result = ResponseHelper.getResponse(value);
      if (result != null) {
        onResult(result);
      }
    }
    ).catchError((error) {
      printInfo(info: 'error: ${error.toString()}');
      Utils.hideDialog();
      ResponseHelper.showError(ApiError(message: AppStrings.unknownError));
    });
  }
}