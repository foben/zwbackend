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

insert into purchase (timestamp, storeid) values (1374616800, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 5.38, 5, 4, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 16.28, 1, 4, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 8.47, 2, 4, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 18.09, 1, 4, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 12.25, 2, 4, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 7.49, 4, 4, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 7.34, 3, 4, 5);

insert into purchase (timestamp, storeid) values (1372975200, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 14.87, 2, 5, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 13.54, 5, 5, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 9.41, 5, 5, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 4.23, 1, 5, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 5.75, 2, 5, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 11.81, 5, 5, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 6.95, 4, 5, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 0.77, 1, 5, 4);

insert into purchase (timestamp, storeid) values (1376517600, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 8.45, 4, 6, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 18.41, 5, 6, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 14.05, 3, 6, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 5.46, 1, 6, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 9.78, 4, 6, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 15.42, 5, 6, 4);

insert into purchase (timestamp, storeid) values (1373061600, 6);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 17.38, 1, 7, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 7.17, 4, 7, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 13.78, 5, 7, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 5.81, 2, 7, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 6.16, 4, 7, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 17.43, 1, 7, 1);

insert into purchase (timestamp, storeid) values (1366668000, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 1.89, 2, 8, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 0.07, 1, 8, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 3.64, 4, 8, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 7.59, 4, 8, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 13.48, 3, 8, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 4.36, 3, 8, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 12.11, 4, 8, 4);

insert into purchase (timestamp, storeid) values (1379714400, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 18.0, 2, 9, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 6.87, 1, 9, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 11.26, 1, 9, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 7.68, 5, 9, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 17.43, 5, 9, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 0.84, 1, 9, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 6.99, 5, 9, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 0.1, 5, 9, 4);

insert into purchase (timestamp, storeid) values (1358290800, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 19.53, 5, 10, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 18.1, 1, 10, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 3.52, 1, 10, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 15.64, 4, 10, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 3.31, 5, 10, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 4.46, 5, 10, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 10.92, 3, 10, 1);

insert into purchase (timestamp, storeid) values (1372629600, 6);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 9.37, 4, 11, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 15.35, 2, 11, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 4.41, 4, 11, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 18.56, 2, 11, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 1.31, 1, 11, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 10.88, 5, 11, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 19.99, 2, 11, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 5.73, 2, 11, 8);

insert into purchase (timestamp, storeid) values (1376172000, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 15.93, 1, 12, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 18.39, 1, 12, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 19.76, 3, 12, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 19.33, 3, 12, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 15.72, 5, 12, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 0.86, 3, 12, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 7.5, 1, 12, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 16.26, 5, 12, 1);

insert into purchase (timestamp, storeid) values (1366581600, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 14.86, 1, 13, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 13.1, 3, 13, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 19.89, 4, 13, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 11.1, 2, 13, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 0.38, 2, 13, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 16.66, 2, 13, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 2.92, 3, 13, 4);

insert into purchase (timestamp, storeid) values (1375567200, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 5.78, 1, 14, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 2.97, 5, 14, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 16.49, 1, 14, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 1.87, 1, 14, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 5.4, 5, 14, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 3.04, 5, 14, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 6.24, 5, 14, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 7.73, 1, 14, 2);

insert into purchase (timestamp, storeid) values (1383951600, 6);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 0.28, 2, 15, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 7.12, 4, 15, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 16.85, 5, 15, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 18.21, 2, 15, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 10.42, 3, 15, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 2.89, 4, 15, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 5.15, 4, 15, 7);

insert into purchase (timestamp, storeid) values (1358895600, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 17.69, 3, 16, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 14.01, 4, 16, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 10.74, 4, 16, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 12.18, 3, 16, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 10.99, 1, 16, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 11.57, 3, 16, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 4.87, 2, 16, 1);

insert into purchase (timestamp, storeid) values (1357945200, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 13.04, 3, 17, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 16.64, 4, 17, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 11.98, 2, 17, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 10.56, 2, 17, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 19.42, 4, 17, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 17.08, 3, 17, 8);

