
enum PassType { daily, monthly, annual }

class PassPlan {
  final PassType type;
  final double price;
  final String label;
  final String description;

  const PassPlan({
    required this.type,
    required this.price,
    required this.label,
    required this.description,
  });

  String get displayPrice => '\$${price.toStringAsFixed(2)}';
}
