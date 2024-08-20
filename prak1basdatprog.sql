/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     8/20/2024 12:58:01 PM                        */
/*==============================================================*/


drop table if exists BARANG;

drop table if exists CALON_KONSUMEN;

drop table if exists DETAIL_JNS_DOK;

drop table if exists DETAIL_KATALOG;

drop table if exists DETAIL_PEMESANAN;

drop table if exists DETAIL_PENAWARAN;

drop table if exists JABATAN;

drop table if exists JENIS_BARANG;

drop table if exists JENIS_DOKUMEN;

drop table if exists KATALOG_BARANG;

drop table if exists NEGARA;

drop table if exists PEGAWAI;

drop table if exists PEMBAYARAN;

drop table if exists PEMESANAN;

drop table if exists PENAWARAN;

drop table if exists PENGIRIMAN;

/*==============================================================*/
/* Table: BARANG                                                */
/*==============================================================*/
create table BARANG
(
   ID_BARANG            char(4) not null,
   ID_JENIS             char(2),
   NAMA_BARANG          varchar(30),
   STOK_BRARNG          int,
   BERAT_BARANG         varchar(6),
   HARGA_JUAL           float(8),
   GAMBAR_BARANG        varchar(100),
   primary key (ID_BARANG)
);

/*==============================================================*/
/* Table: CALON_KONSUMEN                                        */
/*==============================================================*/
create table CALON_KONSUMEN
(
   ID_CALONKONSUMEN     char(6) not null,
   ID_NEGARA            char(4),
   NAMA_CALONKONSUMEN   varchar(60),
   EMAIL_CALONKONSUMEN  varchar(100),
   TGL_PENAWARANTERAKHIR date,
   primary key (ID_CALONKONSUMEN)
);

/*==============================================================*/
/* Table: DETAIL_JNS_DOK                                        */
/*==============================================================*/
create table DETAIL_JNS_DOK
(
   NO_RESI              char(20) not null,
   ID_JENIS_DOKUMEN     char(2) not null,
   NO_DOKUMEN           varchar(20),
   TGL_DOKUMENDITERIMA  date,
   FILE_PATH            varchar(100),
   primary key (NO_RESI, ID_JENIS_DOKUMEN)
);

/*==============================================================*/
/* Table: DETAIL_KATALOG                                        */
/*==============================================================*/
create table DETAIL_KATALOG
(
   ID_KATALOG           char(6) not null,
   ID_BARANG            char(4) not null,
   JUMLAH_BARANG        int,
   primary key (ID_KATALOG, ID_BARANG)
);

/*==============================================================*/
/* Table: DETAIL_PEMESANAN                                      */
/*==============================================================*/
create table DETAIL_PEMESANAN
(
   ID_BARANG            char(4) not null,
   ID_PEMESANAN         char(8) not null,
   SUB_TOTAL            float(8),
   TOTAL_BERAT          varchar(8),
   primary key (ID_BARANG, ID_PEMESANAN)
);

/*==============================================================*/
/* Table: DETAIL_PENAWARAN                                      */
/*==============================================================*/
create table DETAIL_PENAWARAN
(
   ID_PENAWRAN          char(8) not null,
   ID_CALONKONSUMEN     char(6) not null,
   STATUS_PENAWARAN     int,
   BALASAN              varchar(20),
   primary key (ID_PENAWRAN, ID_CALONKONSUMEN)
);

/*==============================================================*/
/* Table: JABATAN                                               */
/*==============================================================*/
create table JABATAN
(
   ID_JABATAN           char(2) not null,
   NAMA_JABATAN         varchar(30),
   primary key (ID_JABATAN)
);

/*==============================================================*/
/* Table: JENIS_BARANG                                          */
/*==============================================================*/
create table JENIS_BARANG
(
   ID_JENIS             char(2) not null,
   NAMA_JENIS           varchar(30),
   primary key (ID_JENIS)
);

/*==============================================================*/
/* Table: JENIS_DOKUMEN                                         */
/*==============================================================*/
create table JENIS_DOKUMEN
(
   ID_JENIS_DOKUMEN     char(2) not null,
   NAMA_DOKUMEN         varchar(30),
   primary key (ID_JENIS_DOKUMEN)
);

/*==============================================================*/
/* Table: KATALOG_BARANG                                        */
/*==============================================================*/
create table KATALOG_BARANG
(
   ID_KATALOG           char(6) not null,
   NAMA_KATALOG         varchar(30),
   FILE_KATALOG         varchar(30),
   primary key (ID_KATALOG)
);

/*==============================================================*/
/* Table: NEGARA                                                */
/*==============================================================*/
create table NEGARA
(
   ID_NEGARA            char(4) not null,
   NAMA_NEGARA          varchar(30),
   primary key (ID_NEGARA)
);

/*==============================================================*/
/* Table: PEGAWAI                                               */
/*==============================================================*/
create table PEGAWAI
(
   ID_PEGAWAI           char(4) not null,
   ID_JABATAN           char(2),
   NAMA_PEGAWAI         varchar(30),
   TELP_PEGAWAI         varchar(15),
   EMAIL_PEGAWAI        varchar(50),
   ALAMAT_PEGAWAI       varchar(50),
   JK_PEGAWAI           smallint,
   PASS_PEGAWAI         varchar(20),
   primary key (ID_PEGAWAI)
);

