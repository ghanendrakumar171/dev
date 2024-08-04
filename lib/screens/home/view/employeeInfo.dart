import 'package:cosmocloud_test/customWidget/appBar.dart';
import 'package:cosmocloud_test/customWidget/circularProcessIndicator.dart';
import 'package:cosmocloud_test/screens/home/bloc/homeScreenBloc.dart';
import 'package:cosmocloud_test/screens/home/bloc/homeScreenEvents.dart';
import 'package:cosmocloud_test/screens/home/bloc/homeScreenState.dart';
import 'package:cosmocloud_test/utils/appStrings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../customWidget/dialogDialog.dart';
import '../../../helper/routeDirectory/route.dart';
import '../../../models/getEmployeesDataResponseModel.dart';
import '../../../utils/appSizes.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  String? empId;
  EmployeeDetailsScreen({
    super.key,
    this.empId,
  });

  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  HomeScreenBloc? _homeScreenBloc;
  bool? isLoading = false;
  Data? data;
  @override
  void initState() {
    _homeScreenBloc = context.read<HomeScreenBloc>();
    _homeScreenBloc?.add(GetSingleEmployeeDetailsEvent(
      empId: widget.empId,
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Employee Details",
      ),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (BuildContext context, currentState) {
          print("Current State ${currentState}");
          if (currentState is HomeLoadingState) {
            isLoading = true;
          } else if (currentState is HomeInitialState) {
            isLoading = false;
          } else if (currentState is GetSimgleEmployeeDetailsState) {
            isLoading = false;
            data = currentState.data;
          } else if (currentState is HomeErrorState) {
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              renderBasicAlert(
                context: context,
                message: AppStrings.commonErrorMessage,
              );
            });
          }
          return _employeeDetails(context);
        },
      ),
    );
  }

  Widget _employeeDetails(BuildContext context) {
    return isLoading!
        ? CustomCircularProcessIndicator(
            isLoading: isLoading,
          )
        : Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.sizeFour.w),
            child: SizedBox(
              height: AppSizes.threeHundred.w,
              width: AppSizes.screenWidth - (2 * AppSizes.sizeTen.w),
              child: Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.onBackground,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AppSizes.sizeTwentyFour.w,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: AppSizes.sizeTen.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.empName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline
                                            .withOpacity(.6),
                                      ),
                                ),
                                SizedBox(
                                  width: AppSizes.sizeSix.w,
                                ),
                                Text(
                                  data?.name ?? "",
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline
                                            .withOpacity(.87),
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(AppStrings.empId,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline
                                              .withOpacity(.6),
                                        )),
                                SizedBox(
                                  width: AppSizes.sizeSix.w,
                                ),
                                SizedBox(
                                  width: AppSizes.sizeEighty.w,
                                  child: Text(
                                    data?.emp_id ?? "",
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline
                                              .withOpacity(.87),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(AppStrings.emailAddress,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline
                                              .withOpacity(.6),
                                        )),
                                SizedBox(
                                  width: AppSizes.sizeSix.w,
                                ),
                                SizedBox(
                                  width: AppSizes.sizeEighty.w,
                                  child: Text(
                                    data?.contact?.email ?? "",
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline
                                              .withOpacity(.87),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(AppStrings.contactNumber,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline
                                              .withOpacity(.6),
                                        )),
                                SizedBox(
                                  width: AppSizes.sizeSix.w,
                                ),
                                SizedBox(
                                  width: AppSizes.sizeEighty.w,
                                  child: Text(
                                    data?.contact?.phone ?? "",
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline
                                              .withOpacity(.87),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(AppStrings.addressLine1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline
                                              .withOpacity(.6),
                                        )),
                                SizedBox(
                                  width: AppSizes.sizeSix.w,
                                ),
                                SizedBox(
                                  width: AppSizes.sizeEighty.w,
                                  child: Text(
                                    data?.address?.line1 ?? "",
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline
                                              .withOpacity(.87),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(AppStrings.city,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline
                                              .withOpacity(.6),
                                        )),
                                SizedBox(
                                  width: AppSizes.sizeSix.w,
                                ),
                                SizedBox(
                                  width: AppSizes.sizeEighty.w,
                                  child: Text(
                                    data?.address?.city ?? "",
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline
                                              .withOpacity(.87),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(AppStrings.country,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline
                                              .withOpacity(.6),
                                        )),
                                SizedBox(
                                  width: AppSizes.sizeSix.w,
                                ),
                                SizedBox(
                                  width: AppSizes.sizeEighty.w,
                                  child: Text(
                                    data?.address?.country ?? "",
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline
                                              .withOpacity(.87),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(AppStrings.zip,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline
                                              .withOpacity(.6),
                                        )),
                                SizedBox(
                                  width: AppSizes.sizeSix.w,
                                ),
                                SizedBox(
                                  width: AppSizes.sizeEighty.w,
                                  child: Text(
                                    data?.address?.zipCode ?? "",
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline
                                              .withOpacity(.87),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          );
  }
}
