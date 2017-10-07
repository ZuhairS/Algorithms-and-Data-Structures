def stock_profit(stocks)
  return stocks if stocks.length < 2
  min_stock, max_profit = stocks[0], 0

  stocks.each do |price|
    current_profit = price - min_stock
    min_stock = [price, min_stock].min
    max_profit = [current_profit, max_profit].max
  end

  max_profit
end

p stock_profit([100, 180, 260, 310, 40, 535, 695])
