
abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class DiagnosisLoading extends HomeState {}

final class DiagnosisFailure extends HomeState {
  final String message;
  DiagnosisFailure({required this.message});
}

final class DiagnosisSuccess extends HomeState {}
final class HistorySuccess extends HomeState {}

final class HistoryLoading extends HomeState {}

final class HistoryFailure extends HomeState {
  final String message;
  HistoryFailure({required this.message});
}