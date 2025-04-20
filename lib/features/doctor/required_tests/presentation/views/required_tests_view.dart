import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/utils/widgets/custom_view.dart';
import '../../../../../core/utils/widgets/custom_empty_body.dart';
import '../../../../../core/utils/widgets/custom_show_dialog.dart';
import '../../../description/data/models/description_model.dart';
import '../../../description/presentation/managers/description_cubit/description_cubit.dart';
import '../../../description/presentation/managers/description_cubit/description_states.dart';
import '../custom_card_body.dart';

class RequiredTestsView extends StatelessWidget {
    static const id = 'required_tests_view';
  const RequiredTestsView({super.key});

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
                :CustomCardBody(),
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
