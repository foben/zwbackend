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
(1400939632, 1), (1400948006, 1);

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
("CHERRYTOMATE BIO", 1.29, 1, 1, 1),
("BLAETTERTEIG", 1.75, 1, 2, 1),
("JA ! AUFSCHNITT", 1.39, 1, 2, 1),
("KIWI BIO", 1.29, 1, 3, 1),
("CHERRYTOMATE BIO", 1.29, 1, 3, 1);

drop table if exists category;
create table category (
  id integer primary key autoincrement,
  name text not null,
  parentid integer,
  FOREIGN KEY(parentid) REFERENCES category(id)
);

insert into category (name, parentid) values
("Obst", null),
("Fisch", null),
("Backwaren", null),
("Käse", null),
("Gemüse", null),
("Getränk", null),
("Nüsse", null),
("Nudeln", null);

drop table if exists mappings;
create table mappings (
    id integer primary key autoincrement,
    item text not null,
    categoryid integer,
    FOREIGN KEY(categoryid) REFERENCES category(id)
);

insert into mappings (item, categoryid) values
("810 MEHRKORNBR.", 3),
("KRONE LACHS", 2),
("JA ! AUFSCHNITT", 4),
("TAGLIA.HILDLACHS", 2),
("MANGO BIO", 1),
("BLAETTERTEIG", 3),
("KNUBL.NEUTRAL", 5),
("KIWI BIO", 1),
("CHERRYTUMATE BIO", 5),
("MEHRKDNSBHNITTE", 3),
("APFEL SCIFRESH", 1);

-- dummy Daten
insert into store (name) values ('Tengelmann');
insert into store (name) values ('Edeka');
insert into store (name) values ('Kaufland');
insert into store (name) values ('Penny');
insert into store (name) values ('Netto');

insert into mappings (item, categoryid) values ("BIONADE", 6);
insert into mappings (item, categoryid) values ("MANDELN", 7);
insert into mappings (item, categoryid) values ("ZITRONE", 1);
insert into mappings (item, categoryid) values ("ZWIEBEL", 5);
insert into mappings (item, categoryid) values ("PAPRIKA", 5);
insert into mappings (item, categoryid) values ("BANANE", 1);
insert into mappings (item, categoryid) values ("FORELLE", 2);
insert into mappings (item, categoryid) values ("SCHNITTLAUCH", 5);
insert into mappings (item, categoryid) values ("ANANAS", 1);
insert into mappings (item, categoryid) values ("RIGATONI", 8);
insert into mappings (item, categoryid) values ("SPAGHETTI", 8);
insert into mappings (item, categoryid) values ("ROGGENBROT", 3);
insert into mappings (item, categoryid) values ("DINKELSEMMELN", 3);
insert into mappings (item, categoryid) values ("CAMEMBERT", 4);
insert into mappings (item, categoryid) values ("TILSITER", 4);
insert into mappings (item, categoryid) values ("EDAMER", 4);
insert into mappings (item, categoryid) values ("GOUDA", 4);
insert into mappings (item, categoryid) values ("SCHMELZKES", 4);
insert into mappings (item, categoryid) values ("PFIRSISCH", 1);
