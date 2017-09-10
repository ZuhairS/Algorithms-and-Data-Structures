def bsso(stocks)
  min_stock, max_profit = stocks.first, 0

  stocks.each do |stock|
    current_profit = stock - min_stock
    min_stock = [stock, min_stock].min
    max_profit = [current_profit, max_profit].max
  end

  max_profit
end

test = [310, 315, 275, 295, 260, 270, 290, 230, 255, 250]

p bsso(test)
