import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  final void Function(int tabIndex) onNavigate;

  const HomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HEILBRONN · CAFÉ',
            style: TextStyle(
              color: AppColors.accent,
              letterSpacing: 2,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Text('A café for\nslow mornings.', style: textTheme.displayLarge),
          const SizedBox(height: 20),
          Text(
            "Naomi's Coffee Club is a small coffee spot in Heilbronn "
            'built around slow mornings and good food. Expect brunch '
            "plates, proper espresso, and a room that doesn't rush you "
            'out the door. No reservations — just come as you are.',
            style: TextStyle(
              color: AppColors.cream.withValues(alpha: 0.85),
              height: 1.5,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: () => onNavigate(3), // Location tab
                child: const Text('Find us'),
              ),
              OutlinedButton(
                onPressed: () => onNavigate(1), // Menu tab
                child: const Text('View menu'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
