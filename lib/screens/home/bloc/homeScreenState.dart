// ignore_for_file: file_names

import 'package:cosmocloud_test/models/createEmployeeResponseModel.dart';
import 'package:cosmocloud_test/models/getEmployeesDataResponseModel.dart';

abstract class HomeScreenState {}

class HomeInitialState extends HomeScreenState {}

class HomeLoadingState extends HomeScreenState {}

class HomeErrorState extends HomeScreenState {}

class HomeLastState extends HomeScreenState {}

class GetEmployeeDataState extends HomeScreenState {
  EmployeesDataResponseModel? employeesDataResponseModel;
  GetEmployeeDataState({
    this.employeesDataResponseModel,
  });
}

class CreateEmployeeSuccessState extends HomeScreenState {
  CreateEmployeeResponseModel? createEmployeeResponseModel;
  CreateEmployeeSuccessState({
    this.createEmployeeResponseModel,
  });
}

class GetSimgleEmployeeDetailsState extends HomeErrorState {
  Data? data;
  GetSimgleEmployeeDetailsState({
    this.data,
  });
}
