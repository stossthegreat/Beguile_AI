import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/providers/auth_providers.dart';
import '../../ui/pages/main_shell.dart';
import '../../ui/pages/lessons/lessons_page.dart';
import '../../ui/pages/mentors/mentors_page.dart';
import '../../ui/pages/analyze/analyze_page.dart';
import '../../ui/pages/profile/profile_page.dart';
import '../../ui/pages/settings/settings_page.dart';
import '../../ui/pages/onboarding/onboarding_page.dart';
import '../../ui/pages/auth/login_page.dart';
import '../../ui/pages/paywall/paywall_page.dart';
import '../../data/services/paywall_service.dart';
import '../../data/services/onboarding_service.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/onboarding',
    redirect: (context, state) {
      final container = ProviderScope.containerOf(context);
      final authState = container.read(authStateProvider);
      
      final location = state.matchedLocation;
      final isOnLogin = location == '/login';
      final isOnSignup = location == '/signup';
      final isOnOnboarding = location == '/onboarding';
      final isOnRootOrHome = location == '/' || location == '/home';
      final isOnPaywall = location == '/paywall';

      // During auth loading, route away from blank root/home to avoid white screen
      if (authState == AuthState.loading) {
        if (isOnRootOrHome) {
          return OnboardingService.isCompleted ? '/paywall' : '/onboarding';
        }
        return null;
      }

      // If we're on root/home, immediately route based on auth state to avoid blank screen
      if (isOnRootOrHome) {
        if (authState == AuthState.authenticated) return '/mentors';
        // If onboarding already completed previously, skip to paywall/login path
        return OnboardingService.isCompleted ? '/paywall' : '/onboarding';
      }

      // Unauthenticated: show onboarding first; allow onboarding -> paywall -> login
      if (authState == AuthState.unauthenticated) {
        if (isOnOnboarding || isOnPaywall || isOnLogin || isOnSignup) return null;
        // If onboarding already completed in a prior session, skip it this time
        return OnboardingService.isCompleted ? '/paywall' : '/onboarding';
      }

      // Authenticated: send to lessons from login/onboarding/paywall
      if (authState == AuthState.authenticated && (isOnLogin || isOnSignup || isOnOnboarding || isOnPaywall)) {
        return '/mentors';
      }
      return null;
    },
    routes: [
      // Root alias (prevents 404 on initial load when state is still resolving)
      GoRoute(
        path: '/',
        name: 'root',
        builder: (context, state) => const SizedBox.shrink(),
      ),
      // Alias: /home (no UI, just a path that gets redirected in redirect())
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const SizedBox.shrink(),
      ),

      // Login route (outside shell)
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      // Signup route (outside shell)
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const LoginPage(initialSignUp: true),
      ),
      // Onboarding route (outside shell)
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      // Paywall route (outside shell)
      GoRoute(
        path: '/paywall',
        name: 'paywall',
        builder: (context, state) => const PaywallPage(),
      ),
      // Main shell with bottom navigation
      ShellRoute(
        builder: (context, state, child) {
          return MainShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/lessons',
            name: 'lessons',
            builder: (context, state) => const LessonsPage(),
          ),
          GoRoute(
            path: '/mentors',
            name: 'mentors',
            builder: (context, state) => const MentorsPage(),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (context, state) => const SettingsPage(),
          ),
          GoRoute(
            path: '/analyze',
            name: 'analyze',
            builder: (context, state) => const AnalyzePage(),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
    ],
  );
});
