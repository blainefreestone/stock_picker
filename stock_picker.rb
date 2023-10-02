def stock_picker(stock_prices)
    last_index = stock_prices.length - 1

    stock_prices.each_with_index.reduce(Array.new(3,0)) do |total_price_info, (element, index)|
        current_buying_price = stock_prices[index]

        current_price_info = stock_prices[index..last_index].each_with_index.reduce(Array.new(2,0)) do |current_price_info, (current_selling_price, inner_index)|
            net_gain = current_selling_price - current_buying_price
            net_gain > current_price_info[1] ? [inner_index + index, net_gain] : current_price_info
        end

        current_price_info[1] > total_price_info[2] ? [index, current_price_info[0], current_price_info[1]] : total_price_info
    end[0..1]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
p stock_picker([1,2,4,5,6,7,8,9,9,1])
p stock_picker([3,2,1,2,3])
p stock_picker([98,1005,38,100])