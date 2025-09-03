import 'package:flutter/material.dart';

class MarketSummary extends StatelessWidget {
  const MarketSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Market Summary',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMarketIndex('S&P 500', '4,567.89', '+23.45', '+0.52%', true),
                _buildMarketIndex('NASDAQ', '14,234.56', '-12.34', '-0.09%', false),
                _buildMarketIndex('DOW', '35,678.90', '+45.67', '+0.13%', true),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMarketIndex('VIX', '18.45', '-1.23', '-6.25%', true),
                _buildMarketIndex('USD', '1.0856', '+0.0023', '+0.21%', true),
                _buildMarketIndex('GOLD', '2,045.67', '+15.43', '+0.76%', true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketIndex(String name, String value, String change, String changePercent, bool isPositive) {
    return Expanded(
      child: Column(
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            change,
            style: TextStyle(
              fontSize: 12,
              color: isPositive ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            changePercent,
            style: TextStyle(
              fontSize: 10,
              color: isPositive ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
