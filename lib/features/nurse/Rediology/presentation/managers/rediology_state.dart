import 'package:equatable/equatable.dart';
import 'package:smart_care_app/features/nurse/Rediology/data/rediology_model_at_nurse.dart';

class RediologyState extends Equatable {
  final bool isLoading;
  final String? error;
  final List<RediologyModelAtNurse>? rediologies;
  final bool isEmpty;

  const RediologyState({
    this.isLoading = false,
    this.error,
    this.rediologies,
    this.isEmpty = false,
  });

  RediologyState copyWith({
    bool? isLoading,
    String? error,
    List<RediologyModelAtNurse>? rediologies,
    bool? isEmpty,
  }) {
    return RediologyState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      rediologies: rediologies ?? this.rediologies,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        rediologies?.length,
        isEmpty,
      ];
}
