import 'package:flutter/material.dart';
import 'package:usercentrics_sdk/usercentrics_sdk.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewIntegrationPage extends StatefulWidget {
  const WebViewIntegrationPage({super.key});

  @override
  WebViewIntegrationPageState createState() => WebViewIntegrationPageState();
}

class WebViewIntegrationPageState extends State<WebViewIntegrationPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    // Initialize the controller
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) async {
            final userSessionData = await Usercentrics.userSessionData;
            await controller.runJavaScript("""
              window.UC_UI_USER_SESSION_DATA = $userSessionData;
              window.dispatchEvent(new Event('Usercentrics_userSessionData_injected'));
            """);
          },
        ),
      )
      ..loadFlutterAsset('assets/webview_index.html');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Webview Integration'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
