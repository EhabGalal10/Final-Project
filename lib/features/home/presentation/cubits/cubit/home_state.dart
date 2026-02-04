
abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class DiagnosisLoading extends HomeState {}

final class DiagnosisFailure extends HomeState {
  final String message;
  DiagnosisFailure({required this.message});
}

final class DiagnosisSuccess extends HomeState {}