insert into purchase (timestamp, storeid) values (1381960800, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 7.07, 5, 18, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 1.38, 2, 18, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 16.18, 1, 18, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 6.68, 4, 18, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 9.95, 4, 18, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 19.66, 5, 18, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 6.45, 5, 18, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 12.88, 5, 18, 4);

insert into purchase (timestamp, storeid) values (1382652000, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 16.04, 2, 19, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 5.91, 2, 19, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 10.29, 5, 19, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 19.3, 2, 19, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 2.51, 4, 19, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 6.72, 1, 19, 8);

insert into purchase (timestamp, storeid) values (1386543600, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 7.34, 1, 20, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 6.12, 1, 20, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 18.94, 1, 20, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 16.47, 2, 20, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 9.69, 3, 20, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 2.97, 2, 20, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 18.34, 2, 20, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 4.57, 4, 20, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 3.94, 1, 20, 1);

insert into purchase (timestamp, storeid) values (1376863200, 6);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 6.11, 5, 21, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 5.8, 1, 21, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 14.39, 2, 21, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHNITTLAUCH", 19.72, 5, 21, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 13.72, 5, 21, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 11.71, 3, 21, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 18.44, 5, 21, 5);

insert into purchase (timestamp, storeid) values (1358377200, 6);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 12.56, 4, 22, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 1.45, 4, 22, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 18.65, 4, 22, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 19.53, 4, 22, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 17.97, 5, 22, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 11.28, 5, 22, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 2.97, 3, 22, 1);

insert into purchase (timestamp, storeid) values (1374616800, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 14.66, 2, 23, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 16.23, 4, 23, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 7.54, 2, 23, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 15.18, 5, 23, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 18.42, 2, 23, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 14.03, 3, 23, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 3.24, 2, 23, 4);

insert into purchase (timestamp, storeid) values (1365285600, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SPAGHETTI", 17.48, 2, 24, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 1.41, 5, 24, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 2.36, 4, 24, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 5.15, 1, 24, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 18.48, 1, 24, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 18.73, 4, 24, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PFIRSISCH", 9.95, 3, 24, 1);

insert into purchase (timestamp, storeid) values (1382306400, 6);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZITRONE", 15.3, 4, 25, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 17.09, 2, 25, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 19.83, 2, 25, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 9.42, 4, 25, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 9.84, 4, 25, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 18.26, 1, 25, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 14.28, 5, 25, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 5.57, 2, 25, 3);

insert into purchase (timestamp, storeid) values (1362006000, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 16.41, 1, 26, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 19.44, 3, 26, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 19.94, 4, 26, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ROGGENBROT", 1.98, 4, 26, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 3.13, 4, 26, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("EDAMER", 6.9, 5, 26, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 1.58, 5, 26, 5);

insert into purchase (timestamp, storeid) values (1375394400, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 14.0, 5, 27, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 2.07, 3, 27, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 18.47, 5, 27, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ANANAS", 6.99, 1, 27, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 18.66, 3, 27, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("DINKELSEMMELN", 6.08, 4, 27, 3);
insert into item (name, price, quantity, purchaseid, categoryid) values ("SCHMELZKES", 19.38, 3, 27, 4);

insert into purchase (timestamp, storeid) values (1369692000, 7);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 14.73, 4, 28, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("ZWIEBEL", 0.55, 4, 28, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("RIGATONI", 7.67, 1, 28, 8);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 16.62, 3, 28, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("TILSITER", 11.19, 4, 28, 4);

insert into purchase (timestamp, storeid) values (1360882800, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("PAPRIKA", 5.1, 1, 29, 5);
insert into item (name, price, quantity, purchaseid, categoryid) values ("BANANE", 8.68, 2, 29, 1);
insert into item (name, price, quantity, purchaseid, categoryid) values ("FORELLE", 8.22, 1, 29, 2);
insert into item (name, price, quantity, purchaseid, categoryid) values ("GOUDA", 4.22, 3, 29, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("CAMEMBERT", 13.96, 1, 29, 4);
insert into item (name, price, quantity, purchaseid, categoryid) values ("MANDELN", 4.37, 4, 29, 7);
