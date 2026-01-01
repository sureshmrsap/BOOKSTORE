using {
    cuid,
    managed
} from '@sap/cds/common';

namespace toturial.db;

entity Books : cuid, managed {
    title       : String;
    author      : Association to Authors;
    genre       : String;
    publichedAt : Date;
    pages       : Integer;
    price       : Decimal(9, 2);
    stock       : Integer;
    status      : Association to BookStatus;
    Chapters    : Composition of many Chapters
                      on Chapters.book = $self;
}

entity BookStatus {
    code         : String(1) enum {
        Available = 'A';
        Low_stock = 'L';
        Unavailable = 'U';
    };
    criticality  : Integer;
    display_text : String;
}

entity Authors : cuid, managed {
    name  : String;
    books : Association to many Books
                on books.author = $self;
}

entity Chapters : cuid, managed {
    key book    : Association to Books;
        numbers : Integer;
        title   : String;
        pages   : Integer;

}
