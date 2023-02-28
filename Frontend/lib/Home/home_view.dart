import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../Util/ui_helpers.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                // The Body
                children: [
                  // The Title
                  Container(
                    child: const Text(
                      "BLIND.AI",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  verticalSpaceMedium,
                  // The Menus
                  GestureDetector(
                    onLongPress: model.onTapOne,
                    onHorizontalDragEnd: (DragEndDetails details) {
                      if (details.primaryVelocity! > 0) {
                        model.onTapThree();
                      } else if (details.primaryVelocity! < 0) {
                        model.onTapFour();
                      }
                    },
                    onVerticalDragEnd: (DragEndDetails details) {
                      if (details.primaryVelocity! < 0) {
                        model.onTapTwo();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      margin: const EdgeInsets.symmetric(vertical: 40),
                      width: screenWidth(context),
                      height: 400,
                      decoration: const BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                              size: 50,
                            ),
                            verticalSpaceMedium,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                horizontalSpaceMedium,
                                Icon(
                                  Icons.circle_rounded,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                horizontalSpaceMedium,
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ],
                            ),
                            verticalSpaceMedium,
                            Image.asset(
                              "assets/icons/logo_pic.png",
                              scale: 30,
                            ),
                            // const Text(
                            //   "🕶️",
                            //   style:
                            //       TextStyle(color: Colors.white, fontSize: 40),
                            // ),
                            // const Icon(
                            //   Icons.arrow_upward,
                            //   color: Colors.black,
                            //   size: 50,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: screenHeight(context) - 200,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       // The Feature 1
                  //       Expanded(
                  //         child: GestureDetector(
                  //           onLongPress: model.onTapOne,
                  //           onHorizontalDragEnd: (DragEndDetails details) {
                  //             if (details.primaryVelocity! > 0) {
                  //               model.onTapThree();
                  //             } else if (details.primaryVelocity! < 0) {
                  //               model.onTapFour();
                  //             }
                  //           },
                  //           onVerticalDragEnd: (DragEndDetails details) {
                  //             if (details.primaryVelocity! < 0) {
                  //               model.onTapTwo();
                  //             }
                  //           },
                  //           child: Container(
                  //             padding: const EdgeInsets.symmetric(vertical: 20),
                  //             margin: const EdgeInsets.symmetric(vertical: 40),
                  //             width: screenWidth(context),
                  //             //height: 400,
                  //             decoration: const BoxDecoration(
                  //                 color: Colors.black, shape: BoxShape.circle),
                  //             child: Center(
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   const Icon(
                  //                     Icons.arrow_upward,
                  //                     color: Colors.white,
                  //                     size: 50,
                  //                   ),
                  //                   verticalSpaceMedium,
                  //                   Row(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.center,
                  //                     children: const [
                  //                       Icon(
                  //                         Icons.arrow_back,
                  //                         color: Colors.white,
                  //                         size: 50,
                  //                       ),
                  //                       horizontalSpaceMedium,
                  //                       Icon(
                  //                         Icons.circle_rounded,
                  //                         color: Colors.white,
                  //                         size: 50,
                  //                       ),
                  //                       horizontalSpaceMedium,
                  //                       Icon(
                  //                         Icons.arrow_forward,
                  //                         color: Colors.white,
                  //                         size: 50,
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   verticalSpaceRegular,
                  //                   const Icon(
                  //                     Icons.arrow_upward,
                  //                     color: Colors.black,
                  //                     size: 50,
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       //verticalSpaceSmall,
                  //
                  //       // The Feature 2
                  //       //       Expanded(
                  //       //         child: GestureDetector(
                  //       //           onTap: model.onTapTwo,
                  //       //           onDoubleTap: model.onDoubleTapTwo,
                  //       //           child: Container(
                  //       //             padding: const EdgeInsets.symmetric(vertical: 20),
                  //       //             width: screenWidth(context),
                  //       //             color: Colors.black,
                  //       //             child: const Center(
                  //       //               child: Text(
                  //       //                 "Read Text",
                  //       //                 style: TextStyle(
                  //       //                   color: Colors.white,
                  //       //                   fontSize: 40,
                  //       //                 ),
                  //       //               ),
                  //       //             ),
                  //       //           ),
                  //       //         ),
                  //       //       ),
                  //       //       verticalSpaceSmall,
                  //       //
                  //       //       // The Feature 3
                  //       //       Expanded(
                  //       //         child: GestureDetector(
                  //       //           onTap: model.onTapThree,
                  //       //           onDoubleTap: model.onDoubleTapThree,
                  //       //           child: Container(
                  //       //             padding: const EdgeInsets.symmetric(vertical: 20),
                  //       //             width: screenWidth(context),
                  //       //             color: Colors.black,
                  //       //             child: const Center(
                  //       //               child: Text(
                  //       //                 "Detect Object",
                  //       //                 style: TextStyle(
                  //       //                   color: Colors.white,
                  //       //                   fontSize: 40,
                  //       //                 ),
                  //       //               ),
                  //       //             ),
                  //       //           ),
                  //       //         ),
                  //       //       ),
                  //       //       verticalSpaceSmall,
                  //       //
                  //       //       // The Feature 4
                  //       //       Expanded(
                  //       //         child: GestureDetector(
                  //       //           onTap: model.onTapFour,
                  //       //           onDoubleTap: model.onDoubleTapFour,
                  //       //           child: Container(
                  //       //             padding: const EdgeInsets.symmetric(vertical: 20),
                  //       //             width: screenWidth(context),
                  //       //             color: Colors.black,
                  //       //             child: const Center(
                  //       //               child: Text(
                  //       //                 "Check Currency",
                  //       //                 style: TextStyle(
                  //       //                   color: Colors.white,
                  //       //                   fontSize: 40,
                  //       //                 ),
                  //       //               ),
                  //       //             ),
                  //       //           ),
                  //       //         ),
                  //       //       ),
                  //       verticalSpaceSmall,
                  //     ],
                  //   ),
                  // ),

                  const Spacer(),

                  SizedBox(
                    height: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: model.isLoading == true
                              ? const LinearProgressIndicator(
                                  color: Colors.black,
                                  backgroundColor: Colors.black38,
                                )
                              : Container(),
                        ),

                        //const Spacer(),

                        // The Voice Button
                        GestureDetector(
                          onTap: model.onTapVoice,
                          onDoubleTap: model.onDoubleTapVoice,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            width: screenWidth(context),
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: const Center(
                              child: Icon(
                                Icons.mic,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  verticalSpaceSmall,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
