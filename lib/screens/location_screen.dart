import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  static final Uri _mapsUri = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=AB+13,+Heilbronn,+Germany',
  );

  Future<void> _openMaps() async {
    await launchUrl(_mapsUri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'VISIT',
            style: TextStyle(
              color: AppColors.accent,
              letterSpacing: 2,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Text('Find us', style: textTheme.headlineMedium),
          const SizedBox(height: 20),
          Text(
            'AB 13\nHeilbronn, Germany',
            style: textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.normal,
              color: AppColors.cream,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          const _HoursRow(label: 'Brunch', hours: '9:00 – 15:00'),
          const _HoursRow(label: 'Mon – Thu', hours: '9:00 – 21:00'),
          const _HoursRow(label: 'Fri – Sun', hours: '9:00 – 23:00'),
          const SizedBox(height: 16),
          Text(
            'No reservations — just come as you are.',
            style: TextStyle(
              color: AppColors.tan,
              fontStyle: FontStyle.italic,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 28),
          ElevatedButton.icon(
            onPressed: _openMaps,
            icon: const Icon(Icons.map_outlined),
            label: const Text('Open in Maps'),
          ),
        ],
      ),
    );
  }
}

class _HoursRow extends StatelessWidget {
  final String label;
  final String hours;

  const _HoursRow({required this.label, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          Text(hours, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
