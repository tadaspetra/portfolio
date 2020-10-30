import 'package:portfolio/domain/navigation/navigation.dart';
import 'package:portfolio/domain/navigation/navigation_state.dart';
import 'package:riverpod/riverpod.dart';

/// App global providers
final currentPageProvider = StateProvider<Pages>((ref) => Pages.home);

/// Returns the current authentication state - [AuthenticationState]
final navigationProvider = Provider<NavigationState>((ref) {
  final currentPage = ref.watch(currentPageProvider);

  switch (currentPage.state) {
    case Pages.home:
      return const NavigationState.home();
      break;
    case Pages.portfolio:
      return const NavigationState.portfolio();
      break;
    case Pages.consulting:
      return const NavigationState.consulting();
      break;
    case Pages.about:
      return const NavigationState.about();
      break;
    case Pages.contact:
      return const NavigationState.contact();
      break;
    default:
      return const NavigationState.error("invalid page");
  }
});
