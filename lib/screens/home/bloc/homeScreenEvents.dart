import 'package:cosmocloud_test/models/createEmployeeRequestModel.dart';

abstract class HomeScreenEvent {}

class GetEmployeeDataEvent extends HomeScreenEvent {}

class HomeScreenLastEvent extends HomeScreenEvent {}

class CreateEmployeeEvent extends HomeScreenEvent {
  CreateEmployeeRequestModel? createEmployeeRequestModel;
  CreateEmployeeEvent({
    this.createEmployeeRequestModel,
  });
}

class GetSingleEmployeeDetailsEvent extends HomeScreenEvent {
  String? empId;
  GetSingleEmployeeDetailsEvent({
    this.empId,
  });
}
