import 'package:flutter/material.dart';

abstract class Alerts {
  static void showSucess(BuildContext context,
      {required double height,
      required double width,
      required String message,
      int? seconds}) {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: seconds ?? 2), () {
            Navigator.pop(context);
          });
          return Dialog(
            child: SizedBox(
              height: height,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.check, color: Colors.green, size: 40),
                  Text(
                    message,
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          );
        });
  }

  static void showError(BuildContext context,
      {required double height,
      required String message,
      required double width,
      int? seconds}) {
    Future.delayed(Duration(seconds: seconds ?? 2), () {
      Navigator.pop(context);
    });
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SizedBox(
              height: height,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline_rounded,
                        color: Colors.red, size: 40),
                    Text(
                      message,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ]),
            ),
          );
        });
  }
}
