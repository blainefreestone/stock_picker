def stock_picker(stock_prices)
    last_index = stock_prices.length - 1

    stock_prices.each_with_index.reduce(0) do |total_highest_gain, (element, index)|
        current_buying_price = stock_prices[index]

        current_price_info = stock_prices[index..last_index].reduce(Array.new(2,0)) do |current_price_info, current_selling_price|
            net_gain = current_selling_price - current_buying_price
            net_gain > current_price_info[1] ? [current_selling_price,net_gain] : current_price_info
        end

        current_price_info[1] > total_highest_gain ? current_price_info[1] : total_highest_gain
    end
end

p stock_picker([17,3,6,9,15,8,6,1,10])