import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OUR STORY',
            style: TextStyle(
              color: AppColors.accent,
              letterSpacing: 2,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
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
          const SizedBox(height: 32),
          Divider(color: AppColors.tan.withValues(alpha: 0.3)),
          const SizedBox(height: 24),
          Text(
            'HIRING',
            style: TextStyle(
              color: AppColors.accent,
              letterSpacing: 2,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Interested in joining the team? Check our Instagram '
            'Highlights for current openings.',
            style: TextStyle(
              color: AppColors.cream.withValues(alpha: 0.85),
              height: 1.5,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
