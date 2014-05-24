drop table if exists store;
create table store (
  id integer primary key autoincrement,
  name text not null
);

insert into store (name) values ('REWE'), ('LIDL'),('ALDI');

drop table if exists purchase;
create table purchase (
  id integer primary key autoincrement,
  timestamp integer not null,
  storeid integer,
  FOREIGN KEY(storeid) REFERENCES store(id)
);

insert into purchase (timestamp, storeid) values (1394477761, 1),
(1400939632, 1), (1400949632, 1);

drop table if exists item;
create table item (
  id integer primary key autoincrement,
  name text not null,
  price real,
  quantity integer,
  purchaseid integer,
  categoryid integer,
  FOREIGN KEY(purchaseid) REFERENCES purchase(id),
  FOREIGN KEY(categoryid) REFERENCES category(id)
);

insert into item (name, price, quantity, purchaseid, categoryid) values
("beck's", 4.75, 1, 1, 3),
("brötchen", 0.45, 4, 1, 2),
("dr. best", 1.99, 1, 1, 2),
("BIO MEHRKORNBR", 2.25, 1, 1, 1),
("BLAETTERTEIG", 1.75, 1, 1, 1),
("JA ! AUFSCHNITT", 1.39, 1, 1, 1),
("KIWI BIO", 1.29, 1, 1, 1),
("CHERRYTOMATE BIO", 1.29, 1, 1, 1);

drop table if exists category;
create table category (
  id integer primary key autoincrement,
  name text not null,
  parentid integer,
  FOREIGN KEY(parentid) REFERENCES category(id)
);

insert into category (name, parentid) values
("LEBENSMITTEL", null),
("HYGIENE", null),
("ALKOHOL", null);
