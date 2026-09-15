import 'package:flutter/material.dart';

import '../data/menu_data.dart';
import '../theme/app_theme.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: menuData.length,
      itemBuilder: (context, categoryIndex) {
        final category = menuData[categoryIndex];
        return Padding(
          padding: const EdgeInsets.only(bottom: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(category.name, style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Divider(color: AppColors.tan.withValues(alpha: 0.3)),
              ...category.items.map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.name, style: textTheme.bodyLarge),
                            if (item.description != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text(
                                  item.description!,
                                  style: TextStyle(
                                    color: AppColors.tan,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        item.price,
                        style: textTheme.titleLarge?.copyWith(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
