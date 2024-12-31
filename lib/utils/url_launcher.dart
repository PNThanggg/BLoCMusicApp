import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

Future<void> appLaunchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    log('Could not launch $url', name: "launch_Url");
  }
}
