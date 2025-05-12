import 'package:bloc/bloc.dart';
import '../../../data/models/description_nurse_model.dart';
import 'description_nurse_states.dart';

class DescriptionNurseCubit extends Cubit<DescriptionNurseStates> {
  DescriptionNurseCubit() : super(EmptyState());

DescriptionNurseModel descModel = DescriptionNurseModel(
    desc: 'null',
    dateTime: DateTime.now(),
  );

  addAndEditDescription(DescriptionNurseModel model) {
    descModel = model;
    emit(DataFounded());
  }
}
