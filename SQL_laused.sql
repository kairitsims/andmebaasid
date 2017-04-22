ALTER TABLE [Kauba_kategooria] DROP CONSTRAINT [FK_Kauba_kategooria_tyyp]
;

ALTER TABLE [Isik] DROP CONSTRAINT [FK_Isiku_seisundi_liik]
;

ALTER TABLE [Isik] DROP CONSTRAINT [FK_Riik]
;

ALTER TABLE [Tootaja] DROP CONSTRAINT [FK_Amet]
;

ALTER TABLE [Tootaja] DROP CONSTRAINT [FK_Tootaja_seisundi_liik]
;

ALTER TABLE [Tootaja] DROP CONSTRAINT [FK_Isik]
;

ALTER TABLE [Klient] DROP CONSTRAINT [FK_Kliendi_seisundi_liik]
;

ALTER TABLE [Klient] DROP CONSTRAINT [FK_Isik]
;

ALTER TABLE [Kaup] DROP CONSTRAINT [FK_Brand]
;

ALTER TABLE [Kaup] DROP CONSTRAINT [FK_Kauba_seisundi_liik]
;

ALTER TABLE [Kaup] DROP CONSTRAINT [FK_Tootaja]
;

ALTER TABLE [Kauba_variant] DROP CONSTRAINT [FK_Varv]
;

ALTER TABLE [Kauba_variant] DROP CONSTRAINT [FK_Kaup]
;

ALTER TABLE [Nutitelefon] DROP CONSTRAINT [FK_Diagonaal]
;

ALTER TABLE [Nutitelefon] DROP CONSTRAINT [FK_Eesmine_kaamera]
;

ALTER TABLE [Nutitelefon] DROP CONSTRAINT [FK_Ekraani_resolutsioon]
;

ALTER TABLE [Nutitelefon] DROP CONSTRAINT [FK_Protsessor]
;

ALTER TABLE [Nutitelefon] DROP CONSTRAINT [FK_Sisemalu]
;

ALTER TABLE [Nutitelefon] DROP CONSTRAINT [FK_Tagumine_kaamera]
;

ALTER TABLE [Nutitelefon] DROP CONSTRAINT [FK_Kaup]
;

ALTER TABLE [Kaubale_kategooria_omamine] DROP CONSTRAINT [FK_Kaup]
;

ALTER TABLE [Kaubale_kategooria_omamine] DROP CONSTRAINT [FK_Kauba_kategooria]
;

DROP TABLE [Riik]
;

DROP TABLE [Kauba_seisundi_liik]
;

DROP TABLE [Tootaja_seisundi_liik]
;

DROP TABLE [Brand]
;

DROP TABLE [Ekraani_resolutsioon]
;

DROP TABLE [Tagumine_kaamera]
;

DROP TABLE [Eesmine_kaamera]
;

DROP TABLE [Diagonaal]
;

DROP TABLE [Protsessor]
;

DROP TABLE [Sisemalu]
;

DROP TABLE [Varv]
;

DROP TABLE [Isiku_seisundi_liik]
;

DROP TABLE [Kliendi_seisundi_liik]
;

DROP TABLE [Amet]
;

DROP TABLE [Kauba_kategooria_tyyp]
;

DROP TABLE [Kauba_kategooria]
;

DROP TABLE [Isik]
;

DROP TABLE [Tootaja]
;

DROP TABLE [Klient]
;

DROP TABLE [Kaup]
;

DROP TABLE [Kauba_variant]
;

DROP TABLE [Nutitelefon]
;

DROP TABLE [Kaubale_kategooria_omamine]
;

CREATE TABLE [Riik]
(
	[riik_kood] Text(3) NOT NULL,
	[nimetus] Text(100) NOT NULL
)
;

CREATE TABLE [Kauba_seisundi_liik]
(
	[kauba_seisundi_liik_kood] Short NOT NULL,
	[nimetus] Text(100) NOT NULL
)
;

CREATE TABLE [Tootaja_seisundi_liik]
(
	[Tootaja_seisundi_liik_kood] Short NOT NULL,
	[nimetus] Text(100) NOT NULL
)
;

CREATE TABLE [Brand]
(
	[brand_kood] Short NOT NULL,
	[nimetus] Text(100) NOT NULL
)
;

CREATE TABLE [Tagumine_kaamera]
(
	[tagumine_kaamera_kood] Short NOT NULL,
	[nimetus] Text(100) NOT NULL
)
;

CREATE TABLE [Eesmine_kaamera]
(
	[esimene_kaamera_kood] Short NOT NULL,
	[nimetus] Text(100) NOT NULL
)
;

