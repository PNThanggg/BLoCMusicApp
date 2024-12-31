import 'package:flutter/material.dart';

import '../presentation/theme/app_color.dart';

abstract class SnackBarService {
  const SnackBarService();

  static final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showMessage(
    String message, {
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 2),
    bool loading = false,
  }) {
    messengerKey.currentState!.removeCurrentSnackBar();
    messengerKey.currentState!.showSnackBar(
      SnackBar(
        content: loading
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    message,
                    style: const TextStyle(
                      color: AppColor.primaryColor1,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColor.primaryColor1,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Text(
                message,
                style: const TextStyle(
                  color: AppColor.primaryColor1,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
        duration: loading ? const Duration(minutes: 1) : duration,
        showCloseIcon: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        closeIconColor: AppColor.primaryColor1,
        elevation: 0,
        action: action,
        backgroundColor: const Color.fromARGB(255, 16, 15, 15),
      ),
    );
  }
}
