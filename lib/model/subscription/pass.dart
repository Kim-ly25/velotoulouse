enum PassType { daily, monthly, annual }

class Pass {
  final String id;
  final String userId;
  final PassType type;
  final double price;
  final DateTime purchasedAt;
  final DateTime expiresAt;

  const Pass({
    required this.id,
    required this.userId,
    required this.type,
    required this.price,
    required this.purchasedAt,
    required this.expiresAt,
  });

  bool get isValid => DateTime.now().isBefore(expiresAt);

  String get label {
    switch (type) {
      case PassType.daily:
        return 'Daily Pass';
      case PassType.monthly:
        return 'Monthly Pass';
      case PassType.annual:
        return 'Annual Pass';
    }
  }

  String get description {
    switch (type) {
      case PassType.daily:
        return 'Perfect for visitors. Valid 24 hours';
      case PassType.monthly:
        return 'Unlimited rides. Valid 30 days';
      case PassType.annual:
        return 'Best value. Valid 1 year';
    }
  }

  String get validity {
    switch (type) {
      case PassType.daily:
        return 'Unlimited rides for 24 hours';
      case PassType.monthly:
        return 'Unlimited rides for 30 days';
      case PassType.annual:
        return 'Unlimited rides for 1 year';
    }
  }

  Pass copyWith({
    String? id,
    String? userId,
    PassType? type,
    double? price,
    DateTime? purchasedAt,
    DateTime? expiresAt,
  }) {
    return Pass(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      price: price ?? this.price,
      purchasedAt: purchasedAt ?? this.purchasedAt,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }
}

class PassOption {
  final PassType type;
  final double price;
  final String label;
  final String description;

  const PassOption({
    required this.type,
    required this.price,
    required this.label,
    required this.description,
  });

  static List<PassOption> get all => [
        const PassOption(
          type: PassType.daily,
          price: 3.00,
          label: 'Daily Pass',
          description: 'Perfect for visitors. Valid 24 hours',
        ),
        const PassOption(
          type: PassType.monthly,
          price: 14.50,
          label: 'Monthly Pass',
          description: 'Unlimited rides. Valid 30 days',
        ),
        const PassOption(
          type: PassType.annual,
          price: 99.00,
          label: 'Annual Pass',
          description: 'Best value. Valid 1 year',
        ),
      ];

  Duration get duration {
    switch (type) {
      case PassType.daily:
        return const Duration(hours: 24);
      case PassType.monthly:
        return const Duration(days: 30);
      case PassType.annual:
        return const Duration(days: 365);
    }
  }
}