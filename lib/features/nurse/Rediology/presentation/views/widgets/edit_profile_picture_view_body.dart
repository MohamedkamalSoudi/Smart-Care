import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/nurse/Rediology/presentation/managers/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:smart_care_app/features/nurse/Rediology/presentation/managers/rediology_details/rediology_details_cubit.dart';
import '../../../../../../core/utils/widgets/add_image_button.dart';
import '../../../../../../core/utils/widgets/image_controller.dart';
import '../../../../../../core/utils/widgets/image_tile.dart';
import 'custom_image_picker_dialog.dart';

class EditProfilePicturePageBody extends StatefulWidget {
  const EditProfilePicturePageBody({super.key, required this.rediologyId});
  static const id = "EditProfilePicturePage";
  final int rediologyId;

  @override
  State<EditProfilePicturePageBody> createState() =>
      _EditProfilePicturePageBodyState();
}

class _EditProfilePicturePageBodyState
    extends State<EditProfilePicturePageBody> {
  final imageController = ImageController();

  @override
  void initState() {
    context.read<RediologyDetailsCubit>().getRediologyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RediologyDetailsCubit, RediologyDetailsState>(
      builder: (context, state) {
        if (state is RediologyDetailsSuccess) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                AddImageButton(
                  onTap: () => _showImagePickerDialog(
                    context,
                    rebuild: () {
                      setState(() {});
                    },
                    rediologyId: widget.rediologyId,
                  ),
                ),
                if (state.rediology.filePath != null &&
                    state.rediology.filePath!.isNotEmpty)
                  ImageTile(
                    imageLink: gitSuitableImageLink(state.rediology.filePath!),
                    onRemove: () {},
                  )
                else
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
              ],
            ),
          );
        } else if (state is RediologyDetailsError) {
          return Center(child: Text(state.error));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void _showImagePickerDialog(BuildContext context,
      {required Function() rebuild, required int rediologyId}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => EditProfileCubit(),
        child: CustomImagePickerDialog(
          imageController: imageController,
          rebuild: rebuild,
          rediologyId: rediologyId,
        ),
      ),
    ).whenComplete(() {
      context.read<RediologyDetailsCubit>().getRediologyData();
    });
  }

  String gitSuitableImageLink(String image) {
    return 'http://smartcare.wuaze.com/public/$image';
  }
}
