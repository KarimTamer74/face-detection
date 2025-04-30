// import 'package:chatbot_app/utils/app_colors.dart';
// import 'package:chatbot_app/utils/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// ThemeData getDarkTheme() {
//   return ThemeData(
//     navigationBarTheme: NavigationBarThemeData(
//         overlayColor:
//             WidgetStatePropertyAll(AppColors.kdarkBlueColor.withOpacity(.2)),
//         labelTextStyle: WidgetStatePropertyAll(Styles.textStyleBold14),
//         iconTheme: WidgetStatePropertyAll(
//             IconThemeData(size: 26.sp, color: AppColors.kIndigoShade400)),
//         indicatorColor: AppColors.kdarkBlueColor.withOpacity(.1),
//         backgroundColor: AppColors.kBlueColor.withOpacity(0.05),
//         labelBehavior: NavigationDestinationLabelBehavior.alwaysShow),
//     textSelectionTheme: TextSelectionThemeData(
//       cursorColor: AppColors.kdeepPurple,
//     ),
//     dialogTheme: DialogTheme(
//       iconColor: AppColors.kLightBlue,
//       backgroundColor: AppColors.kdarkGreyColor,
//       titleTextStyle: Styles.textStyleBold22,
//       contentTextStyle: Styles.greyTextStyle16,
//     ),
//     drawerTheme: DrawerThemeData(elevation: 0, width: 300.w,),
//     listTileTheme: ListTileThemeData(
//       contentPadding: EdgeInsets.zero,
//       iconColor: AppColors.kWhiteColor,
//       textColor: AppColors.kWhiteColor,
//       subtitleTextStyle: Styles.greyTextStyle16,
//       titleTextStyle: Styles.textStyle18,
//     ),
//     appBarTheme: AppBarTheme(
//       elevation: 0,
//       centerTitle: true,
//       backgroundColor: AppColors.kIndigoShade900,
//       titleTextStyle: Styles.textStyleBold24,
//       iconTheme: IconThemeData(size: 26.sp, color: AppColors.kWhiteColor),
//     ),
//     primaryColorDark: AppColors.kPrimaryColor,
//     scaffoldBackgroundColor: AppColors.kBlackColor,
//     brightness: Brightness.dark,
//     colorScheme: ColorScheme.fromSeed(
//         seedColor: AppColors.kWhiteColor, brightness: Brightness.dark),
//     snackBarTheme: SnackBarThemeData(
//       contentTextStyle:
//           Styles.textStyle18.copyWith(color: AppColors.kBlackColor),
//       backgroundColor: AppColors.kGreyColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       behavior: SnackBarBehavior.floating,
//       width: double.infinity / 2,
//       insetPadding: const EdgeInsets.all(8.0),
//     ),
//     textTheme: TextTheme(
//       bodyLarge: TextStyle(color: AppColors.kWhiteColor),
//       bodyMedium: TextStyle(color: AppColors.kWhiteColor),
//       bodySmall: TextStyle(color: AppColors.kWhiteColor),
//       headlineLarge: TextStyle(color: AppColors.kWhiteColor),
//       headlineMedium: TextStyle(color: AppColors.kWhiteColor),
//       headlineSmall: TextStyle(color: AppColors.kWhiteColor),
//       titleLarge: TextStyle(color: AppColors.kWhiteColor),
//       titleMedium: TextStyle(color: AppColors.kWhiteColor),
//       titleSmall: TextStyle(color: AppColors.kWhiteColor),
//       labelLarge: TextStyle(color: AppColors.kWhiteColor),
//       labelMedium: TextStyle(color: AppColors.kWhiteColor),
//       labelSmall: TextStyle(color: AppColors.kWhiteColor),
//       displayLarge: TextStyle(color: AppColors.kWhiteColor),
//       displayMedium: TextStyle(color: AppColors.kWhiteColor),
//       displaySmall: TextStyle(color: AppColors.kWhiteColor),
//     ),
//     dividerTheme: DividerThemeData(
//       color: AppColors.kWhiteColor,
//     ),
//     textButtonTheme: TextButtonThemeData(
//         style: ElevatedButton.styleFrom(
//             backgroundColor: AppColors.kBlackColor,
//             foregroundColor: AppColors.kWhiteColor)),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColors.kButtonColor.withOpacity(.8),
//         minimumSize: const Size(double.infinity, 50),
//         maximumSize: const Size(double.infinity, 70),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: AppColors.kButtonColor),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: AppColors.kIndigoShade400),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: AppColors.kIndigoShade400),
//         ),
//         hintStyle: Styles.greyTextStyle16,
//         prefixIconColor: AppColors.kBlueColor,
//         labelStyle: Styles.textStyle16),
//     toggleButtonsTheme: ToggleButtonsThemeData(
//       selectedBorderColor: AppColors.kBlackColor,
//       selectedColor: AppColors.kWhiteColor,
//       color: AppColors.kWhiteColor,
//       fillColor: AppColors.kIndigoShade900,
//       borderRadius: BorderRadius.circular(50.r),
//     ),
//   );
// }
