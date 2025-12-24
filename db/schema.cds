using {
    cuid,
    managed
} from '@sap/cds/common';

namespace toturial.db;

entity Books : cuid, managed {
    title    : String;
    author   : Association to Authors;
    Chapters : Composition of many Chapters
                   on Chapters.book = $self;
}

entity Authors : cuid, managed {
    name  : String;
    books : Association to many Books
                on books.author = $self;
}

entity Chapters : cuid, managed {
        numbers : Integer;
    key book    : Association to Books;
}
