create database aia;

use aia;

create table
    cart (cart_id int (11) primary key auto_increment);

use kaylios;

select
    *
from
    follow_system fs;

alter table users
add column f_name varchar(50) after user_id;

alter table users
add column l_name varchar(50) after f_name;

use aia;
create table
    cart (
        cart_id int (11) primary key auto_increment,
        user_id int (11) not null, -- use a join in the query
        quantity int (3) not null,
        num_of_items int (4) not null,
        sub_total decimal(10, 2),
        tax_code varchar(30),
        created_at datetime
    );