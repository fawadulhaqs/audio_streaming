import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    Factory(() => EagerGestureRecognizer())
  };

  UniqueKey _key = UniqueKey();
  // late WebViewXController webviewController;
  bool isLoading = true;
  late WebViewController webViewController;

  List<String> images = [
    "Asset/Sponser1.png",
    "Asset/Sponser2.png",
    "Asset/Sponser3.png",
    "Asset/Sponser4.png",
    "Asset/Sponser5.png",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.redAccent.shade700,
        // appBar: AppBar(
        //   backgroundColor: Colors.blue,
        // ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'Asset/Header2.jpeg',
                  height: 65,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Container(
                  height: 150,
                  color: Colors.redAccent.shade700,
                  child: Image.asset('Asset/Logo2.png'),
                ),
                Stack(
                  children: [
                    // RotatedBox(
                    //   quarterTurns: 4,
                    //   child: Center(
                    //     child: WebViewX(
                    //       width: MediaQuery.of(context).size.width - 100,
                    //       height: 400,
                    //       initialContent: "https://play.xdevel.com/12712",
                    //       // javascriptMode: JavascriptMode.,
                    //       userAgent:
                    //           "Mozilla/5.0 (Windows NT x.y; Win64; x64; rv:10.0) Gecko/20100101 Firefox/10.0",
                    //       initialSourceType: SourceType.url,
                    //       onWebViewCreated: (controller) {
                    //         this.webviewController = controller;
                    //       },
                    //       onPageFinished: (finish) {
                    //         setState(() {
                    //           isLoading = false;
                    //         });
                    //       },
                    //     ),
                    //   ),
                    // ),
                    Center(
                      child: Container(
                        height: 500,
                        width: MediaQuery.of(context).size.width-50,
                        child: WebView(
                            key: _key,
                            initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
                            allowsInlineMediaPlayback: true,
                            gestureRecognizers: gestureRecognizers,
                            javascriptMode: JavascriptMode.unrestricted,
                            userAgent:
                                "Mozilla/5.0 (Windows NT x.y; Win64; x64; rv:10.0) Gecko/20100101 Firefox/10.0",
                            initialUrl: "https://play.xdevel.com/12712",
                            onWebViewCreated: (controller) {
                              this.webViewController = controller;
                            }),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 60,
                        color: Color(0xff434343),
                        child: Center(
                          child: Text(
                            'Live From Italy',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                    // isLoading
                    //     ? Center(
                    //         child: CircularProgressIndicator(),
                    //       )
                    //     : Center(),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    var url = Uri.parse("mailto:ciao@ciaomusica.com.au");
                    await launchUrl(url);
                  },
                  child: Text(
                    'ciao@ciaomusica.com.au',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    var url = Uri.parse("http://www.ciaomusica.com.au");
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  },
                  child: Text(
                    'www.ciaomusica.com.au',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Container(
                  height: 150,
                  color: Colors.redAccent.shade700,
                  child: Image.asset(
                    'Asset/RMMEDIA.PNG',
                    width: 300,
                    height: 70,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    var url = Uri.parse("http://www.rmmediacorp.com");
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  },
                  child: Text(
                    'www.rmmediacorp.com',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    var url = Uri.parse("mailto:media@rmmediacorp.com");
                    await launchUrl(url);
                  },
                  child: Text(
                    'media@rmmediacorp.com',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                // SizedBox(
                //   height: 50,
                // ),
                // Text(
                //   'Ciao Musica',
                //   style: TextStyle(color: Colors.white, fontSize: 25),
                // ),
                // SizedBox(
                //   height: 50,
                // ),
                // Container(
                //   color: Colors.white,
                //   // height: 200,
                //   child: Column(
                //     children: [
                //       SizedBox(
                //         height: 10,
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Container(
                //             color: Colors.green,
                //             height: 20,
                //             width: MediaQuery.of(context).size.width / 3.5,
                //           ),
                //           Text(
                //             'Sponsors & Partners',
                //             style: TextStyle(fontSize: 18),
                //           ),
                //           Container(
                //             color: Colors.redAccent.shade700,
                //             height: 20,
                //             width: MediaQuery.of(context).size.width / 3.5,
                //           )
                //         ],
                //       ),
                //       SizedBox(
                //         height: 10,
                //       ),
                //       CarouselSlider(
                //         options: CarouselOptions(
                //           height: 50.0,
                //           autoPlay: true,
                //           autoPlayInterval: Duration(seconds: 4),
                //           viewportFraction: 0.3,
                //           disableCenter: false,
                //           enlargeCenterPage: false,
                //           onPageChanged: (position, reason) {
                //             print(reason);
                //             print(CarouselPageChangedReason.controller);
                //           },
                //           enableInfiniteScroll: true,
                //         ),
                //         items: images.map<Widget>((i) {
                //           return Builder(
                //             builder: (BuildContext context) {
                //               return Container(
                //                   width: MediaQuery.of(context).size.width,
                //                   decoration: BoxDecoration(
                //                       image: DecorationImage(
                //                           image: AssetImage(i))));
                //             },
                //           );
                //         }).toList(),
                //       ),
                //       SizedBox(
                //         height: 10,
                //       ),
                //       GestureDetector(
                //         onTap: () async {
                //           var url = Uri.parse("http://www.rmmediacorp.com");
                //           await launchUrl(url,
                //               mode: LaunchMode.externalApplication);
                //         },
                //         child: Container(
                //           height: 70,
                //           width: 200,
                //           child: Card(
                //             color: Color(0xffffd936),
                //             child: Center(
                //                 child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Icon(Icons.shopping_bag_outlined,
                //                     color: Color(0xff536942)),
                //                 SizedBox(width: 10),
                //                 Text(
                //                   'Website',
                //                   style: TextStyle(color: Color(0xff536942)),
                //                   textAlign: TextAlign.center,
                //                 ),
                //               ],
                //             )),
                //           ),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () async {
                //           var url =
                //               Uri.parse("mailto:studio@ciaomusica.com.au");
                //           await launchUrl(url);
                //         },
                //         child: Container(
                //           height: 70,
                //           width: 200,
                //           child: Card(
                //             color: Color(0xffffd936),
                //             child: Center(
                //                 child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 FaIcon(FontAwesomeIcons.microphoneAlt,
                //                     color: Color(0xff536942)),
                //                 SizedBox(width: 10),
                //                 Text(
                //                   'Email Studio',
                //                   style: TextStyle(color: Color(0xff536942)),
                //                   textAlign: TextAlign.center,
                //                 ),
                //               ],
                //             )),
                //           ),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () async {
                //           var url = Uri.parse("mailto:ciao@ciaomusica.com.au");
                //           await launchUrl(url);
                //         },
                //         child: Container(
                //           height: 70,
                //           width: 200,
                //           child: Card(
                //             color: Color(0xffffd936),
                //             child: Center(
                //                 child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 FaIcon(FontAwesomeIcons.mailBulk,
                //                     color: Color(0xff536942)),
                //                 SizedBox(width: 10),
                //                 Text(
                //                   'Info Email',
                //                   style: TextStyle(color: Color(0xff536942)),
                //                   textAlign: TextAlign.center,
                //                 ),
                //               ],
                //             )),
                //           ),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () async {
                //           var url = Uri.parse(
                //               "https://goo.gl/maps/YKuScuBUicAnsGHc6");
                //           await launchUrl(url,
                //               mode: LaunchMode.externalApplication);
                //         },
                //         child: Container(
                //           height: 70,
                //           width: 200,
                //           child: Card(
                //             color: Color(0xffffd936),
                //             child: Center(
                //                 child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 FaIcon(FontAwesomeIcons.addressCard,
                //                     color: Color(0xff536942)),
                //                 SizedBox(width: 10),
                //                 Text(
                //                   'Address',
                //                   style: TextStyle(color: Color(0xff536942)),
                //                   textAlign: TextAlign.center,
                //                 ),
                //               ],
                //             )),
                //           ),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () async {
                //           var url = Uri.parse("mailto:ciao@ciaomusica.com.au");
                //           await launchUrl(url);
                //         },
                //         child: Container(
                //           height: 70,
                //           width: 200,
                //           child: Card(
                //             color: Color(0xffffd936),
                //             child: Center(
                //                 child: Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 FaIcon(
                //                   FontAwesomeIcons.assistiveListeningSystems,
                //                   color: Color(0xff536942),
                //                 ),
                //                 SizedBox(width: 10),
                //                 Text(
                //                   'Feedback',
                //                   style: TextStyle(color: Color(0xff536942)),
                //                   textAlign: TextAlign.center,
                //                 ),
                //               ],
                //             )),
                //           ),
                //         ),
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           GestureDetector(
                //             onTap: () async {
                //               var url = Uri.parse(
                //                   "https://www.facebook.com/musicaciao/");
                //               await launchUrl(url,
                //                   mode: LaunchMode.externalApplication);
                //             },
                //             child: Container(
                //               height: 70,
                //               width: 70,
                //               child: Card(
                //                 color: Color(0xff3b5998),
                //                 child: Icon(
                //                   Icons.facebook,
                //                   color: Colors.white,
                //                   size: 40,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           GestureDetector(
                //             onTap: () async {
                //               var url = Uri.parse(
                //                   "https://www.youtube.com/channel/UCdIumXskixWaEZobX_WFO4w");
                //               await launchUrl(url,
                //                   mode: LaunchMode.externalApplication);
                //             },
                //             child: Container(
                //               height: 70,
                //               width: 70,
                //               child: Card(
                //                 color: Color(0xffcd201f),
                //                 child: Center(
                //                     child: FaIcon(
                //                   FontAwesomeIcons.youtube,
                //                   color: Colors.white,
                //                   size: 40,
                //                 )),
                //               ),
                //             ),
                //           ),
                //           GestureDetector(
                //             onTap: () async {
                //               var url = Uri.parse(
                //                   "http://instagram.com/ciaomusicasyd");
                //               await launchUrl(url,
                //                   mode: LaunchMode.externalApplication);
                //             },
                //             child: Container(
                //               height: 70,
                //               width: 70,
                //               child: Card(
                //                   color: Color(0xff262626),
                //                   child: Center(
                //                       child: FaIcon(
                //                     FontAwesomeIcons.instagram,
                //                     color: Colors.white,
                //                     size: 40,
                //                   ))),
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
