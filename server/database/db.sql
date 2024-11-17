create database if not exists all_in_all;

use all_in_all;

create table
    products (
        prod_id int (11) primary key auto_increment,
        prod_category_id int (11) not null,
        customer_id int (11) not null,
        prod_name varchar(100) not null,
        foreign key (`prod_category_id`) references `product_category` (`prod_category_id`),
        foreign key (`customer_id`) references `customers` (`customer_id`)
    );

create table
    product_category (
        prod_category_id int (11) primary key auto_increment,
        prod_category_name varchar(50) not null,
        created_at datetime default current_timestamp
    );

create table
    customers (
        customer_id int (11) primary key auto_increment,
        first_name varchar(30) not null,
            
    );