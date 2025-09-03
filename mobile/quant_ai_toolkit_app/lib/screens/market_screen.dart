import 'package:flutter/material.dart';
import 'package:quant_ai_toolkit_app/models/stock.dart';
import 'package:quant_ai_toolkit_app/widgets/stock_card.dart';
import 'package:quant_ai_toolkit_app/widgets/market_summary.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final List<Stock> _stocks = [
    Stock(
      symbol: 'AAPL',
      name: 'Apple Inc.',
      currentPrice: 175.43,
      change: 2.15,
      changePercent: 1.24,
      high: 176.50,
      low: 173.20,
      open: 174.30,
      previousClose: 173.28,
      volume: 45678900,
      marketCap: 2750000000000,
      peRatio: 28.5,
      dividendYield: 0.5,
      sector: 'Technology',
      industry: 'Consumer Electronics',
    ),
    Stock(
      symbol: 'GOOGL',
      name: 'Alphabet Inc.',
      currentPrice: 142.56,
      change: -1.23,
      changePercent: -0.85,
      high: 144.20,
      low: 141.80,
      open: 143.79,
      previousClose: 143.79,
      volume: 23456700,
      marketCap: 1800000000000,
      peRatio: 25.8,
      dividendYield: 0.0,
      sector: 'Technology',
      industry: 'Internet Services',
    ),
    Stock(
      symbol: 'MSFT',
      name: 'Microsoft Corporation',
      currentPrice: 378.85,
      change: 5.67,
      changePercent: 1.52,
      high: 380.10,
      low: 375.20,
      open: 373.18,
      previousClose: 373.18,
      volume: 18923400,
      marketCap: 2800000000000,
      peRatio: 32.1,
      dividendYield: 0.8,
      sector: 'Technology',
      industry: 'Software',
    ),
    Stock(
      symbol: 'TSLA',
      name: 'Tesla, Inc.',
      currentPrice: 248.50,
      change: 12.30,
      changePercent: 5.21,
      high: 250.75,
      low: 240.10,
      open: 236.20,
      previousClose: 236.20,
      volume: 67890100,
      marketCap: 790000000000,
      peRatio: 45.2,
      dividendYield: 0.0,
      sector: 'Automotive',
      industry: 'Electric Vehicles',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implement filter functionality
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
            // Market Summary
            const MarketSummary(),
            const SizedBox(height: 20),
            
            // Market Movers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Market Movers',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to full market movers screen
                  },
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Stock Cards
            ..._stocks.map((stock) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: StockCard(stock: stock),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to watchlist or add stock
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
