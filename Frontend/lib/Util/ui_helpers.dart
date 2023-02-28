import 'package:flutter/cupertino.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceRegular = SizedBox(width: 18.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);
const Widget horizontalSpaceLarge = SizedBox(width: 50.0);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceRegular = SizedBox(height: 18.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);

//common padding
const EdgeInsets commonPadding = EdgeInsets.symmetric(horizontal: 20);

//box decorations
// BoxDecoration borderBoxOutline = BoxDecoration(
//   color: colors.white,
//   border: Border.all(
//     color: colors.kcLightGreyColor,
//     width: 1,
//   ),
//   borderRadius: BorderRadius.circular(10),
// );

// BoxDecoration topRoundedDecoration = BoxDecoration(
//   color: colors.white,
//   borderRadius: BorderRadius.vertical(
//     top: Radius.circular(25),
//   ),
// );

// Screen Size helpers

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;

// Widget spacedDivider = Column(
//   children: const <Widget>[
//     verticalSpaceMedium,
//     const Divider(color: Colors.blueGrey, height: 5.0),
//     verticalSpaceMedium,
//   ],
// );

// Widget spacedDividerSmall = Column(
//   children: const <Widget>[
//     verticalSpaceSmall,
//     const Divider(color: Colors.blueGrey, height: 5.0),
//     verticalSpaceSmall,
//   ],
// );
//
// Widget spacedDividerTiny = Column(
//   children: const <Widget>[
//     verticalSpaceTiny,
//     const Divider(color: colors.kcLightGreyColor, height: 1.0),
//     verticalSpaceTiny,
//   ],
// );
//
// Widget spacedDividerBigTiny = Column(
//   children: const <Widget>[
//     verticalSpaceTiny,
//     const Divider(
//       color: colors.kcGreyBackground,
//       thickness: 5,
//     ),
//     verticalSpaceTiny,
//   ],
// );

Widget verticalSpace(double height) => SizedBox(height: height);

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenHeight(context) - offsetBy) / dividedBy;

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0}) =>
    (screenWidth(context) - offsetBy) / dividedBy;

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);
