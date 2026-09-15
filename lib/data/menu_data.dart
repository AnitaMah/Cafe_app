/// Menu content — kept in sync with the website's menu section
/// (naomis-coffee-club/index.html).
class MenuItem {
  final String name;
  final String? description;
  final String price;

  const MenuItem({
    required this.name,
    this.description,
    required this.price,
  });
}

class MenuCategory {
  final String name;
  final List<MenuItem> items;

  const MenuCategory({
    required this.name,
    required this.items,
  });
}

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
