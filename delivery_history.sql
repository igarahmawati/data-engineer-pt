SELECT  ku_user.id AS user id,
        ku_user.name AS user name,
        ku_user.email AS user email,
        ku_user.phone AS user phone number,
        ku_order_datail.delivery_date AS delivery date,
        ku_order_datail.quantity AS quantity,
        ku_product.name AS product,
        ku_category.name AS category,
        ku_user_location.address AS delivery address
    FROM ku_user
    JOIN ku_order ON ku_user.id=ku_order.user_id
    JOIN ku_order_status ON ku_order.status=ku_order_status.id
    JOIN ku_order_datail ON ku_order.id=ku_order_detail.order_id
    JOIN ku_order_detail ON ku_user_location.id=ku_order_datail.user_location_id
    JOIN ku_order_datail ON ku_product.id=ku_order_datail.product_id
    JOIN ku_product ON ku_product_category.product_id=ku_product.id
    JOIN ku_product_category ON ku ku_category.id=ku_product_category.category_id
    WHERE ku_order_status.id=2 AND ku_order_status.created_at >='2019-09-01' AND ku_order_status.created_at < '2019-10-01'
    ORDER BY ku_order_datail.delivery_date ASC, ku_user.id ASC
    )
