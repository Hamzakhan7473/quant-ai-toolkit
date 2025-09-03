import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState {
  final bool isDarkMode;
  final String currentUser;
  final bool isAuthenticated;

  AppState({
    this.isDarkMode = false,
    this.currentUser = '',
    this.isAuthenticated = false,
  });

  AppState copyWith({
    bool? isDarkMode,
    String? currentUser,
    bool? isAuthenticated,
  }) {
    return AppState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      currentUser: currentUser ?? this.currentUser,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class AppNotifier extends StateNotifier<AppState> {
  AppNotifier() : super(AppState());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void setUser(String user) {
    state = state.copyWith(currentUser: user, isAuthenticated: true);
  }

  void logout() {
    state = state.copyWith(currentUser: '', isAuthenticated: false);
  }
}

final appProvider = StateNotifierProvider<AppNotifier, AppState>((ref) {
  return AppNotifier();
});
