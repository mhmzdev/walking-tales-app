import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:walking_tales/configs/app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:walking_tales/cubits/diet/cubit.dart';
import 'package:walking_tales/providers/app_provider.dart';
import 'package:walking_tales/widgets/buttons/app_button.dart';
import 'package:walking_tales/widgets/dividers/app_dividers.dart';
import 'package:walking_tales/widgets/text_fields/custom_text_field.dart';

class FitnessTipScreen extends StatelessWidget {
  const FitnessTipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(428, 926));

    final app = AppProvider.state(context);
    final dietCubit = DietCubit.cubit(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: Space.all(),
          child: FormBuilder(
            key: app.dietFormState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Diet recommender',
                  style: AppText.h1b,
                ),
                Text(
                  'Get one of the best diets from our best machine learning models to keep you in shape!',
                  style: AppText.b2.cl(
                    Colors.grey,
                  ),
                ),
                Space.y1,
                Text(
                  'You can enter any other information apart from your own',
                  style: AppText.b1b,
                ),
                Space.y1,
                CustomTextField(
                  name: 'age',
                  hint: 'Enter your age',
                  textInputType: TextInputType.name,
                  validators: FormBuilderValidators.required(),
                ),
                Space.y1,
                CustomTextField(
                  name: 'height',
                  hint: 'Enter your height (ft)',
                  textInputType: TextInputType.name,
                  validators: FormBuilderValidators.required(),
                ),
                Space.y1,
                CustomTextField(
                  name: 'weight',
                  hint: 'Enter your weight (KG)',
                  textInputType: TextInputType.name,
                  validators: FormBuilderValidators.required(),
                ),
                Space.y1,
                AppButton(
                  onPressed: () {
                    if (app.dietFormState.currentState!.saveAndValidate()) {
                      FocusScope.of(context).unfocus();

                      final fields = app.dietFormState.currentState!.fields;

                      final values = fields.map(
                        (key, value) => MapEntry(
                          key,
                          value.value.toString().trim(),
                        ),
                      );

                      dietCubit.fetch(
                        int.parse(values['age'].toString()),
                        double.parse(values['height'].toString()),
                        double.parse(values['weight'].toString()),
                      );
                    }
                  },
                  child: Text(
                    'Get Diet',
                    style: AppText.b1b.cl(Colors.white),
                  ),
                ),
                AppDividers.simple(context),
                BlocBuilder<DietCubit, DietState>(
                  builder: (context, state) {
                    if (state is DietFetchLoading) {
                      return const LinearProgressIndicator();
                    } else if (state is DietFetchSuccess) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Diet recommendation results',
                            style: AppText.h2b,
                          ),
                          Text(
                            'Exercises',
                            style: AppText.b2b.cl(AppTheme.c.primary),
                          ),
                          Space.y,
                          ...state.data!.exercises.map(
                            (e) => Text(
                              e,
                              style: AppText.b1,
                            ),
                          ),
                          Space.y1,
                          Text(
                            'Food/Diet',
                            style: AppText.b2b.cl(AppTheme.c.primary),
                          ),
                          Space.y,
                          ...state.data!.exercises.map(
                            (e) => Text(
                              e,
                              style: AppText.b1,
                            ),
                          ),
                          Space.y1,
                          Text(
                            'An overall tip',
                            style: AppText.b2b.cl(AppTheme.c.primary),
                          ),
                          Space.y,
                          Text(
                            state.data!.message,
                            style: AppText.b1,
                          ),
                        ],
                      );
                    } else if (state is DietFetchFailed) {
                      return Text(state.message!);
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
