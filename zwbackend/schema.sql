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

insert into purchase (timestamp, storeid) values (1394477761, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 18.71, 4, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 15.3, 4, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 17.52, 4, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 7.26, 4, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 12.79, 4, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 13.5, 4, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 6.37, 4, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 14.04, 4, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 11.26, 4, 2);

insert into purchase (timestamp, storeid) values (1394477761, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 14.98, 5, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 12.5, 5, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 9.85, 5, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 10.37, 5, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 18.94, 5, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 2.28, 5, 5);

insert into purchase (timestamp, storeid) values (1394477761, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 11.03, 6, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 9.31, 6, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 18.64, 6, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 10.89, 6, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 1.18, 6, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 0.22, 6, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 11.37, 6, 4);

insert into purchase (timestamp, storeid) values (1394477761, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 0.48, 7, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 9.95, 7, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 14.67, 7, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 19.5, 7, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 10.38, 7, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 7.83, 7, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 8.74, 7, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 19.99, 7, 3);

insert into purchase (timestamp, storeid) values (1394477761, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 7.72, 8, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 12.68, 8, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 3.11, 8, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 9.42, 8, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 15.61, 8, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 8.6, 8, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 0.86, 8, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 4.33, 8, 1);

insert into purchase (timestamp, storeid) values (1394477761, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 1.42, 9, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 14.69, 9, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 8.05, 9, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 4.27, 9, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 19.57, 9, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 3.32, 9, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 18.0, 9, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 13.09, 9, 4);

insert into purchase (timestamp, storeid) values (1394477761, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 2.81, 10, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 9.64, 10, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 9.34, 10, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 15.15, 10, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 8.04, 10, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 1.46, 10, 4);

insert into purchase (timestamp, storeid) values (1394477761, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 14.04, 11, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 13.6, 11, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 7.21, 11, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 10.07, 11, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 2.22, 11, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 8.16, 11, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 7.55, 11, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 16.61, 11, 8);

insert into purchase (timestamp, storeid) values (1394477761, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 8.98, 12, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 17.34, 12, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 7.22, 12, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 12.38, 12, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 19.13, 12, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 9.95, 12, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 19.74, 12, 1);

insert into purchase (timestamp, storeid) values (1394477761, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 16.79, 13, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 8.39, 13, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 1.71, 13, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 16.41, 13, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 17.28, 13, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 2.95, 13, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 11.12, 13, 5);

insert into purchase (timestamp, storeid) values (1394477761, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 17.16, 14, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 14.95, 14, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 2.95, 14, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 8.54, 14, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 13.44, 14, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 0.45, 14, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 10.28, 14, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 19.79, 14, 8);

insert into purchase (timestamp, storeid) values (1394477761, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 5.21, 15, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 19.99, 15, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 6.1, 15, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 15.21, 15, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 3.58, 15, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 17.88, 15, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 8.92, 15, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 8.22, 15, 1);

insert into purchase (timestamp, storeid) values (1394477761, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 13.57, 16, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 15.84, 16, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 11.82, 16, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 5.95, 16, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 10.33, 16, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 2.03, 16, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 17.38, 16, 3);

insert into purchase (timestamp, storeid) values (1394477761, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 5.54, 17, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 12.49, 17, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 2.36, 17, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 4.99, 17, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 9.12, 17, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 13.2, 17, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 17.94, 17, 2);

insert into purchase (timestamp, storeid) values (1394477761, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 9.95, 18, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 2.41, 18, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 5.88, 18, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 10.44, 18, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 9.48, 18, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 18.56, 18, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 18.21, 18, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 16.47, 18, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 10.77, 18, 1);

insert into purchase (timestamp, storeid) values (1394477761, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 12.98, 19, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 1.83, 19, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 0.44, 19, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 14.63, 19, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 14.26, 19, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 12.23, 19, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 15.32, 19, 4);

insert into purchase (timestamp, storeid) values (1394477761, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 11.91, 20, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 15.02, 20, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 16.23, 20, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 2.29, 20, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 2.85, 20, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 19.64, 20, 1);

insert into purchase (timestamp, storeid) values (1394477761, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 18.19, 21, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 8.58, 21, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 11.83, 21, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 2.74, 21, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 3.64, 21, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 2.51, 21, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 14.76, 21, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 11.62, 21, 3);

insert into purchase (timestamp, storeid) values (1394477761, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 19.59, 22, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 18.49, 22, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 5.5, 22, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 7.18, 22, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 19.95, 22, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 7.75, 22, 4);

insert into purchase (timestamp, storeid) values (1394477761, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 16.52, 23, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 16.52, 23, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 14.85, 23, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 18.43, 23, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 9.53, 23, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 9.97, 23, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 15.94, 23, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 15.89, 23, 1);

insert into purchase (timestamp, storeid) values (1394477761, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 3.52, 24, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 3.24, 24, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 14.93, 24, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 17.06, 24, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 3.22, 24, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 19.7, 24, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 1.76, 24, 3);

insert into purchase (timestamp, storeid) values (1394477761, 6);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 0.37, 25, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 14.16, 25, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 12.55, 25, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 12.5, 25, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 17.2, 25, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 1.37, 25, 4);

insert into purchase (timestamp, storeid) values (1394477761, 6);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 6.93, 26, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 0.64, 26, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 11.6, 26, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 0.76, 26, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 4.59, 26, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 9.14, 26, 7);

insert into purchase (timestamp, storeid) values (1394477761, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 1.21, 27, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 12.8, 27, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 13.13, 27, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 0.54, 27, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 19.06, 27, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 13.5, 27, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 6.67, 27, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 5.99, 27, 4);

insert into purchase (timestamp, storeid) values (1394477761, 6);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 18.29, 28, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 13.83, 28, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 3.3, 28, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 10.88, 28, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 7.3, 28, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 14.91, 28, 3);

insert into purchase (timestamp, storeid) values (1394477761, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 16.98, 29, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 0.81, 29, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 4.56, 29, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 1.15, 29, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 14.23, 29, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 1.75, 29, 8);