CREATE TABLE [Diagonaal]
(
	[diagonaal_kood] Short NOT NULL,
	[nimetus] Text(100) NOT NULL
)
;

CREATE TABLE [Protsessor]
(
	[protsessor_kood] Short NOT NULL,
	[nimetus] Text(100) NOT NULL
)
;

CREATE TABLE [Sisemalu]
(
	[sisemalu_kood] Short NOT NULL,
	[nimetus] Text(100) NOT NULL
)
;

CREATE TABLE [Ekraani_resolutsioon]
(
	[ekraani_resolutsioon_kood] Short NOT NULL,
	[nimetus] Text(100) NOT NULL
)
;

CREATE TABLE [Varv]
(
	[varv_kood] Short NOT NULL,
	[nimetus] Text(100) NOT NULL
)
;

CREATE TABLE [Isiku_seisundi_liik]
(
	[isiku_seisundi_liik_kood] Short NOT NULL DEFAULT 1,
	[nimetus] Text(100) NOT NULL
)
;

CREATE TABLE [Kliendi_seisundi_liik]
(
	[kliendi_seisundi_liik_kood] Short NOT NULL,
	[nimetus] Text(100) NOT NULL
)
;

CREATE TABLE [Amet]
(
	[kirjeldus] Memo,
	[amet_kood] Short NOT NULL,
	[nimetus] Text(100) NOT NULL
)
;

CREATE TABLE [Kauba_kategooria_tyyp]
(
	[kauba_kategooria_tyyp_kood] Short NOT NULL,
	[nimetus] Text(100) NOT NULL
)
;

CREATE TABLE [Kauba_kategooria]
(
	[kauba_kategooria_kood] Short NOT NULL,
	[nimetus] Text(100) NOT NULL,
	[kauba_kategooria_tyyp_kood] Short NOT NULL
)
;

CREATE TABLE [Isik]
(
	[isikukood] Text(50) NOT NULL,
	[eesnimi] Text(255),
	[perenimi] Text(255),
	[synni_kp] DateTime NOT NULL,
	[e_meil] Text(254) NOT NULL,
	[elukoht] Text(255),
	[parool] Text(50) NOT NULL,
	[reg_aeg] DateTime NOT NULL DEFAULT Now(),
	[isikukoodi_riik] Text(3) NOT NULL,
	[isiku_seisundi_liik_kood] Short NOT NULL,
	[isik_id] Counter NOT NULL
)
;

CREATE TABLE [Tootaja]
(
	[Amet_kood] Short NOT NULL,
	[Tootaja_seisundi_liik_kood] Short NOT NULL,
	[isik_id] Counter NOT NULL
)
;

CREATE TABLE [Klient]
(
	[on_nous_tylitamisega] YesNo NOT NULL,
	[Kliendi_seisundi_liik_kood] Short NOT NULL,
	[isik_id] Counter NOT NULL
)
;

CREATE TABLE [Kaup]
(
	[nimetus] Text(255) NOT NULL,
	[reg_aeg] DateTime NOT NULL DEFAULT Now(),
	[kauba_kood] Short NOT NULL,
	[hind] Currency NOT NULL,
	[kirjeldus] Text(255) NOT NULL,
	[pildi_aadress] Text(255),
	[isik_id] Long NOT NULL,
	[kauba_seisundi_liik_kood] Short NOT NULL,
	[brand_kood] Short NOT NULL
)
;

CREATE TABLE [Kauba_variant]
(
	[kauba_kood] Short NOT NULL,
	[kauba_variant_id] Short NOT NULL,
	[kauba_variant_kood] Short
)
;

CREATE TABLE [Nutitelefon]
(
	[on_veekindel] YesNo NOT NULL,
	[on_sormejalelugeja] YesNo NOT NULL,
	[eesmine_kaamera_kood] Short NOT NULL,
	[tagumine_kaamera_kood] Short NOT NULL,
	[sisemälu_kood] Short NOT NULL,
	[diagonaal_kood] Short NOT NULL,
	[protsessor_kood] Short NOT NULL,
	[ekraani_resolutsioon_kood] Short NOT NULL,
	[kauba_kood] Short NOT NULL
)
;

CREATE TABLE [Kaubale_kategooria_omamine]
(
	[kauba_kood] Short NOT NULL,
	[kaubale_kategooria_omamine_kood] Short NOT NULL
)
;

ALTER TABLE [Riik] ADD CONSTRAINT [PK_Riik]
	PRIMARY KEY ([riik_kood])
;

ALTER TABLE [Riik] ADD CONSTRAINT [AK_Riik_nimetus] UNIQUE (nimetus)
;