/*==============================================================*/
/* Table: PEMBAYARAN                                            */
/*==============================================================*/
create table PEMBAYARAN
(
   TGL_PEMBBAYARAN      date,
   BUKTI_PEMBAYARAN     varchar(100),
   JENIS_PEMBAYARAN     varchar(20),
   STATUS_PEMBAYARAN    int,
   TOTAL_PEMBAYARAN     float(8),
   ID_PEMBAYARAN        char(8) not null,
   ID_PEMESANAN         char(8),
   ID_PEGAWAI           char(4),
   primary key (ID_PEMBAYARAN)
);

/*==============================================================*/
/* Table: PEMESANAN                                             */
/*==============================================================*/
create table PEMESANAN
(
   ID_PEMESANAN         char(8) not null,
   ID_CALONKONSUMEN     char(6),
   ID_PENAWRAN          char(8),
   ID_PEGAWAI           char(4),
   TGL_PEMESANAN        timestamp,
   STATUS_PEMESANAN     char(2),
   ALAMAT_PENGIRIMAN    varchar(100),
   TOTAL_HARGA          float(8),
   primary key (ID_PEMESANAN)
);

/*==============================================================*/
/* Table: PENAWARAN                                             */
/*==============================================================*/
create table PENAWARAN
(
   ID_PENAWRAN          char(8) not null,
   ID_KATALOG           char(6),
   TGL_PENAWARAN        date not null,
   primary key (ID_PENAWRAN)
);

/*==============================================================*/
/* Table: PENGIRIMAN                                            */
/*==============================================================*/
create table PENGIRIMAN
(
   NO_RESI              char(20) not null,
   ID_PEMBAYARAN        char(8),
   STATUS_PENGIRIMAN    smallint,
   TGL_PENGIRIMAN       date,
   primary key (NO_RESI)
);

alter table BARANG add constraint FK_REFERENCE_6 foreign key (ID_JENIS)
      references JENIS_BARANG (ID_JENIS) on delete restrict on update restrict;

alter table CALON_KONSUMEN add constraint FK_REFERENCE_11 foreign key (ID_NEGARA)
      references NEGARA (ID_NEGARA) on delete restrict on update restrict;

alter table DETAIL_JNS_DOK add constraint FK_Reference_16 foreign key (NO_RESI)
      references PENGIRIMAN (NO_RESI) on delete restrict on update restrict;

alter table DETAIL_JNS_DOK add constraint FK_Reference_17 foreign key (ID_JENIS_DOKUMEN)
      references JENIS_DOKUMEN (ID_JENIS_DOKUMEN) on delete restrict on update restrict;

alter table DETAIL_KATALOG add constraint FK_Reference_4 foreign key (ID_KATALOG)
      references KATALOG_BARANG (ID_KATALOG) on delete restrict on update restrict;

alter table DETAIL_KATALOG add constraint FK_Reference_5 foreign key (ID_BARANG)
      references BARANG (ID_BARANG) on delete restrict on update restrict;

alter table DETAIL_PEMESANAN add constraint FK_Reference_10 foreign key (ID_PEMESANAN)
      references PEMESANAN (ID_PEMESANAN) on delete restrict on update restrict;

alter table DETAIL_PEMESANAN add constraint FK_Reference_9 foreign key (ID_BARANG)
      references BARANG (ID_BARANG) on delete restrict on update restrict;

alter table DETAIL_PENAWARAN add constraint FK_Reference_1 foreign key (ID_PENAWRAN)
      references PENAWARAN (ID_PENAWRAN) on delete restrict on update restrict;

alter table DETAIL_PENAWARAN add constraint FK_Reference_2 foreign key (ID_CALONKONSUMEN)
      references CALON_KONSUMEN (ID_CALONKONSUMEN) on delete restrict on update restrict;

alter table PEGAWAI add constraint FK_REFERENCE_12 foreign key (ID_JABATAN)
      references JABATAN (ID_JABATAN) on delete restrict on update restrict;

alter table PEMBAYARAN add constraint FK_REFERENCE_13 foreign key (ID_PEMESANAN)
      references PEMESANAN (ID_PEMESANAN) on delete restrict on update restrict;

alter table PEMBAYARAN add constraint FK_REFERENCE_14 foreign key (ID_PEGAWAI)
      references PEGAWAI (ID_PEGAWAI) on delete restrict on update restrict;

alter table PEMESANAN add constraint FK_REFERENCE_18 foreign key (ID_PEGAWAI)
      references PEGAWAI (ID_PEGAWAI) on delete restrict on update restrict;

alter table PEMESANAN add constraint FK_REFERENCE_7 foreign key (ID_PENAWRAN)
      references PENAWARAN (ID_PENAWRAN) on delete restrict on update restrict;

alter table PEMESANAN add constraint FK_REFERENCE_8 foreign key (ID_CALONKONSUMEN)
      references CALON_KONSUMEN (ID_CALONKONSUMEN) on delete restrict on update restrict;

alter table PENAWARAN add constraint FK_REFERENCE_3 foreign key (ID_KATALOG)
      references KATALOG_BARANG (ID_KATALOG) on delete restrict on update restrict;

alter table PENGIRIMAN add constraint FK_REFERENCE_15 foreign key (ID_PEMBAYARAN)
      references PEMBAYARAN (ID_PEMBAYARAN) on delete restrict on update restrict;

