use StudentLibraryManagement;
 
 create table student
 (
     id varchar(5) primary key,
     name varchar(50)
 );
 
 create table librarian
 (
     lib_id varchar(5) primary key,
     lib_name varchar(50)
 );
 create table book
 (
     book_id varchar(5) primary key,
     book_name varchar(50)
 );
 
 create table borrow
 (
     who_borrow_id varchar(5),
     which_book_id varchar(5),
     borrow_date Date,
     return_date Date,
     
     foreign key(who_borrow_id) references student(id),
	 foreign key(which_book_id) references book(book_id),
     
     primary key(who_borrow_id, which_book_id)
 );
 
  create table permission
 (
     who_permitted_lib_id varchar(5),
     which_book_id varchar(5),
     
     foreign key(who_permitted_lib_id) references student(lib_id),
	 foreign key(which_book_id) references book(book_id),
     
     primary key(who_permitted_lib_id, which_book_id)
 );

--Schema = Table's structure/design -> what columns + what type of data
 

