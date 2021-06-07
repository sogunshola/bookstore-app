part of 'application_bloc.dart';

@immutable
abstract class ApplicationEvent {
  @override
  String toString() => '$runtimeType';
}

class SetupApplicationEvent extends ApplicationEvent {}

class SettingsLoadedApplicationEvent extends ApplicationEvent {}

class OnboardingCompletedApplicationEvent extends ApplicationEvent {}

class LifecycleChangedApplicationEvent extends ApplicationEvent {
  LifecycleChangedApplicationEvent({required this.state});

  final AppLifecycleState state;
}

class ChangeRequestedLanguageApplicationEvent extends ApplicationEvent {
  ChangeRequestedLanguageApplicationEvent(this.locale);

  @override
  String toString() => '$runtimeType ($locale)';

  final Locale locale;
}
