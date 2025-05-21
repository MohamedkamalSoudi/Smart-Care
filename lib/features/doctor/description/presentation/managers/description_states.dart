import 'package:smart_care_app/features/doctor/description/data/models/description_model.dart';

abstract class DescriptionStates {}

class EmptyState extends DescriptionStates {}

class DataFounded extends DescriptionStates {

  final List<DescriptionModel> models;
  DataFounded({required this.models});
}

class LoadingState extends DescriptionStates {}

class ErrorState extends DescriptionStates {
  final String error;
  ErrorState(this.error);
}
