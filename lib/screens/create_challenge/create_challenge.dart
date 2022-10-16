import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import 'package:walking_tales/configs/app.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:walking_tales/cubits/auth/cubit.dart';
import 'package:walking_tales/cubits/challenge/cubit.dart';
import 'package:walking_tales/models/challenge.dart';
import 'package:walking_tales/providers/app_provider.dart';
import 'package:walking_tales/utils/custom_snackbar.dart';
import 'package:walking_tales/widgets/buttons/app_button.dart';
import 'package:walking_tales/widgets/loader/full_screen_loader.dart';
import 'package:walking_tales/widgets/screen/screen.dart';
import 'package:walking_tales/widgets/text_fields/custom_text_field.dart';
import 'package:walking_tales/widgets/text_fields/date_time_text_field.dart';
import 'package:walking_tales/widgets/text_fields/multiline_text_field.dart';

class CreateChallengeScreen extends StatelessWidget {
  const CreateChallengeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(428, 926));

    final app = AppProvider.state(context);
    final authCubit = AuthCubit.cubit(context);
    final challengeCubit = ChallengeCubit.c(context);

    return Screen(
      overlayWidgets: [
        BlocConsumer<ChallengeCubit, ChallengeState>(
          listener: (context, state) {
            if (state.add is ChallengeAddFailed) {
              CustomSnackBars.failure(context, state.add!.message!);
            } else if (state.add is ChallengeAddSuccess) {
              CustomSnackBars.success(
                context,
                'Challenge has been added successfully. Let\'s stay healthy with your friends!',
              );

              app.challengeFormState.currentState?.reset();
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            if (state.add is ChallengeAddLoading) {
              return const FullScreenLoader(
                loading: true,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
      child: Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          padding: Space.all(),
          child: FormBuilder(
            key: app.challengeFormState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const BackButton(),
                    Text(
                      'Create challenge',
                      style: AppText.h1b,
                    )
                  ],
                ),
                Space.y1,
                Text(
                  'Please enter the following information',
                  style: AppText.b1,
                ),
                Space.y,
                Text(
                  'Challenge information',
                  style: AppText.b1b,
                ),
                Space.y,
                CustomTextField(
                  name: 'title',
                  hint: 'Challenge title',
                  textInputType: TextInputType.text,
                  validators: FormBuilderValidators.required(),
                ),
                Space.y1,
                CustomMultiLineTextField(
                  name: 'description',
                  hint: 'Challenge description here...',
                  validatorFtn: FormBuilderValidators.required(),
                ),
                Space.y1,
                Text(
                  'Start Date',
                  style: AppText.b1b,
                ),
                Space.y,
                CustomDateTimeField(
                  icon: const Icon(Icons.date_range),
                  hint: 'Starting date',
                  firstDate:
                      DateTime.now().subtract(const Duration(minutes: 1)),
                  initialDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  name: 'start',
                  format: DateFormat('dd-MM-yyyy'),
                  validatorFtn: FormBuilderValidators.required(),
                ),
                Space.y1,
                Text(
                  'Entry Points',
                  style: AppText.b1b,
                ),
                Text(
                  'Points that each friend will contribute as entry fee and it will combined to end up as winning prize.',
                  style: AppText.b2.cl(Colors.grey),
                ),
                Space.y,
                CustomTextField(
                  name: 'points',
                  hint: 'Entry point per person',
                  prefixIcon: const Icon(Icons.widgets_outlined),
                  textInputType: TextInputType.number,
                  validators: FormBuilderValidators.required(),
                ),
                Space.y1,
                AppButton(
                  child: Text(
                    'Submit',
                    style: AppText.b1b.cl(Colors.white),
                  ),
                  onPressed: () {
                    if (app.challengeFormState.currentState!
                        .saveAndValidate()) {
                      FocusScope.of(context).unfocus();

                      final fields =
                          app.challengeFormState.currentState!.fields;

                      final values = fields.map(
                        (key, value) => MapEntry(
                          key,
                          value.value.toString().trim(),
                        ),
                      );

                      final challenge = Challenge(
                        uid: authCubit.state.data!.uid,
                        id: App.id(),
                        title: values['title']!,
                        description: values['description']!,
                        participants: 0,
                        points: double.parse(values['points'].toString()),
                        startDate: DateTime.parse(values['start']!),
                        createdAt: DateTime.now(),
                        isPublic: false,
                      );

                      challengeCubit.add(challenge);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
