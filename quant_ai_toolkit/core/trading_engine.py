"""
Trading Engine: Core component for strategy execution and backtesting
"""

import pandas as pd
import numpy as np
from typing import Dict, List, Optional
from dataclasses import dataclass
from datetime import datetime, timedelta

@dataclass
class Trade:
    symbol: str
    side: str  # 'buy' or 'sell'
    quantity: float
    price: float
    timestamp: datetime
    order_id: str

@dataclass
class Position:
    symbol: str
    quantity: float
    avg_price: float
    unrealized_pnl: float
    realized_pnl: float

class TradingEngine:
    """
    Core trading engine for strategy execution and backtesting.
    
    Features:
    - Real-time order execution
    - Strategy backtesting
    - Position management
    - Risk controls
    - Performance tracking
    """
    
    def __init__(self):
        self.positions = {}
        self.trades = []
        self.cash = 1000000  # Starting capital
        self.commission_rate = 0.001  # 0.1% commission
        
    def place_order(self, symbol: str, side: str, quantity: float, 
                   price: Optional[float] = None, order_type: str = 'market'):
        """
        Place a trading order.
        
        Args:
            symbol: Stock symbol
            side: 'buy' or 'sell'
            quantity: Number of shares
            price: Limit price (if applicable)
            order_type: 'market' or 'limit'
            
        Returns:
            Trade: Executed trade
        """
        # Simulate order execution
        execution_price = price or self._get_market_price(symbol)
        
        # Calculate commission
        commission = abs(quantity * execution_price * self.commission_rate)
        
        # Update cash
        if side == 'buy':
            self.cash -= (quantity * execution_price + commission)
        else:
            self.cash += (quantity * execution_price - commission)
        
        # Update position
        self._update_position(symbol, side, quantity, execution_price)
        
        # Record trade
        trade = Trade(
            symbol=symbol,
            side=side,
            quantity=quantity,
            price=execution_price,
            timestamp=datetime.now(),
            order_id=f"order_{len(self.trades)}"
        )
        self.trades.append(trade)
        
        return trade
    
    def backtest(self, strategy_config: Dict) -> Dict:
        """
        Backtest a trading strategy.
        
        Args:
            strategy_config: Strategy configuration
            
        Returns:
            Dict containing backtest results
        """
        # Initialize backtest
        initial_capital = self.cash
        portfolio_values = []
        trades = []
        
        # Get historical data
        data = self._get_historical_data(strategy_config['symbol'], 
                                       strategy_config['start_date'],
                                       strategy_config['end_date'])
        
        # Run strategy
        for date, row in data.iterrows():
            signal = self._generate_signal(row, strategy_config)
            
            if signal != 0:
                side = 'buy' if signal > 0 else 'sell'
                quantity = abs(signal)
                trade = self.place_order(strategy_config['symbol'], side, quantity)
                trades.append(trade)
            
            # Calculate portfolio value
            portfolio_value = self._calculate_portfolio_value(data.loc[:date])
            portfolio_values.append({
                'date': date,
                'value': portfolio_value,
                'cash': self.cash
            })
        
        # Calculate performance metrics
        returns = pd.Series([pv['value'] for pv in portfolio_values])
        total_return = (returns.iloc[-1] - initial_capital) / initial_capital
        sharpe_ratio = self._calculate_sharpe_ratio(returns)
        max_drawdown = self._calculate_max_drawdown(returns)
        
        return {
            'total_return': total_return,
            'sharpe_ratio': sharpe_ratio,
            'max_drawdown': max_drawdown,
            'trades': trades,
            'portfolio_values': portfolio_values,
            'final_value': returns.iloc[-1]
        }
    
    def _get_market_price(self, symbol: str) -> float:
        """Get current market price for a symbol."""
        # Placeholder - would integrate with real market data
        return 100.0
    
    def _update_position(self, symbol: str, side: str, quantity: float, price: float):
        """Update position after trade execution."""
        if symbol not in self.positions:
            self.positions[symbol] = Position(symbol, 0, 0, 0, 0)
        
        pos = self.positions[symbol]
        
        if side == 'buy':
            new_quantity = pos.quantity + quantity
            new_avg_price = ((pos.quantity * pos.avg_price) + (quantity * price)) / new_quantity
            pos.quantity = new_quantity
            pos.avg_price = new_avg_price
        else:
            pos.quantity -= quantity
            if pos.quantity < 0:
                raise ValueError("Insufficient position for sell order")
    
    def _get_historical_data(self, symbol: str, start_date: str, end_date: str) -> pd.DataFrame:
        """Get historical data for backtesting."""
        # Placeholder - would integrate with data provider
        dates = pd.date_range(start_date, end_date, freq='D')
        return pd.DataFrame({
            'close': np.random.randn(len(dates)).cumsum() + 100,
            'volume': np.random.randint(1000, 10000, len(dates))
        }, index=dates)
    
    def _generate_signal(self, data_row: pd.Series, config: Dict) -> float:
        """Generate trading signal based on strategy."""
        # Simple moving average crossover strategy
        if 'ma_short' in config and 'ma_long' in config:
            if data_row['close'] > config['ma_short'] and data_row['close'] < config['ma_long']:
                return 100  # Buy signal
            elif data_row['close'] < config['ma_short'] and data_row['close'] > config['ma_long']:
                return -100  # Sell signal
        return 0
    
    def _calculate_portfolio_value(self, data: pd.DataFrame) -> float:
        """Calculate current portfolio value."""
        portfolio_value = self.cash
        for symbol, position in self.positions.items():
            if position.quantity > 0:
                current_price = data['close'].iloc[-1] if not data.empty else 100
                portfolio_value += position.quantity * current_price
        return portfolio_value
    
    def _calculate_sharpe_ratio(self, returns: pd.Series) -> float:
        """Calculate Sharpe ratio."""
        if len(returns) < 2:
            return 0
        return (returns.pct_change().mean() / returns.pct_change().std()) * np.sqrt(252)
    
    def _calculate_max_drawdown(self, returns: pd.Series) -> float:
        """Calculate maximum drawdown."""
        cumulative = (1 + returns.pct_change()).cumprod()
        running_max = cumulative.expanding().max()
        drawdown = (cumulative - running_max) / running_max
        return drawdown.min()
