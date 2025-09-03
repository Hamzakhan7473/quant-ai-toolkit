import 'package:flutter/material.dart';
import 'package:quant_ai_toolkit_app/models/portfolio.dart';
import 'package:quant_ai_toolkit_app/widgets/portfolio_summary.dart';
import 'package:quant_ai_toolkit_app/widgets/portfolio_item_card.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  late Portfolio _portfolio;

  @override
  void initState() {
    super.initState();
    _portfolio = Portfolio(
      id: '1',
      name: 'Main Portfolio',
      totalValue: 125000.0,
      totalChange: 3250.0,
      totalChangePercent: 2.67,
      items: [
        PortfolioItem(
          symbol: 'AAPL',
          name: 'Apple Inc.',
          quantity: 50,
          averagePrice: 165.0,
          currentPrice: 175.43,
          totalValue: 8771.5,
          totalChange: 521.5,
          totalChangePercent: 6.32,
        ),
        PortfolioItem(
          symbol: 'GOOGL',
          name: 'Alphabet Inc.',
          quantity: 30,
          averagePrice: 140.0,
          currentPrice: 142.56,
          totalValue: 4276.8,
          totalChange: 76.8,
          totalChangePercent: 1.83,
        ),
        PortfolioItem(
          symbol: 'MSFT',
          name: 'Microsoft Corporation',
          quantity: 25,
          averagePrice: 350.0,
          currentPrice: 378.85,
          totalValue: 9471.25,
          totalChange: 721.25,
          totalChangePercent: 8.23,
        ),
        PortfolioItem(
          symbol: 'TSLA',
          name: 'Tesla, Inc.',
          quantity: 40,
          averagePrice: 220.0,
          currentPrice: 248.50,
          totalValue: 9940.0,
          totalChange: 1140.0,
          totalChangePercent: 12.95,
        ),
      ],
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: Navigate to add stock screen
            },
          ),
          IconButton(
            icon: const Icon(Icons.analytics),
            onPressed: () {
              // TODO: Navigate to analytics screen
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
            // Portfolio Summary
            PortfolioSummary(portfolio: _portfolio),
            const SizedBox(height: 20),
            
            // Portfolio Items
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Holdings',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to detailed holdings screen
                  },
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Portfolio Item Cards
            ..._portfolio.items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: PortfolioItemCard(item: item),
            )),
          ],
        ),
      ),
    );
  }
}
