import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/widgets/add_image_button.dart';
import '../../../../../../core/utils/widgets/image_controller.dart';
import '../../managers/edit_profile_cubit/edit_profile_cubit.dart';
import '../../managers/test_details/test_details_cubit.dart';
import 'custom_image_picker_dialog.dart';

class EditProfilePicturePageBody extends StatefulWidget {
  const EditProfilePicturePageBody({super.key, required this.testId});
  static const id = "EditProfilePicturePage";
  final int testId;

  @override
  State<EditProfilePicturePageBody> createState() =>
      _EditProfilePicturePageBodyState();
}

class _EditProfilePicturePageBodyState
    extends State<EditProfilePicturePageBody> {
  final imageController = ImageController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TestDetailsCubit>().getTestData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestDetailsCubit, TestDetailsState>(
      builder: (context, state) {
        if (state is TestDetailsSuccess) {
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
                    testId: widget.testId,
                  ),
                ),
                if (state.labTest.filePath != null &&
                    state.labTest.filePath!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: gitSuitableImageLink(state.labTest.filePath!),
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  )
                else
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text("لا توجد صورة"),
                    ),
                  ),
              ],
            ),
          );
        } else if (state is TestDetailsError) {
          return Center(child: Text(state.error));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void _showImagePickerDialog(BuildContext context,
      {required Function() rebuild, required int testId}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: BlocProvider(
            create: (context) => EditProfileCubit(),
            child: CustomImagePickerDialog(
              imageController: imageController,
              rebuild: rebuild,
              testId: testId,
            ),
          ),
        );
      },
    ).whenComplete(() {
      context.read<TestDetailsCubit>().getTestData();
    });
  }

  String gitSuitableImageLink(String image) {
    return 'http://smartcare.wuaze.com/public/$image';
  }
}
