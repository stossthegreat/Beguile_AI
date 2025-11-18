import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class LoadingShell extends StatelessWidget {
  final String? message;

  const LoadingShell({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WFColors.base,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: const AlwaysStoppedAnimation<Color>(WFColors.primary),
              strokeWidth: 3,
            ),
            const SizedBox(height: 24),
            Text(
              message ?? 'Loading Beguile AI...',
              style: const TextStyle(
                color: WFColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Please wait',
              style: const TextStyle(
                color: WFColors.textSecondary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
