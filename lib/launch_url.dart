import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LaunchUrl extends StatefulWidget {
  const LaunchUrl({super.key});

  @override
  State<LaunchUrl> createState() => _LaunchUrlState();
}

class _LaunchUrlState extends State<LaunchUrl>
    with SingleTickerProviderStateMixin {
  bool _isSplashScreenLoading = true;
  bool _isLoading = true;
  late InAppWebViewController _webViewController;
  late AnimationController _animationController;
  final String url = 'https://pdcgroup.org/login';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _startLoadingSequence();
  }

  _startLoadingSequence() async {
    await Future.delayed(const Duration(seconds: 3));
    _animationController.stop();
    setState(() {
      _isSplashScreenLoading = false;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isSplashScreenLoading
          ? Center(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.0 + 0.1 * _animationController.value,
                    child: Image.asset(
                      'assets/pdc_payment.jpeg',
                      width: 250,
                      height: 250,
                    ),
                  );
                },
              ),
            )
          : Stack(
              children: [
                InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.parse('https://pdcgroup.org/login'),
                    // url: WebUri.uri(
                    //   Uri.parse('https://www.carwale.com/new-cars/'),
                    // ),
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    _webViewController = controller;
                  },
                  onLoadStart: (controller, url) {
                    setState(() {
                      _isLoading = true;
                    });
                  },
                  onLoadStop: (controller, url) {
                    setState(() {
                      _isLoading = false;
                    });
                  },
                ),
                Visibility(
                    visible: _isLoading,
                    child: const SpinKitCircle(
                      color: Colors.grey,
                      size: 30.0,
                    )),
              ],
            ),
    );
  }
}
