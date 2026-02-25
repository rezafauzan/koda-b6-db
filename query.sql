-- 1 product agregasikan dengan nama product, variant, size, final price

SELECT products.name product_name, product_variants.variant_name variant, product_portions.portion_size size, (products.price + product_variants.additional_price + product_portions.additional_price) final_price FROM products JOIN product_variants ON product_variants.product_id = products.id JOIN product_portions ON product_portions.product_id = products.id WHERE products.id = 4 AND product_variants.id = 7 AND product_portions.id = 10;

SELECT product_name, variant, size, quantity, price FROM (
    SELECT products.name product_name, product_variants.variant_name variant, product_portions.portion_size size, (10) quantity,((products.price + product_variants.additional_price + product_portions.additional_price) * 10) price FROM products JOIN product_variants ON product_variants.product_id = products.id JOIN product_portions ON product_portions.product_id = products.id WHERE products.id = 4 AND product_variants.id = 7 AND product_portions.id = 9
    UNION ALL
    SELECT products.name product_name, product_variants.variant_name variant, product_portions.portion_size size, (10) quantity,((products.price + product_variants.additional_price + product_portions.additional_price) * 10) price FROM products JOIN product_variants ON product_variants.product_id = products.id JOIN product_portions ON product_portions.product_id = products.id WHERE products.id = 2 AND product_variants.id = 4 AND product_portions.id = 5
    UNION ALL
    SELECT products.name product_name, product_variants.variant_name variant, product_portions.portion_size size, (10) quantity,((products.price + product_variants.additional_price + product_portions.additional_price) * 10) price FROM products JOIN product_variants ON product_variants.product_id = products.id JOIN product_portions ON product_portions.product_id = products.id WHERE products.id = 1 AND product_variants.id = 2 AND product_portions.id = 1
    UNION ALL
    SELECT products.name product_name, product_variants.variant_name variant, product_portions.portion_size size, (10) quantity,((products.price + product_variants.additional_price + product_portions.additional_price) * 10) price FROM products JOIN product_variants ON product_variants.product_id = products.id JOIN product_portions ON product_portions.product_id = products.id WHERE products.id = 5 AND product_variants.id = 9 AND product_portions.id = 12
) as order_items;

SELECT SUM(price) AS sub_total FROM (
    SELECT products.name product_name, product_variants.variant_name variant, product_portions.portion_size size, (10) quantity,((products.price + product_variants.additional_price + product_portions.additional_price) * 10) price FROM products JOIN product_variants ON product_variants.product_id = products.id JOIN product_portions ON product_portions.product_id = products.id WHERE products.id IN (4,2,1,5) AND product_variants.id IN (7,4,2,9) AND product_portions.id IN (9,5,1,12)
);