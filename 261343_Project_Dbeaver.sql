CREATE table menus(
	menu_id int ,
	name varchar ,
	description varchar ,
	price int ,
	category_id int ,
	PRIMARY KEY(menu_id) ,
	FOREIGN KEY(menu_id) REFERENCES categories(id)
) ;

CREATE table categories(
	id int ,
	name varchar ,
	PRIMARY KEY(id) 
) ;

CREATE table customers( 
	id int ,
	name varchar ,
	email varchar ,
	phone_number varchar ,
	address varchar ,
	wish_id int unique ,
	basket_id int ,
	PRIMARY KEY(id) ,
	FOREIGN KEY(wish_id) REFERENCES wishlist(wish_id),
	FOREIGN KEY(basket_id) REFERENCES basket(basket_id )
) ;

CREATE table orders( 
	order_id int ,
	customer_id int ,
	datetime varchar ,
	PRIMARY KEY(order_id) ,
	FOREIGN KEY(order_id) REFERENCES customers(id)
) ;

CREATE table order_items( 
	order_item_id int ,
	order_id int ,
	menu_id int ,
	quantity int ,
	PRIMARY KEY(order_item_id) ,
	FOREIGN KEY(order_item_id) REFERENCES menus(menu_id) ,
	FOREIGN KEY(order_item_id) REFERENCES orders(order_id)
) ;

CREATE table wishlist(
	wish_id int ,
	PRIMARY KEY(wish_id)
) ;

CREATE table haswishlist(
	wish_id int ,
	menu_id int ,
	rank int ,
	quantity int ,
	PRIMARY KEY(wish_id,menu_id) ,
	FOREIGN KEY(wish_id) REFERENCES wishlist(wish_id) ,
	FOREIGN KEY(menu_id) REFERENCES menus(menu_id) 
);

CREATE table basket(
	basket_id int ,
	PRIMARY KEY(basket_id) 
);

CREATE table contains(
	menu_id int ,
	basket_id int ,
	quantity int ,
	PRIMARY KEY(menu_id,basket_id),
	FOREIGN KEY(menu_id) REFERENCES menus(menu_id) ,
	FOREIGN KEY(basket_id) REFERENCES basket(basket_id)
);

