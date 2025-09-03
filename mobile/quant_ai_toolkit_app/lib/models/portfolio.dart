class Portfolio {
  final String id;
  final String name;
  final double totalValue;
  final double totalChange;
  final double totalChangePercent;
  final List<PortfolioItem> items;
  final DateTime createdAt;
  final DateTime updatedAt;

  Portfolio({
    required this.id,
    required this.name,
    required this.totalValue,
    required this.totalChange,
    required this.totalChangePercent,
    required this.items,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Portfolio.fromJson(Map<String, dynamic> json) {
    return Portfolio(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      totalValue: (json['totalValue'] ?? 0.0).toDouble(),
      totalChange: (json['totalChange'] ?? 0.0).toDouble(),
      totalChangePercent: (json['totalChangePercent'] ?? 0.0).toDouble(),
      items: (json['items'] as List?)
          ?.map((item) => PortfolioItem.fromJson(item))
          .toList() ?? [],
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'totalValue': totalValue,
      'totalChange': totalChange,
      'totalChangePercent': totalChangePercent,
      'items': items.map((item) => item.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  bool get isPositive => totalChange >= 0;
  bool get isNegative => totalChange < 0;
}

class PortfolioItem {
  final String symbol;
  final String name;
  final int quantity;
  final double averagePrice;
  final double currentPrice;
  final double totalValue;
  final double totalChange;
  final double totalChangePercent;

  PortfolioItem({
    required this.symbol,
    required this.name,
    required this.quantity,
    required this.averagePrice,
    required this.currentPrice,
    required this.totalValue,
    required this.totalChange,
    required this.totalChangePercent,
  });

  factory PortfolioItem.fromJson(Map<String, dynamic> json) {
    return PortfolioItem(
      symbol: json['symbol'] ?? '',
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? 0,
      averagePrice: (json['averagePrice'] ?? 0.0).toDouble(),
      currentPrice: (json['currentPrice'] ?? 0.0).toDouble(),
      totalValue: (json['totalValue'] ?? 0.0).toDouble(),
      totalChange: (json['totalChange'] ?? 0.0).toDouble(),
      totalChangePercent: (json['totalChangePercent'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'name': name,
      'quantity': quantity,
      'averagePrice': averagePrice,
      'currentPrice': currentPrice,
      'totalValue': totalValue,
      'totalChange': totalChange,
      'totalChangePercent': totalChangePercent,
    };
  }

  bool get isPositive => totalChange >= 0;
  bool get isNegative => totalChange < 0;
}
