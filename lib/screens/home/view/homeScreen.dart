// ignore_for_file: use_build_context_synchronously, unnecessary_brace_in_string_interps, avoid_print, prefer_is_empty

import 'package:cosmocloud_test/helper/routeDirectory/route.dart';
import 'package:cosmocloud_test/models/getEmployeesDataResponseModel.dart';
import 'package:cosmocloud_test/screens/home/bloc/homeScreenEvents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../customWidget/circularProcessIndicator.dart';
import '../../../customWidget/dialogDialog.dart';
import '../../../utils/appSizes.dart';
import '../../../utils/appStrings.dart';
import '../bloc/homeScreenBloc.dart';
import '../bloc/homeScreenState.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenBloc? homeScreenBloc;
  bool? isLoading = false;
  bool iswaitForList = false;
  EmployeesDataResponseModel? employeesDataResponseModel;

  @override
  void initState() {
    homeScreenBloc = context.read<HomeScreenBloc>();
    homeScreenBloc?.add(GetEmployeeDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text(AppStrings.employeeList),
        actions: [floatingActionButtonForCreateEmployee(context)],
      ),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (BuildContext context, currentState) {
          print("Current State ${currentState}");
          if (currentState is HomeLoadingState) {
            isLoading = true;
          } else if (currentState is HomeInitialState) {
            isLoading = false;
          } else if (currentState is GetEmployeeDataState) {
            isLoading = false;
            iswaitForList = false;
            employeesDataResponseModel =
                currentState.employeesDataResponseModel;
          } else if (currentState is HomeErrorState) {
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              renderBasicAlert(
                context: context,
                message: AppStrings.commonErrorMessage,
              );
            });
          }
          return _homeScreen(context);
        },
      ),
    );
  }

  Widget _homeScreen(BuildContext context) {
    return isLoading!
        ? const CustomCircularProcessIndicator(isLoading: true)
        : Align(
            alignment: Alignment.center,
            child: SizedBox(
              child: employeeListingStackView(
                context,
              ),
            ),
          );
  }

  Widget employeeListingStackView(BuildContext context) {
    return Stack(
      children: [
        employeeListingView(context),
        CustomCircularProcessIndicator(
          isLoading: isLoading,
        ),
      ],
    );
  }

  Widget employeeListingView(BuildContext context) {
    return employeesDataResponseModel?.data?.length == 0
        ? Text(
            "No Employee Found",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.outline.withOpacity(.6),
                ),
          )
        : Padding(
            padding: EdgeInsets.all(
              AppSizes.sizeTen.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSizes.sizeEight.w,
                ),
                iswaitForList
                    ? Expanded(
                        child: CustomCircularProcessIndicator(
                          isLoading: iswaitForList,
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: employeesDataResponseModel?.data?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: AppSizes.sizeFour.w),
                                child: SizedBox(
                                  height: AppSizes.sizeEighty.w,
                                  width: AppSizes.screenWidth -
                                      (2 * AppSizes.sizeTen.w),
                                  child: Card(
                                    elevation: 0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: AppSizes.sizeTwelve.w),
                                            child: Container(
                                              height: AppSizes.sizeThirtyFour.w,
                                              width: AppSizes.sizeThirtyFour.w,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary
                                                      .withOpacity(.38),
                                                  border: Border.all(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                  )),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  (index + 1)
                                                      .toString(), // now hardcoded
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                    fontSize: AppSizes
                                                        .sizeEightTeen.w,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: AppSizes.sizeTwentyFour.w,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: AppSizes.sizeTen.w),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      AppStrings.empName,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall
                                                          ?.copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .outline
                                                                .withOpacity(
                                                                    .6),
                                                          ),
                                                    ),
                                                    SizedBox(
                                                      width: AppSizes.sizeSix.w,
                                                    ),
                                                    Text(
                                                      employeesDataResponseModel!
                                                              .data![index]
                                                              .name ??
                                                          '',
                                                      overflow:
                                                          TextOverflow.clip,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium
                                                          ?.copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .outline
                                                                .withOpacity(
                                                                    .87),
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(AppStrings.empId,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelSmall
                                                            ?.copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .outline
                                                                  .withOpacity(
                                                                      .6),
                                                            )),
                                                    SizedBox(
                                                      width: AppSizes.sizeSix.w,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          AppSizes.sizeEighty.w,
                                                      child: Text(
                                                        employeesDataResponseModel!
                                                                .data![index]
                                                                .emp_id ??
                                                            '',
                                                        maxLines: 1,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium
                                                            ?.copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .outline
                                                                  .withOpacity(
                                                                      .87),
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    right:
                                                        AppSizes.sizeEight.w),
                                                child: IconButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context,
                                                        AppRoute
                                                            .employeeDetails,
                                                        arguments:
                                                            employeesDataResponseModel!
                                                                .data![index]
                                                                .emp_id);
                                                  },
                                                  icon: Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onPrimaryContainer,
                                                        width:
                                                            1, // Adjust the width of the border as needed
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                        AppSizes.sizeSix,
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .arrow_forward_ios_outlined,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onPrimaryContainer,
                                                        size: AppSizes
                                                            .sizeSixteen,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ]),
                                  ),
                                ),
                              );
                            }),
                      )
              ],
            ),
          );
  }

  Widget floatingActionButtonForCreateEmployee(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          AppRoute.createEmployee,
        );
      },
      icon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            width: 1, // Adjust the width of the border as needed
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            AppSizes.sizeSix,
          ),
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            size: AppSizes.sizeTwentySix,
          ),
        ),
      ),
    );
  }
}
