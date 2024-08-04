import 'package:cosmocloud_test/appTheme/appTheme.dart';
import 'package:cosmocloud_test/helper/routeDirectory/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const CosmocloudTestApp());
}

class CosmocloudTestApp extends StatefulWidget {
  // const CosmocloudTestApp({super.key});
  const CosmocloudTestApp({
    Key? key,
  }) : super(key: key);

  @override
  State<CosmocloudTestApp> createState() => _CosmocloudTestAppState();
}

class _CosmocloudTestAppState extends State<CosmocloudTestApp> {
  Locale? _locale;

  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double? screenHeight = MediaQuery.of(context).size.height;
    double? screenWidth = MediaQuery.of(context).size.width;

    return ScreenUtilInit(
      designSize: Size(screenWidth, screenHeight),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeClass.lightTheme,
        darkTheme: AppThemeClass.darkTheme,
        title: "Cosmocloud Test App",
        initialRoute: AppRoute.home,
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}
