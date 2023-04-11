import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:sala_app/core/app_widgets/custom_arrow_back.dart';

class WebSiteView extends StatelessWidget {
  final String webLink;

  const WebSiteView({super.key, required this.webLink});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: CustomArrowBack(),
        ),
        body: Text(webLink) // WebView(initialUrl: webLink,)
        );
  }
}
