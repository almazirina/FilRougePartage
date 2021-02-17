drop database if exists filRouge;

create database filRouge default character set utf8;

use filRouge;

CREATE TABLE categories(
   cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   cat_nom VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE soucateg(
   soucat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   soucat_nom VARCHAR(50) NOT NULL,
   cat_id INT,
   FOREIGN KEY(cat_id) REFERENCES categories(cat_id)
) ENGINE=InnoDB;

CREATE TABLE fournisseurs(
   fou_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   fou_nom VARCHAR(50) NOT NULL,
   fou_adresse VARCHAR(150) NOT NULL,
   fou_tel VARCHAR(50) NOT NULL,
   fou_contact VARCHAR(150) NOT NULL,
   fou_mail VARCHAR(50) NOT NULL,
   fou_pays VARCHAR(50) NOT NULL,
   fou_ville VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE produits(
   pro_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   pro_nom VARCHAR(50) NOT NULL,
   pro_lib VARCHAR(50) NOT NULL,
   pro_desc VARCHAR(150) NOT NULL,
   pro_photo VARCHAR(50) NOT NULL,
   pro_prix DECIMAL(15,2) NOT NULL,
   pro_stock INT NOT NULL,
   pro_stock_alert INT NOT NULL,
   pro_date_ajout DATETIME NOT NULL,
   pro_publ TINYINT(1) NOT NULL,
   pro_cat_id INT NOT NULL,
   pro_fou_id INT NOT NULL,
   FOREIGN KEY(pro_cat_id) REFERENCES categories(cat_id),
   FOREIGN KEY(pro_fou_id) REFERENCES fournisseurs(fou_id)
) ENGINE=InnoDB;

CREATE TABLE livraisons(
   liv_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   liv_status CHAR(3) NOT NULL,
   liv_adresse VARCHAR(150) NOT NULL,
   liv_remarque VARCHAR(250)
) ENGINE=InnoDB;

CREATE TABLE salaries(
   sal_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   sal_nom VARCHAR(50) NOT NULL,
   sal_prenom VARCHAR(50) NOT NULL,
   sal_adresse VARCHAR(150),
   sal_tel VARCHAR(10) NOT NULL,
   sal_mail VARCHAR(30) NOT NULL,
   sal_enfants INT,
   sal_date_entree DATE NOT NULL
) ENGINE=InnoDB;


CREATE TABLE clients(
   cli_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   cli_nom VARCHAR(50) NOT NULL,
   cli_prenom VARCHAR(50) NOT NULL,
   cli_adresse VARCHAR(150) NOT NULL,
   cli_tel VARCHAR(10) NOT NULL,
   cli_mail VARCHAR(50) NOT NULL,
   cli_ref VARCHAR(50) NOT NULL,
   cli_type TINYINT(1) NOT NULL,
   coeff DECIMAL(7,2) NOT NULL,
   cli_sal_id INT,
   FOREIGN KEY(cli_sal_id) REFERENCES salaries(sal_id)
) ENGINE=InnoDB;

CREATE TABLE commandes(
   com_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   com_date DATETIME NOT NULL,
   reduc DECIMAL(15,2) NOT NULL,
   paie_date DATETIME NOT NULL,
   paie_type VARCHAR(10) NOT NULL,
   com_sal_id INT,
   com_cli_id INT,
   FOREIGN KEY(com_sal_id) REFERENCES salaries(sal_id),
   FOREIGN KEY(com_cli_id) REFERENCES clients(cli_id)
) ENGINE=InnoDB;

CREATE TABLE com_details(
   comdet_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   pro_quant INT NOT NULL,
   comdet_unit_price DECIMAL(7,2) NOT NULL,
   prix_com DECIMAL(7,2) NOT NULL,
   pro_id INT,
   com_id INT,
   FOREIGN KEY(pro_id) REFERENCES produits(pro_id),
   FOREIGN KEY(com_id) REFERENCES commandes(com_id)
) ENGINE=InnoDB;

CREATE TABLE livr_details(
   comdet_id INT,
   liv_id INT,
   liv_quant INT NOT NULL,
   liv_date DATETIME NOT NULL,
   rec_date DATETIME NOT NULL,
   liv_adresse VARCHAR(150) NOT NULL,
   PRIMARY KEY(comdet_id, liv_id),
   FOREIGN KEY(comdet_id) REFERENCES com_details(comdet_id),
   FOREIGN KEY(liv_id) REFERENCES livraisons(liv_id)
) ENGINE=InnoDB;



/*
DROP TABLE `myTable`;

CREATE TABLE `myTable` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `cli_nom` varchar(255) default NULL,
  `cli_prenom` varchar(255) default NULL,
  `cli_tel` varchar(100) default NULL,
  `cli_mail` varchar(255) default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `clients` ('cli_id', `cli_nom`,`cli_prenom`,`cli_tel`,`cli_mail`) VALUES (1, "Clarke","Marie","(967) 506-8660","tempor.erat@malesuadavelconvallis.net"),(2, "Tran","Noémie","(174) 794-8381","vitae.aliquam@maurisrhoncus.ca"),(3, "Mendez","Marwane","(969) 299-7558","ac@necorci.org"),(4, "Hopper","Carla","(160) 672-4185","Duis.sit.amet@nuncsedpede.co.uk"),(5, "Huff","Alexandre","(617) 281-8074","enim@ipsumdolor.co.uk"),(6, "Combs","Julien","(350) 908-6063","eu.euismod.ac@inceptoshymenaeos.net"),(7, "Mcneil","Yohan","(849) 829-0544","erat.vitae@necleoMorbi.edu"),(8, "Knowles","Anaëlle","(927) 401-0404","Mauris.ut@mollisPhasellus.ca"),(9, "Benson","Lola","(899) 347-6855","Proin.vel.arcu@vulputatedui.co.uk"),(10, "Ross","Timéo","(917) 385-0810","Donec@justo.edu");
INSERT INTO `clients` ('cli_id', `cli_nom`,`cli_prenom`,`cli_tel`,`cli_mail`) VALUES (11, "Mcclain","Maxime","(496) 822-8378","lorem.vehicula.et@vulputatelacus.co.uk"),(12, "Ballard","Dylan","(806) 290-4646","amet@variusNamporttitor.org"),(13, "Mcfadden","Yohan","(648) 963-1614","accumsan.laoreet@in.net"),(14, "Mcintyre","Jordan","(181) 225-8872","vel@dapibusquamquis.co.uk"),(15, "Oliver","Adam","(766) 293-5596","a@Cumsociisnatoque.net"),(16, "Neal","Louna","(915) 579-6917","sit@ligulaconsectetuer.net"),("Jordan","Éléna","(405) 363-7561","orci@ut.co.uk"),("Humphrey","Benjamin","(624) 984-6083","faucibus.lectus.a@nascetur.co.uk"),("Bolton","Mélissa","(469) 924-5445","neque@nisia.co.uk"),("Levy","Adrian","(657) 617-7964","auctor.Mauris.vel@auctornunc.org");
INSERT INTO `clients` ('cli_id', `cli_nom`,`cli_prenom`,`cli_tel`,`cli_mail`) VALUES (21, "Barry","Anaïs","(434) 809-3865","enim@tellusfaucibusleo.net"),(22, "Camacho","Jordan","(827) 177-6025","justo@faucibusut.edu"),(23, "Tran","Mélanie","(123) 381-6986","Vivamus.euismod@tristiquepharetraQuisque.org"),(24, "Hutchinson","Carla","(809) 745-8154","sagittis.lobortis.mauris@nequeSed.ca"),(25, "Tillman","Ambre","(165) 949-6216","aliquet@lobortis.edu"),(26, "Hester","Capucine","(768) 262-4341","ultrices.Vivamus@convallisin.co.uk"),("Byers","Malik","(771) 193-3504","Sed.pharetra.felis@amet.net"),("Albert","Renaud","(677) 236-9252","lobortis.tellus@vitaeodio.org"),("Valentine","Anaëlle","(492) 508-9418","malesuada@tinciduntnibhPhasellus.ca"),("Sanchez","Malik","(686) 214-8578","Cras@nuncrisusvarius.org");
INSERT INTO `clients` ('cli_id', `cli_nom`,`cli_prenom`,`cli_tel`,`cli_mail`) VALUES (31, "Trevino","Maxence","(301) 550-4578","tristique.pharetra.Quisque@porttitorinterdumSed.org"),(32, "Munoz","Lina","(410) 439-6686","porta.elit@Cras.edu"),(33, "Rivers","Nina","(621) 788-9404","dis.parturient@tincidunt.ca"),(34, "Harding","Mattéo","(142) 859-4255","nec.metus.facilisis@inlobortis.ca"),(35, "Frye","Diego","(304) 798-8638","aliquet.diam.Sed@Curabitur.org"),(36, "Acosta","Zoé","(940) 310-6230","In@lacus.com"),("Waller","Dylan","(954) 331-3929","eu.metus@pede.com"),("Potts","Émilie","(549) 939-4067","sit.amet.faucibus@metus.com"),("Everett","Anna","(853) 602-0443","congue.In.scelerisque@cursusvestibulumMauris.edu"),("Patrick","Lana","(883) 732-9706","Aliquam@faucibusutnulla.org");
INSERT INTO `clients` ('cli_id', `cli_nom`,`cli_prenom`,`cli_tel`,`cli_mail`) VALUES (41, "Hunter","Maxence","(469) 475-2537","sodales.purus@diamloremauctor.org"),(42, "Donovan","Amine","(289) 959-6847","eu@purusNullamscelerisque.edu"),(43, "Benson","Élise","(180) 129-9164","Ut.semper.pretium@egestasadui.edu"),(44, "Holloway","Yohan","(369) 849-9160","egestas@Integerurna.co.uk"),(45, "Roberts","Julien","(633) 892-0040","sit.amet.ante@blanditviverraDonec.co.uk"),(46, "Glover","Marion","(803) 749-6978","Sed@et.co.uk"),("Dominguez","Léo","(840) 742-3970","euismod@Donecelementumlorem.net"),("Ruiz","Juliette","(488) 657-0778","tempus.lorem.fringilla@adipiscingelit.co.uk"),("Morton","Kylian","(807) 264-6216","mus@DonecegestasAliquam.co.uk"),("Anderson","Amélie","(251) 353-4031","lectus.convallis@Utsagittis.co.uk");
INSERT INTO `clients` ('cli_id', `cli_nom`,`cli_prenom`,`cli_tel`,`cli_mail`) VALUES (51, "Ryan","Corentin","(975) 201-6639","pede.malesuada@vel.ca"),(52, "Wilkerson","Corentin","(195) 817-8477","Ut@dictum.org"),(53, "Fitzpatrick","Juliette","(746) 772-2771","tincidunt.orci.quis@Fuscealiquetmagna.co.uk"),(54, "Zimmerman","Maelys","(279) 772-1639","neque.Morbi.quis@purussapien.co.uk"),(55, "Crosby","Pauline","(910) 495-2091","feugiat.non@aliquamiaculislacus.org"),(56, "Randolph","Elsa","(214) 107-6438","natoque.penatibus.et@idante.com"),("Small","Sarah","(538) 528-3298","metus.urna.convallis@tellus.net"),("Mann","Pierre","(666) 107-2606","sit.amet.metus@odio.org"),("Dickerson","Yanis","(784) 226-1494","amet@acnulla.edu"),("Phillips","Clotilde","(643) 989-3870","nunc.est@dolorFuscemi.ca");
INSERT INTO `clients` ('cli_id', `cli_nom`,`cli_prenom`,`cli_tel`,`cli_mail`) VALUES (61, "Hunt","Esteban","(543) 184-6398","sem@justoPraesent.net"),(62, "Bowman","Loevan","(350) 847-6158","elementum@consectetuer.co.uk"),(63, "Nixon","Lena","(729) 311-1315","Cras.sed@venenatisvelfaucibus.com"),(64, "Garrett","Jules","(524) 426-7063","vitae.mauris.sit@nullaInteger.co.uk"),(65, "Emerson","Élise","(561) 368-0329","rhoncus.Proin@malesuadafames.com"),(66, "Vasquez","Jérémy","(898) 392-5866","arcu.Sed@malesuada.ca"),("Bryant","Chloé","(357) 975-3813","Donec@risus.com"),("Watts","Mohamed","(789) 969-5522","magna.Praesent@lobortisnisi.edu"),("Pacheco","Nathan","(475) 168-2717","dictum.sapien@actellusSuspendisse.com"),("Hines","Anna","(680) 955-5481","vehicula@euismod.ca");
INSERT INTO `clients` ('cli_id', `cli_nom`,`cli_prenom`,`cli_tel`,`cli_mail`) VALUES (71, "Bruce","Thibault","(650) 942-6039","bibendum.sed@facilisiSed.com"),(72, "Foreman","Diego","(273) 718-0274","sodales.at@Morbi.net"),(73, "Hurst","Anaëlle","(730) 743-0415","Sed.auctor@VivamusrhoncusDonec.edu"),(74, "Sullivan","Élise","(712) 609-7185","Duis.at.lacus@luctus.org"),(75, "Saunders","Chloé","(764) 168-2877","ligula@at.org"),(76, "Francis","Dylan","(901) 483-9214","at.pretium@Suspendissealiquetmolestie.net"),("Moody","Rémi","(140) 879-9873","ad@ullamcorper.edu"),("Spence","Jeanne","(372) 911-1240","cubilia.Curae@velquamdignissim.ca"),("Johns","Constant","(475) 487-0349","varius.Nam.porttitor@justonecante.edu"),("Cortez","Alice","(279) 673-8721","Donec.feugiat.metus@et.org");
INSERT INTO `clients` ('cli_id', `cli_nom`,`cli_prenom`,`cli_tel`,`cli_mail`) VALUES (81, "Bentley","Julien","(991) 459-8082","ligula@ipsum.net"),(82, "Norton","Julien","(817) 771-9287","a.neque@ligula.co.uk"),(83, "Montgomery","Alexis","(356) 980-8844","sem.vitae.aliquam@orci.com"),(84, "Daniels","Edwige","(313) 978-4930","lorem.lorem.luctus@senectuset.com"),(85, "Terry","Rémi","(600) 615-0160","natoque.penatibus.et@molestietortornibh.org"),(86, "Prince","Océane","(602) 425-9354","nec.urna@pellentesquetellussem.net"),("Potts","Julien","(735) 385-4182","vitae.mauris@litora.ca"),("Townsend","Élise","(801) 369-0191","dolor@sedfacilisisvitae.co.uk"),("Peters","Alexandre","(935) 584-7837","semper.rutrum.Fusce@semperpretium.edu"),("Cote","Félix","(125) 354-2414","non.hendrerit.id@loremvehiculaet.com");
INSERT INTO `clients` ('cli_id', `cli_nom`,`cli_prenom`,`cli_tel`,`cli_mail`) VALUES (91, "Petersen","Laura","(989) 791-0673","aliquet@condimentumDonecat.edu"),(92, "Moody","Antonin","(159) 139-5920","Suspendisse.eleifend.Cras@nonlacinia.edu"),(93, "Newton","Nicolas","(738) 114-3762","Nullam.feugiat.placerat@nonummyipsumnon.net"),(94, "Blackwell","Jérémy","(512) 613-3754","vulputate.nisi.sem@velit.org"),(95, "Hogan","Enzo","(720) 949-6149","et.rutrum.non@aliquetsem.ca"),(96, "Blankenship","Mathilde","(766) 336-4106","In.faucibus.Morbi@mauris.edu"),("Roberson","Corentin","(638) 303-2111","rutrum.non.hendrerit@tinciduntaliquamarcu.org"),("Schneider","Juliette","(309) 230-7206","Suspendisse.sagittis@nequeetnunc.net"),("Puckett","Élisa","(159) 895-8692","Vivamus.nisi@luctuslobortis.net"),("Lamb","Romain","(875) 798-1009","sem.molestie.sodales@cursusluctusipsum.org");


DROP TABLE `myTable`;

CREATE TABLE `fournisseurs` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `fou_nom` varchar(255),
  `fou_adresse` varchar(255) default NULL,
  `fou_tel` varchar(100) default NULL,
  `fou_contact` varchar(255) default NULL,
  `fou_mail` varchar(255) default NULL,
  `fou_pays` varchar(100) default NULL,
  `fou_ville` varchar(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;


INSERT INTO `myTable` (`fou_nom`,`fou_adresse`,`fou_tel`,`fou_contact`,`fou_mail`,`fou_pays`,`fou_ville`) VALUES ("Non Ante Bibendum Consulting","1497 Eu, Rd.","(274) 266-8778","Ila Alvarado","massa@NulladignissimMaecenas.edu","France","Vichy"),("Vel Lectus Ltd","Appartement 179-5840 Mauris, Rd.","(747) 448-3398","Valentine Reid","enim.non.nisi@pedeCras.edu","France","Wattrelos"),("Tristique Pellentesque Tellus Company","599-648 Auctor Av.","(776) 882-9289","Heidi Calderon","posuere.cubilia.Curae@Praesentluctus.co.uk","France","Pontarlier"),("Ipsum LLP","8079 At, Rd.","(726) 402-0355","Brendan Dixon","aliquet@ullamcorpernislarcu.com","France","Le Petit-Quevilly"),("Luctus Aliquet Corporation","CP 932, 1300 Aliquam Impasse","(969) 511-2594","Melinda Franklin","Donec@nonleoVivamus.ca","France","Valenciennes"),("Quisque Imperdiet Erat Limited","2343 Congue, Avenue","(916) 375-0467","Hyacinth Steele","Proin.vel.arcu@diameu.ca","France","Asnières-sur-Seine"),("Euismod Mauris Eu Corporation","Appartement 528-1197 Arcu Impasse","(725) 316-3793","Maile Bean","velit.Sed.malesuada@Sed.org","France","Nevers"),("In Associates","876-5910 Fermentum Rd.","(584) 734-2937","Ursula Lewis","enim.Etiam@ante.org","France","Mâcon"),("Non Sapien LLP","Appartement 748-4917 Suspendisse Rue","(248) 235-6213","Melvin Noel","id.sapien.Cras@duiaugue.org","France","Beauvais"),("Molestie PC","Appartement 731-5578 Amet Rue","(361) 370-9355","Merritt Chambers","vel.nisl.Quisque@dolorelit.net","France","Cannes");
INSERT INTO `myTable` (`fou_nom`,`fou_adresse`,`fou_tel`,`fou_contact`,`fou_mail`,`fou_pays`,`fou_ville`) VALUES ("Orci Corporation","2691 Mi Av.","(212) 871-5880","Carl Rose","leo@nuncsed.ca","France","La Rochelle"),("Sollicitudin Company","CP 229, 1680 Quisque Avenue","(802) 696-7418","Shea Butler","vitae.aliquet@luctus.org","France","Ajaccio"),("Mattis Cras PC","Appartement 371-9069 Auctor. Rue","(279) 131-9174","Ciara Copeland","enim@egetmollislectus.co.uk","France","Orléans"),("Nunc Consulting","747-9273 Fermentum Ave","(188) 825-3794","Quamar Pace","nonummy.ultricies.ornare@penatibus.co.uk","France","Bayonne"),("Magna Consulting","357-8999 Cursus Avenue","(202) 902-4942","Clare Larson","dui.Cum@Fuscefeugiat.com","France","Rouen"),("Neque Vitae Foundation","CP 368, 572 Sapien. Avenue","(598) 657-5028","Allen Dyer","sed.turpis.nec@egestas.org","France","Le Grand-Quevilly"),("Odio Phasellus At Associates","2650 Scelerisque Avenue","(417) 983-6294","Meghan Warren","adipiscing@cursus.edu","France","Saint-Herblain"),("Eros Limited","Appartement 192-2142 Taciti Ave","(148) 476-7913","Curran Stuart","mi@neceuismod.org","France","Limoges"),("Tincidunt Congue Turpis Foundation","967-1545 Mi Rd.","(572) 117-9305","Iola Middleton","odio.vel.est@risus.org","France","Joué-lès-Tours"),("Ipsum Donec Company","450-8707 Vehicula. Rue","(365) 667-4689","Imogene Richards","tristique@lobortis.edu","France","Illkirch-Graffenstaden");
INSERT INTO `myTable` (`fou_nom`,`fou_adresse`,`fou_tel`,`fou_contact`,`fou_mail`,`fou_pays`,`fou_ville`) VALUES ("Leo Cras Vehicula Industries","789-6045 Felis. Impasse","(188) 418-4645","Luke Boyle","sagittis.felis.Donec@id.net","France","Orléans"),("Velit In Aliquet Industries","240-7054 Nisl. Avenue","(560) 784-5223","Dominic Villarreal","et@egestasFusce.net","France","Belfort"),("Nibh Phasellus Corporation","CP 504, 3519 Vulputate Ave","(588) 345-1640","Quail Stafford","mattis.Integer@Inmi.edu","France","Gap"),("Mollis Company","1661 Ut Av.","(160) 426-6002","Jeanette Santos","adipiscing@cursus.co.uk","France","Creil"),("Duis Dignissim Incorporated","Appartement 332-2060 Rhoncus. Impasse","(362) 415-2615","Yvette William","nec@bibendumfermentummetus.net","France","Salon-de-Provence"),("Dui Lectus LLP","CP 424, 1698 Donec Rue","(272) 233-7546","Eden English","adipiscing@ornarelectus.edu","France","Arras"),("Mauris Industries","CP 302, 5246 Morbi Ave","(676) 994-2343","Felicia Watson","bibendum.fermentum.metus@mattisIntegereu.ca","France","Lunel"),("Sem Magna Associates","Appartement 397-8159 Mauris Rue","(123) 984-7187","Imelda Butler","nulla@vitae.ca","France","Saintes"),("Erat Vitae Consulting","Appartement 295-3509 At, Rue","(109) 977-5799","Wylie Romero","dapibus.id@erosnectellus.org","France","Le Petit-Quevilly"),("Congue In Scelerisque Corp.","7478 Varius Rd.","(694) 341-2954","Bree Finch","vitae.erat@sociisnatoque.edu","France","Schiltigheim");
INSERT INTO `myTable` (`fou_nom`,`fou_adresse`,`fou_tel`,`fou_contact`,`fou_mail`,`fou_pays`,`fou_ville`) VALUES ("Quisque Porttitor Limited","8180 Magna Rue","(211) 330-1876","Christian Smith","ipsum.Phasellus@Ut.com","France","Colmar"),("Fusce Foundation","6396 Mollis Chemin","(970) 694-2574","Jin Lamb","vulputate@consectetueradipiscing.ca","France","Cholet"),("Faucibus Orci Luctus Ltd","CP 285, 3568 Odio Av.","(631) 326-5177","Shafira Hayes","elementum.sem.vitae@Vivamuseuismod.org","France","Anglet"),("Quam Consulting","CP 669, 2014 Aliquam Avenue","(966) 648-2873","Alec Jarvis","ut.erat@Nullamvelitdui.ca","France","Mâcon"),("Mattis Integer Inc.","Appartement 562-8181 Nec, Route","(797) 352-0123","Abbot Graves","ac@interdum.org","France","Quimper"),("Lorem Sit Amet Industries","9606 Tellus Rd.","(615) 753-6101","Adena Odonnell","In.nec.orci@miacmattis.com","France","Cherbourg-Octeville"),("Duis Institute","CP 216, 3163 Faucibus Avenue","(345) 351-3027","Ignacia Drake","nec@estac.org","France","Laval"),("Facilisis Vitae Corp.","4663 Commodo Rd.","(101) 820-7609","Marny Delgado","commodo.ipsum.Suspendisse@tempordiam.co.uk","France","Creil"),("Sagittis Nullam Industries","1622 Et Chemin","(954) 987-9711","Omar Combs","nisi.dictum@utpharetra.net","France","Forbach"),("Augue Industries","5296 Orci Av.","(520) 787-0374","Colin Sharpe","eget.metus.eu@blanditNam.com","France","La Seyne-sur-Mer");
INSERT INTO `myTable` (`fou_nom`,`fou_adresse`,`fou_tel`,`fou_contact`,`fou_mail`,`fou_pays`,`fou_ville`) VALUES ("Nibh Dolor Nonummy Company","Appartement 929-5945 Sapien, Rue","(412) 770-7874","Summer Callahan","tempus.scelerisque.lorem@diam.org","France","Sens"),("Ac Consulting","CP 487, 4814 Velit Rd.","(519) 488-4329","Lenore Bender","enim.mi.tempor@aliquet.edu","France","Vichy"),("Duis At Lacus Industries","4941 Fusce Rue","(399) 936-7351","Robin Ratliff","consequat.enim.diam@ipsumportaelit.ca","France","Clermont-Ferrand"),("Nullam LLC","Appartement 511-8698 Nam Avenue","(492) 680-2996","Dexter Merritt","In.faucibus.Morbi@scelerisquescelerisquedui.edu","France","Champigny-sur-Marne"),("Egestas LLP","Appartement 700-6431 Duis Rd.","(185) 460-8940","Raven Cantu","Aliquam@magnaUt.edu","France","Cherbourg-Octeville"),("Consequat Dolor Vitae Institute","CP 599, 7014 Semper Avenue","(487) 425-3974","Ian Prince","cursus.diam.at@orci.edu","France","Dreux"),("A Aliquet PC","286-3546 Ligula Av.","(955) 771-5321","Quin Whitehead","urna@Fuscealiquetmagna.org","France","Drancy"),("Orci Phasellus LLP","127-6940 Sodales Rue","(951) 500-4558","Ian Bullock","dolor.Donec@ametdiam.com","France","Épernay"),("A Inc.","1519 Sem Chemin","(600) 354-1938","Juliet Franco","scelerisque.sed.sapien@atiaculis.net","France","Saint-Dié-des-Vosges"),("Auctor Incorporated","9503 Vitae Rue","(736) 964-2084","Kibo Giles","dolor.sit@risusvariusorci.net","France","Amiens");

