import 'package:cosmocloud_test/screens/home/view/createEmployee.dart';
import 'package:cosmocloud_test/screens/home/view/employeeInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/home/bloc/homeScreenBloc.dart';
import '../../screens/home/bloc/homeScreenRepository.dart';
import '../../screens/home/view/homeScreen.dart';

// this file is only for route and navigation Screen File;
class AppRoute {
  static const String home = "home";
  static const String createEmployee = "createEmployee";
  static const String employeeDetails = "employeeDetails";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Home Screen   ---->

      case home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeScreenBloc>(
            create: (context) => HomeScreenBloc(
              homeScreenRepository: HomeScreenRepositoryImp(),
            ),
            child: const HomeScreen(),
          ),
        );

      case createEmployee:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeScreenBloc>(
            create: (context) => HomeScreenBloc(
              homeScreenRepository: HomeScreenRepositoryImp(),
            ),
            child: CreateEmployeeScreen(),
          ),
        );

      case employeeDetails:
        final empId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomeScreenBloc>(
            create: (context) => HomeScreenBloc(
              homeScreenRepository: HomeScreenRepositoryImp(),
            ),
            child: EmployeeDetailsScreen(
              empId: empId,
            ),
          ),
        );
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("Page not found"),
        ),
      );
    });
  }
}
