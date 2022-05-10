import 'dart:io';

import 'package:flutter/material.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewIntegrationPage extends StatefulWidget {
  const WebViewIntegrationPage({Key? key}) : super(key: key);

  @override
  WebViewIntegrationPageState createState() => WebViewIntegrationPageState();
}

class WebViewIntegrationPageState extends State<WebViewIntegrationPage> {
  WebViewController? controller = null;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Webview Integration'),
      ),
      body: FutureBuilder<String>(
          future: Usercentrics.userSessionData,
          builder: (context, snapshot) {
            final userSessionData = snapshot.data;
            if (userSessionData == null) return const SizedBox();
            return WebView(
              onWebViewCreated: (WebViewController controller) async {
                this.controller = controller;
                await controller.loadFlutterAsset(
                    'assets/webview_index.html'); // loadUrl or whatever
              },
              onPageFinished: (String url) async {
                await controller?.runJavascript("""
                window.UC_UI_USER_SESSION_DATA = $userSessionData;
                window.dispatchEvent(new Event('Usercentrics_userSessionData_injected'));
                """);
              },
              javascriptMode: JavascriptMode.unrestricted,
              debuggingEnabled: true,
            );
          }),
    );
  }
}
