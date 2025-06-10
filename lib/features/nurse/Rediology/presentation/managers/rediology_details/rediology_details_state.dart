part of 'rediology_details_cubit.dart';

sealed class RediologyDetailsState extends Equatable {
  const RediologyDetailsState();

  @override
  List<Object> get props => [];
}

final class RediologyDetailsInitial extends RediologyDetailsState {}

final class RediologyDetailsLoading extends RediologyDetailsState {}

final class RediologyDetailsSuccess extends RediologyDetailsState {
  final Rediology rediology;
  const RediologyDetailsSuccess({required this.rediology});
}

final class RediologyDetailsError extends RediologyDetailsState {
  final String error;
  const RediologyDetailsError({required this.error});
}