ALTER TABLE [Kauba_seisundi_liik] ADD CONSTRAINT [PK_Kauba_seisundi_liik]
	PRIMARY KEY ([kauba_seisundi_liik_kood])
;

ALTER TABLE [Kauba_seisundi_liik] ADD CONSTRAINT [AK_Kauba_seisundi_liik_nimetus] UNIQUE (nimetus)
;

ALTER TABLE [Tootaja_seisundi_liik] ADD CONSTRAINT [PK_Tootaja_seisundi_liik]
	PRIMARY KEY ([Tootaja_seisundi_liik_kood])
;

ALTER TABLE [Tootaja_seisundi_liik] ADD CONSTRAINT [AK_Tootaja_seisundi_liik_nimetus] UNIQUE (nimetus)
;

ALTER TABLE [Brand] ADD CONSTRAINT [PK_Brand]
	PRIMARY KEY ([brand_kood])
;

ALTER TABLE [Brand] ADD CONSTRAINT [AK_Brand_nimetus] UNIQUE (nimetus)
;

ALTER TABLE [Ekraani_resolutsioon] ADD CONSTRAINT [PK_Ekraani_resolutsioon]
	PRIMARY KEY ([ekraani_resolutsioon_kood])
;

ALTER TABLE [Ekraani_resolutsioon] ADD CONSTRAINT [AK_Ekraani_resolutsioon_nimetus] UNIQUE (nimetus)
;

ALTER TABLE [Tagumine_kaamera] ADD CONSTRAINT [PK_Tagumine_kaamera]
	PRIMARY KEY ([Tagumine_kaamera_kood])
;

ALTER TABLE [Tagumine_kaamera] ADD CONSTRAINT [AK_Tagumine_kaamera_nimetus] UNIQUE (nimetus)
;

ALTER TABLE [Eesmine_kaamera] ADD CONSTRAINT [PK_Eesmine_kaamera]
	PRIMARY KEY ([esimene_kaamera_kood])
;

ALTER TABLE [Eesmine_kaamera] ADD CONSTRAINT [AK_Esimene_kaamera_nimetus] UNIQUE (nimetus)
;

ALTER TABLE [Diagonaal] ADD CONSTRAINT [PK_Diagonaal]
	PRIMARY KEY ([diagonaal_kood])
;

ALTER TABLE [Diagonaal] ADD CONSTRAINT [AK_Diagonaal_nimetus] UNIQUE (nimetus)
;

ALTER TABLE [Protsessor] ADD CONSTRAINT [PK_Protsessor]
	PRIMARY KEY ([protsessor_kood])
;

ALTER TABLE [Protsessor] ADD CONSTRAINT [AK_Protsessor_nimetus] UNIQUE (nimetus)
;

ALTER TABLE [Sisemalu] ADD CONSTRAINT [PK_Sisemalu]
	PRIMARY KEY ([sisemalu_kood])
;

ALTER TABLE [Sisemalu] ADD CONSTRAINT [AK_Sisemälu_nimetus] UNIQUE (nimetus)
;

ALTER TABLE [Varv] ADD CONSTRAINT [PK_Varv]
	PRIMARY KEY ([varv_kood])
;

ALTER TABLE [Varv] ADD CONSTRAINT [AK_Varv_nimetus] UNIQUE (nimetus)
;

ALTER TABLE [Isiku_seisundi_liik] ADD CONSTRAINT [PK_Isiku_seisundi_liik]
	PRIMARY KEY ([isiku_seisundi_liik_kood])
;

ALTER TABLE [Isiku_seisundi_liik] ADD CONSTRAINT [AK_isiku_seisundi_liik_nimetus] UNIQUE (nimetus)
;

ALTER TABLE [Kliendi_seisundi_liik] ADD CONSTRAINT [PK_Kliendi_seisundi_liik]
	PRIMARY KEY ([kliendi_seisundi_liik_kood])
;

ALTER TABLE [Kliendi_seisundi_liik] ADD CONSTRAINT [AK_Kliendi_seisundi_liik_nimetus] UNIQUE (nimetus)
;

ALTER TABLE [Amet] ADD CONSTRAINT [PK_Amet]
	PRIMARY KEY ([amet_kood])
;

ALTER TABLE [Amet] ADD CONSTRAINT [AK_Amet_nimetus] UNIQUE (nimetus)
;

ALTER TABLE [Kauba_kategooria_tyyp] ADD CONSTRAINT [PK_Kauba_kategooria_tyyp]
	PRIMARY KEY ([kauba_kategooria_tyyp_kood])
;

