import 'package:bloc/bloc.dart';
import '../../../data/models/description_model.dart';
import 'description_states.dart';

class DescriptionCubit extends Cubit<DescriptionStates> {
  DescriptionCubit() : super(EmptyState());

  DescriptionModel descModel = DescriptionModel(
    desc: 'null',
    dateTime: DateTime.now(),
  );

  addAndEditDescription(DescriptionModel model) {
    descModel = model;
    emit(DataFounded());
  }
}
