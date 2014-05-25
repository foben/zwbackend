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

insert into purchase (timestamp, storeid) values (1394477761, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 9.9, 2, 4, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 6.27, 3, 4, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 19.34, 5, 4, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 6.05, 3, 4, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 2.51, 5, 4, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 1.72, 2, 4, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 12.85, 3, 4, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 8.19, 2, 4, 3);

insert into purchase (timestamp, storeid) values (1394477761, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 4.73, 2, 5, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 3.27, 1, 5, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 17.54, 5, 5, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 4.46, 2, 5, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 10.06, 4, 5, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 15.62, 1, 5, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 11.94, 3, 5, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 8.68, 3, 5, 1);

insert into purchase (timestamp, storeid) values (1394477761, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 8.68, 5, 6, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 3.02, 2, 6, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 17.63, 2, 6, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 2.44, 2, 6, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 8.43, 3, 6, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 10.73, 2, 6, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 10.1, 3, 6, 5);

insert into purchase (timestamp, storeid) values (1394477761, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 3.18, 3, 7, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 16.05, 3, 7, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 6.46, 3, 7, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 10.38, 5, 7, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 16.45, 3, 7, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 6.18, 1, 7, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 17.18, 2, 7, 1);

insert into purchase (timestamp, storeid) values (1394477761, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 3.15, 5, 8, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 9.71, 5, 8, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 4.35, 3, 8, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 11.97, 5, 8, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 3.66, 5, 8, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 19.31, 1, 8, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 5.2, 4, 8, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 0.25, 5, 8, 2);

insert into purchase (timestamp, storeid) values (1394477761, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 18.31, 2, 9, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 9.29, 5, 9, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 0.92, 4, 9, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 9.82, 4, 9, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 18.04, 5, 9, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 5.94, 2, 9, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 13.52, 2, 9, 2);

insert into purchase (timestamp, storeid) values (1394477761, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 2.04, 2, 10, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 18.05, 5, 10, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 4.79, 4, 10, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 17.25, 2, 10, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 15.94, 3, 10, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 2.75, 3, 10, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 0.26, 5, 10, 4);

insert into purchase (timestamp, storeid) values (1394477761, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 13.83, 5, 11, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 17.65, 3, 11, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 2.66, 3, 11, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 6.25, 3, 11, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 1.19, 2, 11, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 4.22, 5, 11, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 13.6, 1, 11, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 7.88, 2, 11, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 5.27, 2, 11, 2);

insert into purchase (timestamp, storeid) values (1394477761, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 14.98, 3, 12, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 0.87, 2, 12, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 9.45, 2, 12, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 7.8, 4, 12, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 19.77, 3, 12, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 13.78, 1, 12, 5);

insert into purchase (timestamp, storeid) values (1394477761, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 11.54, 1, 13, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 1.12, 4, 13, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 17.24, 1, 13, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 15.71, 2, 13, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 4.29, 3, 13, 4);

insert into purchase (timestamp, storeid) values (1394477761, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 7.76, 1, 14, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 15.95, 3, 14, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 19.97, 5, 14, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 13.46, 4, 14, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 9.0, 4, 14, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 11.63, 3, 14, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 0.76, 3, 14, 8);

insert into purchase (timestamp, storeid) values (1394477761, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 1.74, 2, 15, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 3.94, 4, 15, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 7.8, 4, 15, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 1.2, 5, 15, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 0.86, 2, 15, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 8.2, 4, 15, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 13.69, 4, 15, 4);

insert into purchase (timestamp, storeid) values (1394477761, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 14.79, 5, 16, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 5.41, 3, 16, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 15.04, 5, 16, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 11.96, 2, 16, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 15.57, 2, 16, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 7.35, 1, 16, 4);

insert into purchase (timestamp, storeid) values (1394477761, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 8.78, 2, 17, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 3.29, 2, 17, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 2.86, 1, 17, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 15.28, 5, 17, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 8.03, 2, 17, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 15.58, 5, 17, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 16.22, 5, 17, 3);

insert into purchase (timestamp, storeid) values (1394477761, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 19.14, 5, 18, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 16.75, 5, 18, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 6.94, 1, 18, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 15.11, 1, 18, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 16.03, 1, 18, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 6.09, 4, 18, 4);

insert into purchase (timestamp, storeid) values (1394477761, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 19.01, 5, 19, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 3.79, 3, 19, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 9.87, 1, 19, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 7.59, 5, 19, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 4.66, 5, 19, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 11.27, 2, 19, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 6.06, 1, 19, 1);

insert into purchase (timestamp, storeid) values (1394477761, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 5.95, 3, 20, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 4.54, 2, 20, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 15.31, 3, 20, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 4.26, 5, 20, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 11.9, 1, 20, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 13.2, 1, 20, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 15.67, 5, 20, 4);

insert into purchase (timestamp, storeid) values (1394477761, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 6.99, 1, 21, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 8.96, 3, 21, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 5.7, 2, 21, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 1.06, 5, 21, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 5.41, 2, 21, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 17.88, 4, 21, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 1.81, 2, 21, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 11.47, 3, 21, 7);

insert into purchase (timestamp, storeid) values (1394477761, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 3.15, 4, 22, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 2.86, 2, 22, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 3.44, 2, 22, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 12.01, 3, 22, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 16.09, 5, 22, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 10.02, 5, 22, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 4.74, 3, 22, 4);

insert into purchase (timestamp, storeid) values (1394477761, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 1.25, 4, 23, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 5.65, 2, 23, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 3.02, 1, 23, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 15.15, 5, 23, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 3.72, 5, 23, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 14.18, 1, 23, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 7.58, 2, 23, 5);

insert into purchase (timestamp, storeid) values (1394477761, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 0.21, 2, 24, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 7.92, 1, 24, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 19.2, 2, 24, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 15.89, 4, 24, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 5.9, 5, 24, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 1.36, 2, 24, 7);

insert into purchase (timestamp, storeid) values (1394477761, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 13.19, 3, 25, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 19.36, 2, 25, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 13.99, 2, 25, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 9.05, 5, 25, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 1.03, 3, 25, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 15.14, 4, 25, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 16.6, 5, 25, 8);

insert into purchase (timestamp, storeid) values (1394477761, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 2.81, 2, 26, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 19.54, 4, 26, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 18.15, 2, 26, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 6.91, 2, 26, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 7.91, 3, 26, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 0.19, 2, 26, 4);

insert into purchase (timestamp, storeid) values (1394477761, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 12.67, 2, 27, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 17.68, 5, 27, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 3.77, 5, 27, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 3.68, 3, 27, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 1.25, 5, 27, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 10.69, 4, 27, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 1.07, 3, 27, 2);

insert into purchase (timestamp, storeid) values (1394477761, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 9.31, 5, 28, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 12.12, 5, 28, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 9.53, 5, 28, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 4.56, 1, 28, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 3.35, 2, 28, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 2.07, 5, 28, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 10.55, 3, 28, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 3.33, 4, 28, 3);

insert into purchase (timestamp, storeid) values (1394477761, 6);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 18.49, 3, 29, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 9.73, 5, 29, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 9.84, 2, 29, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 4.59, 2, 29, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 13.32, 4, 29, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 11.32, 4, 29, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 19.02, 3, 29, 4);