ALTER TABLE [Kauba_kategooria_tyyp] ADD CONSTRAINT [AK_Kauba_kategooria_tyyp_nimetus] UNIQUE (nimetus)
;

CREATE INDEX [IXFK_Kauba_kategooria_tyyp] ON [Kauba_kategooria] ([kauba_kategooria_kood] ASC)
;

ALTER TABLE [Kauba_kategooria] ADD CONSTRAINT [PK_Kauba_kategooria]
	PRIMARY KEY ([kauba_kategooria_kood])
;

ALTER TABLE [Kauba_kategooria] ADD CONSTRAINT [AK_Kauba_kategooria_nimetus] UNIQUE (nimetus)
;

CREATE INDEX [IXFK_Isiku_seisundi_liik] ON [Isik] ([isiku_seisundi_liik_kood] ASC)
;

CREATE INDEX [IXFK_Riik] ON [Isik] ([isikukoodi_riik] ASC)
;

ALTER TABLE [Isik] ADD CONSTRAINT [PK_Isik]
	PRIMARY KEY ([isik_id])
;

ALTER TABLE [Isik] ADD CONSTRAINT [AK_Isik_e_meil] UNIQUE (e_meil)
;

ALTER TABLE [Isik] ADD CONSTRAINT [AK_Isik_isikukood_Isikukoodi_riik] UNIQUE ([isikukood],[isikukoodi_riik])
;

CREATE INDEX [IXFK_Tootaja_seisundi_liik] ON [Tootaja] ([Amet_kood] ASC)
;

ALTER TABLE [Tootaja] ADD CONSTRAINT [PK_Tootaja]
	PRIMARY KEY ([isik_id])
;

CREATE INDEX [IXFK_Kliendi_seisundi_liik] ON [Klient] ([Kliendi_seisundi_liik_kood] ASC)
;

ALTER TABLE [Klient] ADD CONSTRAINT [PK_Klient]
	PRIMARY KEY ([isik_id])
;

CREATE INDEX [IXFK_Kauba_seisundi_liik] ON [Kaup] ([kauba_seisundi_liik_kood] ASC)
;

ALTER TABLE [Kaup] ADD CONSTRAINT [PK_Kaup]
	PRIMARY KEY ([kauba_kood])
;

ALTER TABLE [Kaup] ADD CONSTRAINT [AK_Kaup_nimetus] UNIQUE ([nimetus])
;

CREATE INDEX [IXFK_Kaup] ON [Kauba_variant] ([kauba_kood] ASC)
;

ALTER TABLE [Kauba_variant] ADD CONSTRAINT [PK_Kauba_variant]
	PRIMARY KEY ([kauba_variant_id])
;

CREATE INDEX [IXFK_Kaup] ON [Nutitelefon] ([kauba_kood] ASC)
;

ALTER TABLE [Nutitelefon] ADD CONSTRAINT [PK_Nutitelefon]
	PRIMARY KEY ([kauba_kood])
;

CREATE INDEX [IXFK_Kauba_kategooria] ON [Kaubale_kategooria_omamine] ([kaubale_kategooria_omamine_kood] ASC)
;

CREATE INDEX [IXFK_Kaup] ON [Kaubale_kategooria_omamine] ([kauba_kood] ASC)
;

ALTER TABLE [Kaubale_kategooria_omamine] ADD CONSTRAINT [PK_Kaubale_kategooria_omamine]
	PRIMARY KEY ([kauba_kood],[kaubale_kategooria_omamine_kood])
;

ALTER TABLE [Kauba_kategooria] ADD CONSTRAINT [FK_Kauba_kategooria_tyyp]
	FOREIGN KEY ([kauba_kategooria_kood]) REFERENCES [Kauba_kategooria_tyyp] ([kauba_kategooria_tyyp_kood]) ON UPDATE Cascade
;

ALTER TABLE [Isik] ADD CONSTRAINT [FK_Isiku_seisundi_liik]
	FOREIGN KEY ([isiku_seisundi_liik_kood]) REFERENCES [Isiku_seisundi_liik] ([isiku_seisundi_liik_kood]) ON UPDATE Cascade
;

ALTER TABLE [Isik] ADD CONSTRAINT [FK_Riik]
	FOREIGN KEY ([isikukoodi_riik]) REFERENCES [Riik] ([riik_kood]) ON UPDATE Cascade
;

ALTER TABLE [Tootaja] ADD CONSTRAINT [FK_Amet]
	FOREIGN KEY ([Amet_kood]) REFERENCES [Amet] ([amet_kood]) ON UPDATE Cascade
;

