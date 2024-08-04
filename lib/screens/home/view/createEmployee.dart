import 'package:cosmocloud_test/customWidget/appBar.dart';
import 'package:cosmocloud_test/helper/routeDirectory/route.dart';
import 'package:cosmocloud_test/models/createEmployeeRequestModel.dart';
import 'package:cosmocloud_test/screens/home/bloc/homeScreenBloc.dart';
import 'package:cosmocloud_test/screens/home/bloc/homeScreenEvents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../customWidget/circularProcessIndicator.dart';
import '../../../customWidget/dialogDialog.dart';
import '../../../customWidget/elevatedButton.dart';
import '../../../customWidget/textField.dart';
import '../../../utils/appSizes.dart';
import '../../../utils/appStrings.dart';
import '../bloc/homeScreenState.dart';

class CreateEmployeeScreen extends StatefulWidget {
  CreateEmployeeScreen();

  @override
  State<CreateEmployeeScreen> createState() => _CreateEmployeeScreenState();
}

class _CreateEmployeeScreenState extends State<CreateEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController? empNameConroller = TextEditingController();

  final TextEditingController? emailController = TextEditingController();

  final TextEditingController? moibileNumberController =
      TextEditingController();

  final TextEditingController? addressLine1Controller = TextEditingController();

  final TextEditingController? cityController = TextEditingController();

  final TextEditingController? countryController = TextEditingController();

  final TextEditingController? zipCodeController = TextEditingController();

  HomeScreenBloc? _homeScreenBloc;

  bool? isLoading = false;

  @override
  @override
  Widget build(BuildContext context) {
    _homeScreenBloc = context.read<HomeScreenBloc>();
    _homeScreenBloc!.add(HomeScreenLastEvent());
    return Scaffold(
      bottomSheet: _bottomSheetWidget(context),
      appBar: const CustomAppBar(
        title: "Create Employee",
      ),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (BuildContext context, currentState) {
          print("Current State ${currentState}");
          if (currentState is HomeLoadingState) {
            isLoading = true;
          } else if (currentState is HomeInitialState) {
            isLoading = false;
          } else if (currentState is HomeErrorState) {
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              renderBasicAlert(
                context: context,
                message: AppStrings.commonErrorMessage,
              );
            });
          } else if (currentState is CreateEmployeeSuccessState) {
            isLoading = false;
            Future.delayed(
              const Duration(
                microseconds: 500,
              ),
              () async {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  CustomSnackBar.show(
                    context,
                    AppStrings.createMessage,
                  );
                });
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoute.home,
                  (route) => false,
                );
              },
            );
          }
          return createEmployeeView(context);
        },
      ),
    );
  }

  createEmployeeView(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(AppSizes.sizeTwelve.w),
          child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: AppSizes.sizeTen.w,
                  ),
                  CustomTextField(
                    controller: empNameConroller!,
                    hintText: AppStrings.empName,
                    labelText: AppStrings.empName,
                    type: CustomTextFieldType.text,
                    isValidation: true,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: AppSizes.sizeTwentyFour.w,
                  ),
                  CustomTextField(
                    controller: emailController!,
                    hintText: AppStrings.emailAddress,
                    labelText: AppStrings.emailAddress,
                    type: CustomTextFieldType.email,
                    onChanged: (value) {
                      print('Email changed: $value');
                    },
                  ),
                  SizedBox(
                    height: AppSizes.sizeTwentyFour.w,
                  ),
                  CustomTextField(
                    controller: moibileNumberController!,
                    hintText: AppStrings.contactNumber,
                    labelText: AppStrings.contactNumber,
                    type: CustomTextFieldType.mobileNumber,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      print('Email changed: $value');
                    },
                  ),
                  SizedBox(
                    height: AppSizes.sizeTwentyFour.w,
                  ),
                  CustomTextField(
                    controller: addressLine1Controller!,
                    hintText: AppStrings.addressLine1,
                    labelText: AppStrings.addressLine1,
                    isValidation: true,
                    type: CustomTextFieldType.text,
                    onChanged: (value) {
                      print('Email changed: $value');
                    },
                  ),
                  SizedBox(
                    height: AppSizes.sizeTwentyFour.w,
                  ),
                  CustomTextField(
                    controller: cityController!,
                    hintText: AppStrings.city,
                    labelText: AppStrings.city,
                    isValidation: true,
                    type: CustomTextFieldType.text,
                    onChanged: (value) {
                      print('Email changed: $value');
                    },
                  ),
                  SizedBox(
                    height: AppSizes.sizeTwentyFour.w,
                  ),
                  CustomTextField(
                    controller: countryController!,
                    hintText: AppStrings.country,
                    labelText: AppStrings.country,
                    isValidation: true,
                    type: CustomTextFieldType.text,
                    onChanged: (value) {
                      print('Email changed: $value');
                    },
                  ),
                  SizedBox(
                    height: AppSizes.sizeTwentyFour.w,
                  ),
                  CustomTextField(
                    controller: zipCodeController!,
                    hintText: AppStrings.zip,
                    labelText: AppStrings.zip,
                    keyboardType: TextInputType.number,
                    isValidation: true,
                    type: CustomTextFieldType.number,
                    maxLength: 6,
                    onChanged: (value) {
                      print('Email changed: $value');
                    },
                  ),
                  SizedBox(
                    height: AppSizes.hundredFourty.w,
                  ),
                ],
              )),
        ),
        CustomCircularProcessIndicator(
          isLoading: isLoading,
        ),
      ],
    );
  }

  _bottomSheetWidget(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      shadowColor: Theme.of(context).colorScheme.background,
      color: Theme.of(context).colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SizedBox(
        height: AppSizes.hundred.w,
        child: Padding(
          padding: EdgeInsets.only(right: AppSizes.sizeTwenty.w),
          child: Align(
            alignment: Alignment.centerRight,
            child: CustomElevatedButton(
                backgroundColor:
                    Theme.of(context).colorScheme.onPrimaryContainer,
                textColor: Theme.of(context).colorScheme.onBackground,
                onPressed: () {
                  _createEmployeeFunction();
                },
                text: AppStrings.save),
          ),
        ),
      ),
    );
  }

  _createEmployeeFunction() {
    if (_formKey.currentState!.validate()) {
      CreateEmployeeRequestModel createEmployeeRequestModel =
          CreateEmployeeRequestModel(
              name: empNameConroller!.text,
              contact: Contact(
                email: emailController!.text,
                phone: moibileNumberController!.text,
              ),
              address: Address(
                line1: addressLine1Controller?.text,
                city: cityController!.text,
                country: countryController!.text,
                zipCode: zipCodeController!.text,
              ));
      _homeScreenBloc!.add(CreateEmployeeEvent(
        createEmployeeRequestModel: createEmployeeRequestModel,
      ));
    }
  }
}
