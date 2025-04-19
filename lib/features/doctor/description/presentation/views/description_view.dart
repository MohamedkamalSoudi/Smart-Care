import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/utils/widgets/custom_view.dart';
import 'package:smart_care_app/features/doctor/description/data/models/description_model.dart';
import '../../../../../core/utils/widgets/custom_empty_body.dart';
import '../managers/description_cubit/description_cubit.dart';
import '../managers/description_cubit/description_states.dart';

import '../../../../../core/utils/widgets/custom_show_dialog.dart';

class DescriptionView extends StatelessWidget {
  static const id = 'PatientDataPage1';
  const DescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DescriptionCubit(),
      child: BlocConsumer<DescriptionCubit, DescriptionStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<DescriptionCubit>(context);
          return CustomView(
            title: 'Description of the condition',
            isFloatingActive: state is EmptyState ? true : false,
            body: cubit.descModel.desc == 'null'
                ? CustomEmptyBody(title: 'No Descriptions added until now')
                : SizedBox(
                    child: Text(cubit.descModel.desc),
                  ),
            onPressed: () {
              customShowDialog(
                context,
                TextEditingController(),
                'Enter Description of patient:',
                () {
                  DescriptionModel model = DescriptionModel(
                      desc: 'Hello brother ', dateTime: DateTime.now());
                  cubit.addAndEditDescription(model);
                  Navigator.pop(context);
                },
              );
            },
          );
        },
      ),
    );
  }
}
