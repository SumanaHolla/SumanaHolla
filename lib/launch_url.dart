import 'dart:math';

import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'main.dart';

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
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     title: Container(
    //         width: double.infinity,
    //         //color: Colors.red,
    //         child: CircularMenu(
    //           items: [
    //             CircularMenuItem(
    //               boxShadow: [],
    //               iconSize: 20,
    //               color: Colors.red,
    //               icon: Icons.logout, // Logout icon
    //               onTap: () {
    //                 _webViewController.clearCache();
    //                 Navigator.pushReplacement(
    //                   context,
    //                   MaterialPageRoute(
    //                       builder: (BuildContext context) => const MyApp()),
    //                 );
    //               },
    //             ),
    //           ],
    //         )
    //         // Row(
    //         //   mainAxisAlignment: MainAxisAlignment.end,
    //         //   children: [
    //         //     CircularMenuItem(
    //         //       boxShadow: [],
    //         //       iconSize: 20,
    //         //       color: Colors.red,
    //         //       icon: Icons.logout, // Logout icon
    //         //       onTap: () {
    //         //         _webViewController.clearCache();
    //         //         Navigator.pushReplacement(
    //         //           context,
    //         //           MaterialPageRoute(
    //         //               builder: (BuildContext context) => const MyApp()),
    //         //         );
    //         //       },
    //         //     ),
    //         //     CircularMenuItem(
    //         //       boxShadow: [],
    //         //       iconSize: 20,
    //         //       color: Colors.red,
    //         //       icon: Icons.refresh, // Refresh icon
    //         //       onTap: () {
    //         //         Navigator.pushReplacement(
    //         //           context,
    //         //           MaterialPageRoute(
    //         //               builder: (BuildContext context) => const MyApp()),
    //         //         );
    //         //       },
    //         //     ),
    //         //   ],
    //         // ),
    //         ),
    //   ),
    //   body: _isSplashScreenLoading
    //       ? Center(
    //           child: AnimatedBuilder(
    //             animation: _animationController,
    //             builder: (context, child) {
    //               return Transform.scale(
    //                 scale: 1.0 + 0.1 * _animationController.value,
    //                 child: Image.asset(
    //                   'assets/pdc_payment.jpeg',
    //                   width: 250,
    //                   height: 250,
    //                 ),
    //               );
    //             },
    //           ),
    //         )
    //       : SafeArea(
    //           top: true,
    //           child: Stack(
    //             children: [
    //               InAppWebView(
    //                 initialUrlRequest: URLRequest(
    //                   url: Uri.parse('https://pdcgroup.org/login'),
    //                 ),
    //                 onWebViewCreated: (InAppWebViewController controller) {
    //                   _webViewController = controller;
    //                 },
    //                 onLoadStart: (controller, url) {
    //                   setState(() {
    //                     _isLoading = true;
    //                   });
    //                 },
    //                 onLoadStop: (controller, url) {
    //                   setState(() {
    //                     _isLoading = false;
    //                   });
    //                 },
    //               ),
    //               Visibility(
    //                   visible: _isLoading,
    //                   child: const SpinKitCircle(
    //                     color: Colors.grey,
    //                     size: 30.0,
    //                   )),
    //             ],
    //           ),
    //         ),
    // );
    // return Scaffold(
    //   body: SafeArea(
    //     top: true,
    //     child: CircularMenu(
    //       toggleButtonSize: 30,
    //       startingAngleInRadian: 0.8 * pi,
    //       endingAngleInRadian: 1 * pi,
    //       //radius: 2,
    //       alignment: Alignment.topRight,
    //       backgroundWidget: _isSplashScreenLoading
    //           ? Center(
    //               child: AnimatedBuilder(
    //                 animation: _animationController,
    //                 builder: (context, child) {
    //                   return Transform.scale(
    //                     scale: 1.0 + 0.1 * _animationController.value,
    //                     child: Image.asset(
    //                       'assets/pdc_payment.jpeg',
    //                       width: 250,
    //                       height: 250,
    //                     ),
    //                   );
    //                 },
    //               ),
    //             )
    //           : Stack(
    //               children: [
    //                 InAppWebView(
    //                   initialUrlRequest: URLRequest(
    //                     url: Uri.parse('https://pdcgroup.org/login'),
    //                   ),
    //                   onWebViewCreated: (InAppWebViewController controller) {
    //                     _webViewController = controller;
    //                   },
    //                   onLoadStart: (controller, url) {
    //                     setState(() {
    //                       _isLoading = true;
    //                     });
    //                   },
    //                   onLoadStop: (controller, url) {
    //                     setState(() {
    //                       _isLoading = false;
    //                     });
    //                   },
    //                 ),
    //                 Visibility(
    //                     visible: _isLoading,
    //                     child: const SpinKitCircle(
    //                       color: Colors.grey,
    //                       size: 50.0,
    //                     )),
    //               ],
    //             ),
    //       items: [
    //         CircularMenuItem(
    //           boxShadow: [],
    //           iconSize: 20,
    //           color: Colors.red,
    //           icon: Icons.refresh, // Logout icon
    //           onTap: () {
    //             Navigator.pushReplacement(
    //               context,
    //               MaterialPageRoute(
    //                   builder: (BuildContext context) => const MyApp()),
    //             );
    //           },
    //         ),
    //         CircularMenuItem(
    //           boxShadow: [],
    //           iconSize: 20,
    //           color: Colors.red,
    //           icon: Icons.logout, // Logout icon
    //           onTap: () {
    //             _webViewController.clearCache();
    //             Navigator.pushReplacement(
    //               context,
    //               MaterialPageRoute(
    //                   builder: (BuildContext context) => const MyApp()),
    //             );
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      body: SafeArea(
        top: true,
        child: _isSplashScreenLoading
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
            : CircularMenu(
                toggleButtonSize: 30,
                startingAngleInRadian: 0.8 * pi,
                endingAngleInRadian: 1 * pi,
                alignment: Alignment.topRight,
                backgroundWidget: Stack(
                  children: [
                    InAppWebView(
                      initialUrlRequest: URLRequest(
                        url: Uri.parse('https://pdcgroup.org/login'),
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
                          size: 50.0,
                        )),
                  ],
                ),
                items: [
                  CircularMenuItem(
                    boxShadow: [],
                    iconSize: 20,
                    color: Colors.red,
                    icon: Icons.refresh,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const MyApp()),
                      );
                    },
                  ),
                  CircularMenuItem(
                    boxShadow: [],
                    iconSize: 20,
                    color: Colors.red,
                    icon: Icons.logout,
                    onTap: () {
                      _webViewController.clearCache();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const MyApp()),
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
