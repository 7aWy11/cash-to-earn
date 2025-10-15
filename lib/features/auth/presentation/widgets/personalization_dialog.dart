import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:country_picker/country_picker.dart';
import '../../../../core/config/router/route_names.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/config/theme/app_text_styles.dart';
import '../../../../core/widgets/dialog_button.dart';
import '../../../../core/widgets/dialog_progress_indicator.dart';
import 'gender_selection_step.dart';
import 'country_selection_step.dart';

/// Personalization dialog for gender and country selection
class PersonalizationDialog extends StatefulWidget {
  const PersonalizationDialog({super.key});

  @override
  State<PersonalizationDialog> createState() => _PersonalizationDialogState();
}

class _PersonalizationDialogState extends State<PersonalizationDialog> {
  int currentStep = 1;
  String? selectedGender;
  Country? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child: FadeInUp(
        duration: const Duration(milliseconds: 300),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 340.w,
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A2E).withOpacity(0.95),
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    "Let's personalize your offers",
                    style: AppTextStyles.h3.copyWith(color: AppColors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),

                  // Progress indicator
                  DialogProgressIndicator(
                    currentStep: currentStep,
                    totalSteps: 2,
                  ),
                  SizedBox(height: 24.h),

                  // Content based on current step
                  if (currentStep == 1)
                    GenderSelectionStep(
                      selectedGender: selectedGender,
                      onGenderSelected: (gender) {
                        setState(() {
                          selectedGender = gender;
                        });
                      },
                    ),
                  if (currentStep == 2)
                    CountrySelectionStep(
                      selectedCountry: selectedCountry,
                      onCountrySelected: (country) {
                        setState(() {
                          selectedCountry = country;
                        });
                      },
                    ),

                  SizedBox(height: 24.h),

                  // Buttons
                  if (currentStep == 1)
                    DialogButton(
                      text: 'Next',
                      onPressed: selectedGender != null
                          ? () {
                              setState(() {
                                currentStep = 2;
                              });
                            }
                          : null,
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: DialogButton(
                            text: 'Back',
                            onPressed: () {
                              setState(() {
                                currentStep = 1;
                              });
                            },
                            isPrimary: false,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: DialogButton(
                            text: 'Finish',
                            onPressed: selectedCountry != null
                                ? () {
                                    Navigator.pop(context);
                                    context.push(RouteNames.usernameAvatar);
                                  }
                                : null,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Helper function to show the personalization dialog
void showPersonalizationDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const PersonalizationDialog(),
  );
}
