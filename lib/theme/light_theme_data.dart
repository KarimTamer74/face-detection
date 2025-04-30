// import 'package:chatbot_app/utils/app_colors.dart';
// import 'package:chatbot_app/utils/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// ThemeData getLightTheme() {
//   return ThemeData(
//     navigationBarTheme: NavigationBarThemeData(
//         overlayColor:
//             WidgetStatePropertyAll(AppColors.kdarkBlueColor.withOpacity(.5)),
//         labelTextStyle: WidgetStatePropertyAll(Styles.textStyleBold14),
//         iconTheme: WidgetStatePropertyAll(
//             IconThemeData(size: 26.sp, color: AppColors.kIndigoShade700)),
//         indicatorColor: AppColors.kdarkBlueColor.withOpacity(.05),
//         backgroundColor: AppColors.kBlueColor.withOpacity(0.05),
//         labelBehavior: NavigationDestinationLabelBehavior.alwaysShow),
//     textSelectionTheme: const TextSelectionThemeData(),
//     dialogTheme: DialogTheme(
//       backgroundColor: AppColors.kWhiteColor,
//       titleTextStyle:
//           Styles.textStyleBold22.copyWith(color: AppColors.kBlackColor),
//       contentTextStyle:
//           Styles.greyTextStyle16.copyWith(color: AppColors.kBlackColor),
//     ),
//     drawerTheme: DrawerThemeData(elevation: 0, width: 300.w),
//     listTileTheme: ListTileThemeData(
//       contentPadding: EdgeInsets.zero,
//       iconColor: AppColors.kBlackColor,
//       textColor: AppColors.kBlackColor,
//       titleTextStyle: Styles.textStyle18,
//       subtitleTextStyle: Styles.greyTextStyle16,
//     ),
//     appBarTheme: AppBarTheme(
//       elevation: 0,
//       centerTitle: true,
//       backgroundColor: AppColors.kIndigoShade900,
//       titleTextStyle:
//           Styles.textStyleBold24.copyWith(color: AppColors.kWhiteColor),
//       iconTheme: IconThemeData(size: 26.sp, color: AppColors.kWhiteColor),
//     ),
//     primaryColorDark: AppColors.kPrimaryColor,
//     scaffoldBackgroundColor: AppColors.kWhiteColor,
//     brightness: Brightness.light,
//     colorScheme: ColorScheme.fromSeed(
//         seedColor: AppColors.kBlackColor, brightness: Brightness.light),
//     snackBarTheme: SnackBarThemeData(
//       contentTextStyle:
//           Styles.textStyle18.copyWith(color: AppColors.kWhiteColor),
//       backgroundColor: AppColors.kBlackColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       behavior: SnackBarBehavior.floating,
//       width: double.infinity / 2,
//       insetPadding: const EdgeInsets.all(8.0),
//     ),
//     textTheme: TextTheme(
//       bodyLarge: TextStyle(color: AppColors.kBlackColor),
//       bodyMedium: TextStyle(color: AppColors.kBlackColor),
//       bodySmall: TextStyle(color: AppColors.kBlackColor),
//       headlineLarge: TextStyle(color: AppColors.kBlackColor),
//       headlineMedium: TextStyle(color: AppColors.kBlackColor),
//       headlineSmall: TextStyle(color: AppColors.kBlackColor),
//       titleLarge: TextStyle(color: AppColors.kBlackColor),
//       titleMedium: TextStyle(color: AppColors.kBlackColor),
//       titleSmall: TextStyle(color: AppColors.kBlackColor),
//       labelLarge: TextStyle(color: AppColors.kBlackColor),
//       labelMedium: TextStyle(color: AppColors.kBlackColor),
//       labelSmall: TextStyle(color: AppColors.kBlackColor),
//       displayLarge: TextStyle(color: AppColors.kBlackColor),
//       displayMedium: TextStyle(color: AppColors.kBlackColor),
//       displaySmall: TextStyle(color: AppColors.kBlackColor),
//     ),
//     dividerTheme: DividerThemeData(
//       color: AppColors.kBlackColor,
//     ),
//     textButtonTheme: TextButtonThemeData(
//         style: ElevatedButton.styleFrom(
//             backgroundColor: AppColors.kWhiteColor,
//             foregroundColor: AppColors.kBlackColor)),
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
//           borderSide: BorderSide(color: AppColors.kBlueShade900),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: AppColors.kBlueShade800),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(color: AppColors.kBlueShade800),
//         ),
//         hintStyle: Styles.greyTextStyle16,
//         prefixIconColor: AppColors.kBlueColor,
//         labelStyle: Styles.textStyle16),
//     toggleButtonsTheme: ToggleButtonsThemeData(
//       selectedBorderColor: AppColors.kBlackColor,
//       selectedColor: AppColors.kWhiteColor,
//       borderWidth: 2,
//       color: AppColors.kBlackColor,
//       fillColor: AppColors.kIndigoShade500,
//       borderRadius: BorderRadius.circular(50.r),
//     ),
//   );
// }
