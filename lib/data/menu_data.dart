/// Menu content — kept in sync with the website's menu section
/// (naomis-coffee-club/index.html).
library;

/// A single menu item: what it is, what's in it, and what it costs.
///
/// Rendered by `MenuScreen` inside its category's section.
class MenuItem {
  /// The dish or drink name, as printed on the menu.
  final String name;

  /// Short ingredient line, e.g. "eggs, avocado, sourdough, seasonal
  /// sides". Left `null` for self-explanatory items like "Espresso".
  final String? description;

  /// Price, pre-formatted with its currency symbol (e.g. `"€14.50"`).
  final String price;

  const MenuItem({
    required this.name,
    this.description,
    required this.price,
  });
}

/// A named group of [MenuItem]s, e.g. "Brunch" or "Coffee".
class MenuCategory {
  /// Section heading shown above its items.
  final String name;

  /// The items in this category, in menu order.
  final List<MenuItem> items;

  const MenuCategory({
    required this.name,
    required this.items,
  });
}

/// The full menu, grouped by category, in the order shown on `MenuScreen`.
///
/// This is the only place menu content lives — add, remove, or re-order
/// items and categories here.
const List<MenuCategory> menuData = [
  MenuCategory(
    name: 'Brunch',
    items: [
      MenuItem(
        name: "Naomi's Brunch Plate",
        description: 'eggs, avocado, sourdough, seasonal sides',
        price: '€14.50',
      ),
      MenuItem(
        name: 'Crispy Fried Egg, Herb Yogurt & Sourdough',
        price: '€11.00',
      ),
      MenuItem(
        name: 'Granola Bowl',
        description: 'banana, passionfruit, coconut',
        price: '€9.50',
      ),
    ],
  ),
  MenuCategory(
    name: 'Coffee',
    items: [
      MenuItem(name: 'Espresso', price: '€3.00'),
      MenuItem(name: 'Flat White', price: '€4.20'),
      MenuItem(
        name: 'Espresso Orange',
        description: 'iced, signature',
        price: '€5.50',
      ),
    ],
  ),
  MenuCategory(
    name: 'Bites',
    items: [
      MenuItem(name: 'Falafel & Hummus Plate', price: '€10.00'),
      MenuItem(
        name: 'Sourdough Toast',
        description: 'whipped feta, honey',
        price: '€8.50',
      ),
    ],
  ),
  MenuCategory(
    name: 'Drinks',
    items: [
      MenuItem(name: 'Iced Matcha Latte', price: '€5.00'),
      MenuItem(name: 'Fresh Orange & Ginger Juice', price: '€5.50'),
    ],
  ),
  MenuCategory(
    name: 'Sweets',
    items: [
      MenuItem(name: 'Daily Bakery Pastry', price: '€4.00'),
    ],
  ),
];