ALTER TABLE [Tootaja] ADD CONSTRAINT [FK_Tootaja_seisundi_liik]
	FOREIGN KEY ([Amet_kood]) REFERENCES [Tootaja_seisundi_liik] ([Tootaja_seisundi_liik_kood]) ON UPDATE Cascade
;

ALTER TABLE [Tootaja] ADD CONSTRAINT [FK_Isik]
	FOREIGN KEY ([isik_id]) REFERENCES [Isik] ([isik_id])
;

ALTER TABLE [Klient] ADD CONSTRAINT [FK_Kliendi_seisundi_liik]
	FOREIGN KEY ([Kliendi_seisundi_liik_kood]) REFERENCES [Kliendi_seisundi_liik] ([kliendi_seisundi_liik_kood]) ON UPDATE Cascade
;

ALTER TABLE [Klient] ADD CONSTRAINT [FK_Isik_klient]
	FOREIGN KEY ([isik_id]) REFERENCES [Isik] ([isik_id])
;

ALTER TABLE [Kaup] ADD CONSTRAINT [FK_Brand]
	FOREIGN KEY ([kauba_kood]) REFERENCES [Brand] ([brand_kood]) ON UPDATE Cascade
;

ALTER TABLE [Kaup] ADD CONSTRAINT [FK_Kauba_seisundi_liik]
	FOREIGN KEY ([kauba_seisundi_liik_kood]) REFERENCES [Kauba_seisundi_liik] ([kauba_seisundi_liik_kood]) ON UPDATE Cascade
;

ALTER TABLE [Kaup] ADD CONSTRAINT [FK_Tootaja]
	FOREIGN KEY ([isik_id]) REFERENCES [Tootaja] ([isik_id])
;

ALTER TABLE [Kauba_variant] ADD CONSTRAINT [FK_Varv]
	FOREIGN KEY ([kauba_variant_kood]) REFERENCES [Varv] ([varv_kood]) ON UPDATE Cascade
;

ALTER TABLE [Kauba_variant] ADD CONSTRAINT [FK_Kaup]
	FOREIGN KEY ([kauba_kood]) REFERENCES [Kaup] ([kauba_kood]) ON UPDATE Cascade
;

ALTER TABLE [Nutitelefon] ADD CONSTRAINT [FK_Diagonaal]
	FOREIGN KEY ([eesmine_kaamera_kood]) REFERENCES [Diagonaal] ([diagonaal_kood]) ON UPDATE Cascade
;

ALTER TABLE [Nutitelefon] ADD CONSTRAINT [FK_Eesmine_kaamera]
	FOREIGN KEY ([eesmine_kaamera_kood]) REFERENCES [Eesmine_kaamera] ([esimene_kaamera_kood]) ON UPDATE Cascade
;

ALTER TABLE [Nutitelefon] ADD CONSTRAINT [FK_Ekraani_resolutsioon]
	FOREIGN KEY ([eesmine_kaamera_kood]) REFERENCES [Ekraani_resolutsioon] ([ekraani_resolutsioon_kood]) ON UPDATE Cascade
;

ALTER TABLE [Nutitelefon] ADD CONSTRAINT [FK_Protsessor]
	FOREIGN KEY ([eesmine_kaamera_kood]) REFERENCES [Protsessor] ([protsessor_kood]) ON UPDATE Cascade
;

ALTER TABLE [Nutitelefon] ADD CONSTRAINT [FK_Sisemalu]
	FOREIGN KEY ([eesmine_kaamera_kood]) REFERENCES [Sisemalu] ([sisemalu_kood]) ON UPDATE Cascade
;

ALTER TABLE [Nutitelefon] ADD CONSTRAINT [FK_Tagumine_kaamera]
	FOREIGN KEY ([eesmine_kaamera_kood]) REFERENCES [Tagumine_kaamera] ([tagumine_kaamera_kood]) ON UPDATE Cascade
;

ALTER TABLE [Nutitelefon] ADD CONSTRAINT [FK_Kaup_kood]
	FOREIGN KEY ([kauba_kood]) REFERENCES [Kaup] ([kauba_kood]) ON UPDATE Cascade
;

ALTER TABLE [Kaubale_kategooria_omamine] ADD CONSTRAINT [FK_Kaup_kategooria]
	FOREIGN KEY ([kauba_kood]) REFERENCES [Kaup] ([kauba_kood]) ON UPDATE Cascade
;

ALTER TABLE [Kaubale_kategooria_omamine] ADD CONSTRAINT [FK_Kauba_kategooria]
	FOREIGN KEY ([kaubale_kategooria_omamine_kood]) REFERENCES [Kauba_kategooria] ([kauba_kategooria_kood]) ON UPDATE Cascade
;
