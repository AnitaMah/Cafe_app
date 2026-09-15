import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// A single upcoming event or recurring special shown on [EventsScreen].
class _EventItem {
  /// When it happens, e.g. `"Every Sunday"` or `"Seasonal"` — shown as-is,
  /// not parsed as a real date.
  final String date;
  final String title;
  final String description;

  const _EventItem({
    required this.date,
    required this.title,
    required this.description,
  });
}

/// Recurring specials and seasonal one-offs. There's no backing data
/// source yet — add or remove events by editing this list directly.
const List<_EventItem> _events = [
  _EventItem(
    date: 'Every Sunday',
    title: 'Extended Brunch',
    description: 'Full brunch menu until close on weekends.',
  ),
  _EventItem(
    date: 'Seasonal',
    title: 'Feiertage Specials',
    description:
        'Limited menu drops around holidays — follow Instagram for dates.',
  ),
];

/// The Events tab: recurring specials and seasonal one-offs from [_events].
class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: _events.length,
      itemBuilder: (context, index) {
        final event = _events[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.espresso,
            border: Border.all(color: AppColors.tan.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.date.toUpperCase(),
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: 11,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                event.title,
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(fontSize: 22),
              ),
              const SizedBox(height: 6),
              Text(
                event.description,
                style: TextStyle(color: AppColors.tan, fontSize: 14),
              ),
            ],
          ),
        );
      },
    );
  }
}
