def cart_prod(a, b)

    a.each do |elema|
        b.each do |elemb|
            yield [elema, elemb]
        end
    end

end

x = [":a", ":b", ":c"]
y = [ 4, 5]

cart_prod(x, y) do |item|
    p item
end