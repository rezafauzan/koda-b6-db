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

SELECT id, name, description, images, price, discount, rating, review, stock

SELECT products.id, products.name, products.description, discount.discount_rate as discount, products.price, products.stock, product_reviews.rating as rating, product_reviews.messages as review, CONCAT(user_profiles.first_name, ' ', user_profiles.last_name) as fullname, user_profiles.user_avatar FROM products JOIN ( SELECT product_campaigns.id, product_campaigns.name, product_discounts.discount_rate FROM product_campaigns JOIN product_discounts ON product_discounts.id = product_campaigns.discount_id) as discount ON discount.id = products.campaign_id JOIN product_reviews ON product_reviews.product_id = products.id JOIN users ON users.id = product_reviews.user_id JOIN user_profiles ON user_profiles.user_id = users.id;

SELECT products.id, products.name, products.description, discount.name as product_campaigns_name, discount.description as product_campaigns_description, discount.discount_rate as discount, products.price, products.stock, product_reviews.rating as rating FROM products JOIN ( SELECT product_campaigns.id, product_campaigns.name, product_campaigns.description, product_discounts.discount_rate FROM product_campaigns JOIN product_discounts ON product_discounts.id = product_campaigns.discount_id) as discount ON discount.id = products.campaign_id JOIN product_reviews ON product_reviews.product_id = products.id;