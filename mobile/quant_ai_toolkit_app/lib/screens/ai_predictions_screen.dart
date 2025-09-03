import 'package:flutter/material.dart';
import 'package:quant_ai_toolkit_app/models/ai_prediction.dart';
import 'package:quant_ai_toolkit_app/widgets/prediction_card.dart';

class AIPredictionsScreen extends StatefulWidget {
  const AIPredictionsScreen({super.key});

  @override
  State<AIPredictionsScreen> createState() => _AIPredictionsScreenState();
}

class _AIPredictionsScreenState extends State<AIPredictionsScreen> {
  final List<AIPrediction> _predictions = [
    AIPrediction(
      symbol: 'AAPL',
      currentPrice: 175.43,
      predictedPrice: 182.50,
      confidence: 0.85,
      predictionType: 'short_term',
      predictionDate: DateTime.now(),
      targetDate: DateTime.now().add(const Duration(days: 7)),
      modelMetrics: {
        'accuracy': 0.87,
        'precision': 0.82,
        'recall': 0.89,
      },
      factors: [
        'Technical indicators showing bullish momentum',
        'Strong earnings expectations',
        'Positive market sentiment',
        'Institutional buying pressure',
      ],
    ),
    AIPrediction(
      symbol: 'TSLA',
      currentPrice: 248.50,
      predictedPrice: 235.20,
      confidence: 0.72,
      predictionType: 'short_term',
      predictionDate: DateTime.now(),
      targetDate: DateTime.now().add(const Duration(days: 7)),
      modelMetrics: {
        'accuracy': 0.79,
        'precision': 0.75,
        'recall': 0.81,
      },
      factors: [
        'Overbought conditions detected',
        'Profit taking expected',
        'Technical resistance at $250',
        'Market volatility concerns',
      ],
    ),
    AIPrediction(
      symbol: 'MSFT',
      currentPrice: 378.85,
      predictedPrice: 395.00,
      confidence: 0.91,
      predictionType: 'medium_term',
      predictionDate: DateTime.now(),
      targetDate: DateTime.now().add(const Duration(days: 30)),
      modelMetrics: {
        'accuracy': 0.93,
        'precision': 0.89,
        'recall': 0.91,
      },
      factors: [
        'Strong cloud services growth',
        'AI integration success',
        'Market leadership position',
        'Stable financial performance',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Predictions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // TODO: Refresh predictions
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to AI settings
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // TODO: Implement refresh functionality
          await Future.delayed(const Duration(seconds: 1));
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // AI Model Status
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.psychology,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'AI Model Status',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Model Accuracy: 87%'),
                        Text('Last Updated: 2 min ago'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 0.87,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Predictions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Latest Predictions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to all predictions screen
                  },
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Prediction Cards
            ..._predictions.map((prediction) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: PredictionCard(prediction: prediction),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Generate new prediction
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
