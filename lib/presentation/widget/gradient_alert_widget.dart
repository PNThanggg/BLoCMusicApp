import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class GradientDialog extends StatefulWidget {
  final String message;
  final Future<void> Function(String)? onOk;
  final String? okText;
  final String downloadURL;

  const GradientDialog(
    this.message, {
    this.onOk,
    this.okText,
    required this.downloadURL,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _GradientDialogState();
}

class _GradientDialogState extends State<GradientDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          height: 200.0,
          constraints: const BoxConstraints(),
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.pink,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  right: 8,
                  left: 8,
                  bottom: 10,
                ),
                child: Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "ReThink-Sans",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "ReThink-Sans",
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (widget.onOk != null) {
                        widget.onOk!(widget.downloadURL);
                      }
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColor.accentColor1,
                      side: const BorderSide(color: AppColor.accentColor1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      widget.okText ?? "OK",
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "ReThink-Sans",
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
