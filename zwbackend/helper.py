
def to_string_price(price):
    price_string = str(price)[:4].replace('.',',')
    if price_string[-1] is ',':
        price_string = price_string[:-1]
    return price_string
