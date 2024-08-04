import 'package:cosmocloud_test/helper/networkManager/apiClient.dart';
import 'package:cosmocloud_test/models/createEmployeeRequestModel.dart';
import 'package:cosmocloud_test/models/createEmployeeResponseModel.dart';
import 'package:cosmocloud_test/models/getEmployeesDataResponseModel.dart';

abstract class HomeScreenRepository {
  Future<EmployeesDataResponseModel> getEmployeeDataFunction();
  Future<CreateEmployeeResponseModel> createEmpoyeeFunction(
    CreateEmployeeRequestModel? createEmployeeRequestModel,
  );
  Future<Data> getEmployeeData(
    String? empId,
  );
}

class HomeScreenRepositoryImp extends HomeScreenRepository {
  @override
  Future<EmployeesDataResponseModel> getEmployeeDataFunction() async {
    EmployeesDataResponseModel? employeesDataResponseModel;
    try {
      employeesDataResponseModel = await ApiClient().getEmployeeData(100, 0);
    } catch (e) {
      print("Error ${e}");
    }
    return employeesDataResponseModel!;
  }

  @override
  Future<CreateEmployeeResponseModel> createEmpoyeeFunction(
      CreateEmployeeRequestModel? createEmployeeRequestModel) async {
    CreateEmployeeResponseModel? createEmployeeResponseModel;
    try {
      createEmployeeResponseModel = await ApiClient().createEmployeeFun(
        createEmployeeRequestModel!,
      );
    } catch (e) {
      print("Error ${e}");
    }
    return createEmployeeResponseModel!;
  }

  @override
  Future<Data> getEmployeeData(String? empId) async {
    Data? data;
    try {
      data = await ApiClient().getSingleEmployeeDataFunction(
        empId!,
      );
    } catch (e) {
      print("Error ${e}");
    }
    return data!;
  }
}
