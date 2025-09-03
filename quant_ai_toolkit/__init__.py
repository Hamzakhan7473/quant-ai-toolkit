"""
Quant-AI-Toolkit: The Next Generation AI-Powered Quantitative Trading Platform

A comprehensive toolkit for quantitative trading, combining cutting-edge AI/ML models
with institutional-grade financial analytics.
"""

__version__ = "1.0.0"
__author__ = "Quant-AI-Toolkit Team"
__email__ = "contact@quant-ai-toolkit.com"

from .core.trading_engine import TradingEngine
from .models.predictor import PricePredictor
from .data.market_data import MarketDataProvider
from .analytics.portfolio import PortfolioAnalytics
from .risk.risk_manager import RiskManager

class QuantAIToolkit:
    """
    Main interface for Quant-AI-Toolkit platform.
    
    Provides access to all major components including:
    - AI/ML prediction models
    - Market data management
    - Portfolio analytics
    - Risk management
    - Trading execution
    """
    
    def __init__(self, config=None):
        """
        Initialize the Quant-AI-Toolkit platform.
        
        Args:
            config (dict, optional): Configuration dictionary
        """
        self.config = config or {}
        self.trading_engine = TradingEngine()
        self.predictor = PricePredictor()
        self.market_data = MarketDataProvider()
        self.portfolio_analytics = PortfolioAnalytics()
        self.risk_manager = RiskManager()
        
    def get_market_data(self, symbol, period='1d', interval='1m'):
        """
        Get real-time market data for a given symbol.
        
        Args:
            symbol (str): Stock symbol (e.g., 'AAPL')
            period (str): Time period (e.g., '1d', '5d', '1mo')
            interval (str): Data interval (e.g., '1m', '5m', '1h')
            
        Returns:
            pd.DataFrame: Market data
        """
        return self.market_data.get_data(symbol, period, interval)
    
    def predict_price(self, symbol, horizon='1d', model='lstm'):
        """
        Predict future price using AI models.
        
        Args:
            symbol (str): Stock symbol
            horizon (str): Prediction horizon
            model (str): Model type ('lstm', 'transformer', 'ensemble')
            
        Returns:
            dict: Prediction results
        """
        return self.predictor.predict(symbol, horizon, model)
    
    def backtest_strategy(self, strategy_config):
        """
        Backtest a trading strategy.
        
        Args:
            strategy_config (dict): Strategy configuration
            
        Returns:
            dict: Backtest results
        """
        return self.trading_engine.backtest(strategy_config)
    
    def optimize_portfolio(self, assets, constraints=None):
        """
        Optimize portfolio allocation using AI.
        
        Args:
            assets (list): List of asset symbols
            constraints (dict, optional): Optimization constraints
            
        Returns:
            dict: Optimal portfolio weights
        """
        return self.portfolio_analytics.optimize(assets, constraints)
    
    def calculate_risk_metrics(self, portfolio):
        """
        Calculate comprehensive risk metrics.
        
        Args:
            portfolio (dict): Portfolio data
            
        Returns:
            dict: Risk metrics (VaR, CVaR, Sharpe ratio, etc.)
        """
        return self.risk_manager.calculate_metrics(portfolio)

# Convenience imports
__all__ = [
    'QuantAIToolkit',
    'TradingEngine',
    'PricePredictor',
    'MarketDataProvider',
    'PortfolioAnalytics',
    'RiskManager'
]
