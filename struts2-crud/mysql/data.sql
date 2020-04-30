use struts2_crud;

create table app_user (id bigint not null auto_increment, address varchar(150), country varchar(100), city varchar(50) not null, province varchar(100), postal_code varchar(15) not null, version integer, account_enabled bit, password varchar(255) not null, username varchar(50) not null unique, email varchar(255) not null unique, password_hint varchar(255), first_name varchar(50) not null, last_name varchar(50) not null, phone_number varchar(255), website varchar(255), account_expired bit not null, account_locked bit not null, credentials_expired bit not null, primary key (id)) ENGINE=InnoDB;
create table person (id bigint not null auto_increment, firstName varchar(255), lastName varchar(255), primary key (id)) ENGINE=InnoDB;
create table role (id bigint not null auto_increment, name varchar(20), description varchar(64), primary key (id)) ENGINE=InnoDB;
create table user_role (user_id bigint not null, role_id bigint not null, primary key (user_id, role_id)) ENGINE=InnoDB;
alter table user_role add index FK143BF46A4FD90D75 (role_id), add constraint FK143BF46A4FD90D75 foreign key (role_id) references role (id);
alter table user_role add index FK143BF46AF503D155 (user_id), add constraint FK143BF46AF503D155 foreign key (user_id) references app_user (id);

insert into app_user (id, city, postal_code, account_enabled, password, username, email, first_name, last_name, account_expired, account_locked, credentials_expired) values (1,"New York", "10011", 1, "12dea96fec20593566ab75692c9949596833adc9", "user", "user@here.com", "User", "User", 0, 0, 0);
insert into app_user (id, city, postal_code, account_enabled, password, username, email, first_name, last_name, account_expired, account_locked, credentials_expired) values (2,"New York", "10011", 1, "d033e22ae348aeb5660fc2140aec35850c4da997", "admin", "admin@here.com", "User", "User", 0, 0, 0);

insert into role (id, name, description) values (1, "ROLE_ADMIN", "");
insert into role (id, name, description) values (2, "ROLE_USER", "");

insert into user_role (user_id, role_id) values (1, 2);
insert into user_role (user_id, role_id) values (2, 1);
