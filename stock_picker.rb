def stock_picker(stock_prices)
    last_index = stock_prices.length - 1

    stock_prices.each_with_index.reduce(0) do |total_highest_gain, (element, index)|
        current_buying_price = stock_prices[index]

        current_price_highest_gain = stock_prices[index..last_index].reduce(0) do |highest_gain, current_selling_price|
            net_gain = current_selling_price - current_buying_price
            net_gain > highest_gain ? net_gain : highest_gain
        end

        current_price_highest_gain > total_highest_gain ? current_price_highest_gain : total_highest_gain
    end
end

p stock_picker([17,3,6,9,15,8,6,1,10])