import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_state.freezed.dart';

@freezed
abstract class NavigationState with _$NavigationState {
  const factory NavigationState.home() = Home;
  const factory NavigationState.portfolio() = Portfolio;
  const factory NavigationState.consulting() = Consulting;
  const factory NavigationState.about() = About;
  const factory NavigationState.contact() = Contact;
  const factory NavigationState.error(Object error) = Error;
}
