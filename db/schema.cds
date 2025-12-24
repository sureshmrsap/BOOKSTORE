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

    Chapters    : Composition of many Chapters
                      on Chapters.book = $self;
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
