import 'package:smart_care_app/features/doctor/description/data/models/description_model.dart';

abstract class DescriptionStates {}

class EmptyState extends DescriptionStates {}

class DataFounded extends DescriptionStates {
  final DescriptionModel model;
  DataFounded({required this.model});
}

class LoadingState extends DescriptionStates {}

class ErrorState extends DescriptionStates {
  final String error;
  ErrorState(this.error);
}
