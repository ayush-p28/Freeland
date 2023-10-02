-- Queries for table creation:-

create database free_db;
use free_db;

create table tags
(
tag_id int auto_increment primary key,
name varchar(50) not null
);


create table categories
(
category_id int auto_increment primary key,
name varchar(100) not null
);


create table states
(
state_id int auto_increment primary key,
name varchar(50) not null,
alias varchar(5) not null
);

create table user_types
(
user_type_id int auto_increment primary key,
name varchar
);

create table skills
(
skill_id int auto_increment primary key,
name varchar(40) not null
);


create table status
(
status_id int auto_increment primary key,
name varchar(45) not null
);


create table post_status
(
post_status_id int auto_increment primary key,
name varchar(100) not null
);


create table cities
(
city_id int auto_increment,
name varchar(50) not null,
state_id int not null,
primary key (city_id),
constraint fk_cities_states foreign key (state_id) references states (state_id)
);

create table users
(
user_id int auto_increment,
name varchar(50) not null,
email varchar(270) not null unique key,
password varchar(200) not null,
address varchar(500),
city_id int,
status_id int not null,
otp varchar(6),
rating varchar(5) not null,
contact int not null,
about_me varchar(500),
user_type_id int,
primary key (user_id),
constraint fk_users_cities foreign key (city_id) references cities (city_id),
constraint fk_users_status foreign key (status_id) references status (status_id),
constraint fk_users_user_types foreign key (user_type_id) references user_types (user_type_id)
);

create table freelancer_skills
(
freelancer_skill_id int auto_increment,
user_id int not null,
skill_id int not null,
primary key (freelancer_skill_id),
constraint fk_freelancerskills_users foreign key (user_id) references users (user_id),
constraint fk_freelancerskills_skills foreign key (skill_id) references skills (skill_id)
);


create table subcategories
(
subcategory_id int auto_increment,
name varchar(100) not null,
category_id int not null,
primary key(subcategory_id),
constraint fk_subcategories_categories foreign key (category_id) references categories (category_id)
);

create table posts
(
post_id int auto_increment,
name varchar(100) not null,
description varchar(1500) not null,
user_id int not null,
subcategory_id int not null,
date varchar(20) not null,
deadline varchar(20),
post_status_id int not null,
primary key (post_id),
constraint fk_posts_users foreign key (user_id) references users (user_id),
constraint fk_posts_subcategory foreign key (subcategory_id) references Subcategories (subcategory_id),
constraint fk_posts_poststatus foreign key (post_status_id) references post_status (post_status_id)
);

ALTER TABLE posts MODIFY date varchar(20) null;
ALTER TABLE posts MODIFY deadline varchar(20);


create table post_tags
(
post_tag_id int auto_increment,
post_id int not null,
tag_id int not null,
primary key (post_tag_id),
constraint fk_posttags_posts foreign key (post_id) references posts (post_id) ON DELETE CASCADE,
constraint fk_posttags_tags foreign key (tag_id) references tags (tag_id)
);


create table messages
(
message_id int auto_increment,
bid_id int not null,
message varchar(250),
datetime datetime not null,
who boolean,
primary key (message_id),
constraint fk_messages_bids foreign key (bid_id) references bids (bid_id) ON DELETE CASCADE
);

create table bids
(
bid_id int auto_increment,
bid_amount int not null,
post_id int not null,
user_id int not null,
days int,
date date not null,
status_id int not null,
rating int,
primary key (bid_id),
constraint fk_bids_posts foreign key (post_id) references posts (post_id) ON DELETE CASCADE,
constraint fk_bids_users foreign key (user_id) references users (user_id),
constraint fk_bids_status foreign key (status_id) references status (status_id)
);

-- ===================================================================================

-- Queries to insert The Values

-- userTypes
insert into user_types (name)
values
('user'),
('freelancer');


-- status
insert into status (name)
values
('active'),
('inactive'),
('blocked');

-- postStatus
insert into post_status (name)
values
('public'),
('private'),
('ongoing'),
('ended'),
('closed'),
('alloted');

insert into user_types (name)
values
(0),
(1);


create table projects
(
project_id int auto_increment,
title varchar(100) not null,
description varchar(1500) not null,
ptitle varchar(100) not null,
pdescription varchar(1500) not null,
subcategory_id int not null,
delivery int not null,
revisions int not null,
price int not null,
user_id int not null,
post_status_id int not null,
primary key (project_id),
constraint fk_projects_users foreign key (user_id) references users (user_id),
constraint fk_projects_subcategory foreign key (subcategory_id) references Subcategories (subcategory_id),
constraint fk_projects_poststatus foreign key (post_status_id) references post_status (post_status_id)
);
-- constraint fk_projects_users foreign key (user_id) references users (user_id) ON DELETE CASCADE,


-- =====================================

create table project_tags
(
project_tag_id int auto_increment,
project_id int not null,
tag_id int not null,
primary key (project_tag_id),
constraint fk_project_tags foreign key (project_id) references projects (project_id) ON DELETE CASCADE,
constraint fk_projecttags foreign key (tag_id) references tags (tag_id)
);

create table project_images
(
    project_image_id int auto_increment primary key,
    project_id int not null,
    constraint fk_projectimages_projects foreign key (project_id) references projects (project_id) ON DELETE CASCADE,
    project_image_path varchar(100) not null
);


UPDATE users SET user_type_id = 2 WHERE user_id=8;