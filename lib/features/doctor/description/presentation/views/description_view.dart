import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/utils/widgets/custom_view.dart';

import '../../../../../core/utils/widgets/custom_empty_body.dart';
import '../../../../../core/utils/widgets/custom_not_card.dart';
import '../../../../../core/utils/widgets/custom_show_dialog.dart';
import '../managers/description_cubit.dart';
import '../managers/description_states.dart';

class DescriptionView extends StatelessWidget {
  static const id = 'DescriptionView';

  const DescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    final String patientId =
        ModalRoute.of(context)!.settings.arguments as String;
    final int ids = int.parse(patientId); 

    return BlocProvider(
      create: (context) => DescriptionCubit()..fetchDescription(ids),
      child: BlocConsumer<DescriptionCubit, DescriptionStates>(
        listener: (context, state) {
          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.error}")),
            );
          }
        },
        builder: (context, state) {
          return CustomView(
            title: 'Description',
            isFloatingActive: state is EmptyState ? true : false,
            body: state is DataFounded
                ? NoteItem(
                    title: state.model.desc,
                    dateTime: DateTime.now(),
                    onTap: () {
                      final controller =
                          TextEditingController(text: state.model.desc);
                      customShowDialog(
                        context,
                        controller,
                        'Edit Description of patient',
                        () {
                          context
                              .read<DescriptionCubit>()
                              .postDescription(controller.text, ids);
                          Navigator.pop(context);
                        },
                        "Edit Description",
                      );
                    },
                  )
                : state is LoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : const CustomEmptyBody(title: 'No Description'),
            onPressed: () {
              final controller = TextEditingController();
              customShowDialog(
                context,
                controller,
                'Enter Description of patient:',
                () {
                  context
                      .read<DescriptionCubit>()
                      .postDescription(controller.text, ids);
                  Navigator.pop(context);
                },
                "Add Description",
              );
            },
          );
        },
      ),
    );
  }
}
