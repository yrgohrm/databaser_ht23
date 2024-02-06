package se.yrgo;

import com.github.javafaker.*;

public class Main {
    public static void main(String[] args) {
        Faker faker = new Faker();

        for (int i = 0; i < 10; i++) {
            
            String firstName = faker.name().firstName(); // Emory
            String lastName = faker.name().lastName(); // Barton
    
            String streetAddress = faker.address().streetAddress(); // 60018 Sawayn Brooks Suite 449
    
            System.out.printf("INSERT INTO foo VALUES ('%s', '%s', '%s');%n", firstName, lastName, streetAddress);
        }

        generateBookData();
    }

    /*
     * Generates test data for the following two tables and inserts them into
     * a JDBC Connection object.
     * 
     * CREATE TABLE BookEdition
     *  (
     *   isbn CHAR(13) PRIMARY KEY,
     *   title VARCHAR(80),
     *   author VARCHAR(60) NOT NULL
     * );
     *
     * CREATE TABLE Book
     * (
     *     book_id INT IDENTITY(1,1) PRIMARY KEY,
     *     isbn CHAR(13) NOT NULL FOREIGN KEY REFERENCES BookEdition(isbn),
     *     purchase_date DATE NOT NULL
     * );
     * 
     */
    public static void generateBookData() {
        Faker faker = new Faker();

        for (int i = 0; i < 10; i++) {
            String isbn = faker.code().isbn13(); // 978-1-56931-696-5
            String title = faker.book().title(); // The Catcher in the Rye
            String author = faker.book().author(); // J.D. Salinger

            System.out.printf("INSERT INTO BookEdition VALUES ('%s', '%s', '%s');%n", isbn, title, author);
        }

        for (int i = 0; i < 10; i++) {
            int bookId = faker.number().numberBetween(1, 10); // 1
            String isbn = faker.code().isbn13(); // 978-1-56931-696-5
            String purchaseDate = faker.date().birthday().toString(); // 2021-09-01

            System.out.printf("INSERT INTO Book VALUES (%d, '%s', '%s');%n", bookId, isbn, purchaseDate);
        }
    }
}
