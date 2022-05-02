import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import '../Utils.dart';
import '../constants/app_strings.dart';
import '../models/response/app_errors.dart';
import '../routes.dart';

mixin ResponseHelper {
  static T? getResponse<T>(Response<T> response) {
    final status = response.status;

    if (status.isOk) {
      return response.body!;
    }

    if (status.isServerError) {
      showError(ApiError());
    } else if (status.isUnauthorized) {
      showError(UnAuthorizeError());
    } else if (status.code == HttpStatus.requestTimeout) {
      showError(TimeoutError());
    } else {
      try {
        final errorBody = jsonDecode(response.bodyString!);

        showError(
          ApiError(
            message:
                errorBody["message"]?.toString() ?? AppStrings.unknownError,
          ),
        );
      } on FormatException catch (e) {
        showError(
          ApiError(message: e.toString()
              //?? AppStrings.unknownError,
              ),
        );
      }
    }

    return null;
  }

  static showError<T>(AppErrors errors) {
    Utils.showDialog(
      errors.message,
      errors is UnAuthorizeError
          ? () => Get.toNamed(Routes.dashboard)
          : () => Get.back(),
    );
  }
}
