import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import './model/webview_arguments.dart';
import '../../utils/theme_config.dart';
import '../../widgets/circular_indicator.dart';
import '../../widgets/toolbar.dart';

class WebViewWidget extends StatefulWidget {
  WebViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  WebViewArgs? arguments;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)?.settings.arguments as WebViewArgs?;
    return Scaffold(
      appBar: ThemeConfig.appBar(context),
      body: SafeArea(
        child: Column(
          children: [
            ToolBar(
              title: arguments?.title ?? '',
              enableBackground: true,
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: IgnorePointer(
                      ignoring: isLoading,
                      child: WebView(
                        initialUrl: arguments?.url ?? '',
                        javascriptMode: JavascriptMode.unrestricted,
                        onPageFinished: (finish) {
                          setState(
                            () {
                              isLoading = false;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  if (isLoading)
                    Positioned.fill(
                      child: Center(
                        child: CircularIndicator(),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
