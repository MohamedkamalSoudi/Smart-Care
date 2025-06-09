import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/nurse/required%20tests%20nurse/presentation/managers/test_details/test_details_cubit.dart';
import '../../../../../../core/utils/widgets/add_image_button.dart';
import '../../../../../../core/utils/widgets/image_controller.dart';
import '../../../../../../core/utils/widgets/image_tile.dart';
import '../../managers/edit_profile_cubit/edit_profile_cubit.dart';
import 'custom_image_picker_dialog.dart';

class EditProfilePicturePageBody extends StatefulWidget {
  const EditProfilePicturePageBody({super.key, required this.testId});
  static const id = "EditProfilePicturePage";
  final int testId;


  @override
  State<EditProfilePicturePageBody> createState() => _EditProfilePicturePageBodyState();
}

class _EditProfilePicturePageBodyState extends State<EditProfilePicturePageBody> {
  final imageController = ImageController();
  @override
  void initState() {
    context.read<TestDetailsCubit>().getTestData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<TestDetailsCubit, TestDetailsState>(
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
                          )),
                  // ...imageController.selectedImages.map(
                  //   (image) => ImageTile(
                  //     image: image,
                  //     onRemove: () {
                  //       setState(() => imageController.removeImage(image));
                  //     },
                  //   ),
                  // ),
                  ImageTile(

                    imageLink:  gitSuitableImageLink(state.labTest.filePath),
                    //image: state.labTest.filePath,
                    onRemove: () {
                    },
                  ),
                  //Image.network( gitSuitableImageLink(state.labTest.filePath)),
                ],
              ),
            );
          }
          else if (state is TestDetailsError) {
            return Center(child: Text(state.error));
          }
          else  {
            return const Center(child: CircularProgressIndicator());
          }
          
        },
      );
  }

  void _showImagePickerDialog(BuildContext context,
      {required Function() rebuild, required int testId}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => EditProfileCubit(),
        child: CustomImagePickerDialog(
          imageController: imageController,
          rebuild: rebuild,
          testId: testId,
        ),
      ),
    ).whenComplete(() {
      context.read<TestDetailsCubit>().getTestData();
    },);
  }
  String gitSuitableImageLink(String image) {
    return 'http://smartcare.wuaze.com/public/$image';
  }
}
