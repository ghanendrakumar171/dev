// ignore_for_file: override_on_non_overriding_member

import 'package:cosmocloud_test/models/createEmployeeResponseModel.dart';
import 'package:cosmocloud_test/models/getEmployeesDataResponseModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'homeScreenEvents.dart';
import 'homeScreenRepository.dart';
import 'homeScreenState.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenRepository? homeScreenRepository;
  HomeScreenBloc({this.homeScreenRepository}) : super(HomeInitialState()) {
    on<HomeScreenEvent>(mapEventToState);
  }
  @override
  mapEventToState(HomeScreenEvent event, Emitter<HomeScreenState> emit) async {
    if (event is GetEmployeeDataEvent) {
      emit(HomeLoadingState());
      try {
        EmployeesDataResponseModel? employeesDataResponseModel =
            await homeScreenRepository!.getEmployeeDataFunction();
        emit(
          GetEmployeeDataState(
            employeesDataResponseModel: employeesDataResponseModel,
          ),
        );
      } catch (e) {
        emit(HomeErrorState());
      }
    } else if (event is HomeScreenLastEvent) {
      emit(HomeLastState());
    } else if (event is CreateEmployeeEvent) {
      emit(HomeLoadingState());
      try {
        CreateEmployeeResponseModel? createEmployeeResponseModel =
            await homeScreenRepository!.createEmpoyeeFunction(
          event.createEmployeeRequestModel,
        );
        emit(
          CreateEmployeeSuccessState(
            createEmployeeResponseModel: createEmployeeResponseModel,
          ),
        );
      } catch (e) {
        emit(HomeErrorState());
      }
    } else if (event is GetSingleEmployeeDetailsEvent) {
      emit(HomeLoadingState());
      try {
        Data? _employeeData = await homeScreenRepository!.getEmployeeData(
          event.empId!,
        );
        emit(
          GetSimgleEmployeeDetailsState(
            data: _employeeData,
          ),
        );
      } catch (e) {
        emit(HomeErrorState());
      }
    }
  }
}
