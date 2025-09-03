class AIPrediction {
  final String symbol;
  final double currentPrice;
  final double predictedPrice;
  final double confidence;
  final String predictionType; // 'short_term', 'medium_term', 'long_term'
  final DateTime predictionDate;
  final DateTime targetDate;
  final Map<String, dynamic> modelMetrics;
  final List<String> factors;

  AIPrediction({
    required this.symbol,
    required this.currentPrice,
    required this.predictedPrice,
    required this.confidence,
    required this.predictionType,
    required this.predictionDate,
    required this.targetDate,
    required this.modelMetrics,
    required this.factors,
  });

  factory AIPrediction.fromJson(Map<String, dynamic> json) {
    return AIPrediction(
      symbol: json['symbol'] ?? '',
      currentPrice: (json['currentPrice'] ?? 0.0).toDouble(),
      predictedPrice: (json['predictedPrice'] ?? 0.0).toDouble(),
      confidence: (json['confidence'] ?? 0.0).toDouble(),
      predictionType: json['predictionType'] ?? '',
      predictionDate: DateTime.parse(json['predictionDate'] ?? DateTime.now().toIso8601String()),
      targetDate: DateTime.parse(json['targetDate'] ?? DateTime.now().toIso8601String()),
      modelMetrics: json['modelMetrics'] ?? {},
      factors: List<String>.from(json['factors'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'currentPrice': currentPrice,
      'predictedPrice': predictedPrice,
      'confidence': confidence,
      'predictionType': predictionType,
      'predictionDate': predictionDate.toIso8601String(),
      'targetDate': targetDate.toIso8601String(),
      'modelMetrics': modelMetrics,
      'factors': factors,
    };
  }

  double get priceChange => predictedPrice - currentPrice;
  double get priceChangePercent => (priceChange / currentPrice) * 100;
  bool get isBullish => predictedPrice > currentPrice;
  bool get isBearish => predictedPrice < currentPrice;
  String get recommendation {
    if (confidence >= 0.8) {
      return isBullish ? 'Strong Buy' : 'Strong Sell';
    } else if (confidence >= 0.6) {
      return isBullish ? 'Buy' : 'Sell';
    } else if (confidence >= 0.4) {
      return 'Hold';
    } else {
      return 'No Recommendation';
    }
  }
}
