import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExternalLoginWebView extends StatefulWidget {
  final String initialUrl;

  const ExternalLoginWebView({super.key, required this.initialUrl});

  @override
  State<ExternalLoginWebView> createState() => _ExternalLoginWebViewState();
}

class _ExternalLoginWebViewState extends State<ExternalLoginWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // تهيئة الـ WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            print('Started loading: $url');
          },
          onPageFinished: (url) {
            print('Finished loading: $url');
          },
          onNavigationRequest: (request) {
            // لو الديب لينك بتاع الأبلكيشن وصل
            if (request.url.startsWith('estorex://')) {
              Navigator.pop(context, request.url); // ارجع باللينك
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.initialUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("External Login")),
      body: WebViewWidget(controller: _controller),
    );
  }
}
