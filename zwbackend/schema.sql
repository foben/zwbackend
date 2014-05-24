drop table if exists store;
create table store (
  id integer primary key autoincrement,
  name text not null
);

drop table if exists purchase;
create table purchase (
  id integer primary key autoincrement,
  name text not null,
  storeid integer,
  FOREIGN KEY(storeid) REFERENCES store(id)
);

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

drop table if exists category;
create table category (
  id integer primary key autoincrement,
  name text not null,
  parentid integer,
  FOREIGN KEY(parentid) REFERENCES category(id)
);
