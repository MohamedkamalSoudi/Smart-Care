import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/utils/widgets/custom_view.dart';
import '../../../../../core/utils/widgets/custom_empty_body.dart';
import '../../../../../core/utils/widgets/custom_show_dialog.dart';
import '../managers/description_cubit.dart';
import '../managers/description_states.dart';

class DescriptionView extends StatelessWidget {
  static const id = 'PatientDataPage1';
  final int ids;
  const DescriptionView({super.key, required this.ids});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DescriptionCubit()..fetchDescription(ids),
      child: BlocConsumer<DescriptionCubit, DescriptionStates>(
        listener: (context, state) {
          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.error}")),
            );
          }
          if (state is DataFounded) {
            context.read<DescriptionCubit>().fetchDescription(ids);
          }
        },
        builder: (context, state) {
          return CustomView(
            title: 'Description of the condition',
            isFloatingActive: state is EmptyState ? true : false,
            body: state is DataFounded
                // ? NoteItem(
                //     title: state.models.desc,
                //     dateTime: state.models.dateTime,
                //     onTap: () {
                //       final controller = TextEditingController(text: state.models.desc);
                //       customShowDialog(
                //         context,
                //         controller,
                //         'Edit Description of patient:',
                //         () {
                //           context.read<DescriptionCubit>().postDescription( controller.text,  ids);
                //           Navigator.pop(context);
                //         },
                //         "Edit Description",
                //       );
                //     },
                //   )
                ? SizedBox():
                state is LoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : const CustomEmptyBody(title: 'No Description'),
            onPressed: () {
              final controller = TextEditingController();
              customShowDialog(
                context,
                controller,
                'Enter Description of patient:',
                () {
                  //context.read<DescriptionCubit>().postDescription( controller.text, ids);
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

