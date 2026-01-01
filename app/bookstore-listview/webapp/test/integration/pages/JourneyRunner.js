sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"bookstore/bookstorelistview/test/integration/pages/BooksList",
	"bookstore/bookstorelistview/test/integration/pages/BooksObjectPage"
], function (JourneyRunner, BooksList, BooksObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('bookstore/bookstorelistview') + '/test/flpSandbox.html#bookstorebookstorelistview-tile',
        pages: {
			onTheBooksList: BooksList,
			onTheBooksObjectPage: BooksObjectPage
        },
        async: true
    });

    return runner;
});

