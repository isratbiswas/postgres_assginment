1. What is PostgreSQL?
Ans : PostgreSQL হচ্ছে একটি  ওপেন সোর্স রিলেশনাল ডাটাবেইস ম্যানেজমেন্ট সিস্টেম (RDBMS), যা ডেটা সংরক্ষণ, পরিচালনা এবং রিলেশন অনুযায়ী বিশ্লেষণের জন্য ব্যবহৃত হয়।

2. What is the purpose of a database schema in PostgreSQL?
Ans: PostgreSQL-এ একটি ডেটাবেস (Schema) হলো একটি লজিক্যাল কাঠামো যা ডেটাবেসের মধ্যে বিভিন্ন অবজেক্ট (যেমন টেবিল, ভিউ, ফাংশন, ইনডেক্স ইত্যাদি) গুছিয়ে রাখে।

একটি Schema  মূল উদ্দেশ্য হলো—
 1. ডেটা সংগঠিতভাবে সংরক্ষণ করা
 2. Name conflict এড়ানো
 etc
 উদাহরণ:

CREATE SCHEMA inventory;

CREATE TABLE inventory.products (
    id SERIAL PRIMARY KEY,
    name TEXT,
    price NUMERIC
);

3.Explain the Primary Key and Foreign Key concepts in PostgreSQL.
Ans: 

PostgreSQL-এ Primary Key এবং Foreign Key হলো দুটি গুরুত্বপূর্ণ ডেটাবেস কনসেপ্ট, যা ডেটার ইউনিকনেস এবং টেবিলগুলোর মধ্যে সম্পর্ক বজায় রাখতে সাহায্য করে।

*Primary key : একটি টেবিলে প্রতিটি রেকর্ড (row) আলাদা করে চেনার জন্য Primary Key ব্যবহার করা হয়।
 বৈশিষ্ট্য: 
  1. ইউনিক (Unique): প্রতিটি ভ্যালু আলাদা হতে হবে।
  2. NOT NULL: ফাঁকা রাখা যাবে না।
 উদাহরণ:
  CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT
);

* Foreign Key: একটি টেবিলের কলামের মাধ্যমে অন্য টেবিলের Primary Key-এর সাথে সম্পর্ক স্থাপন করা।
  বৈশিষ্ট্য:
এটি ডেটার ইন্টেগ্রিটি (Integrity) বজায় রাখে।

মূলত দুটি টেবিলের মধ্যে parent-child সম্পর্ক তৈরি করে।
 উদাহরণ:
  CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name TEXT
);

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

5.Explain the purpose of the WHERE clause in a SELECT statement.
Ans: WHERE clause SQL-এর SELECT স্টেটমেন্টে ব্যবহার করা হয় ডেটা ফিল্টার করার জন্য, অর্থাৎ টেবিল থেকে নির্দিষ্ট শর্ত অনুযায়ী রেকর্ড বাছাই করার জন্য।

SELECT স্টেটমেন্টে WHERE ক্লজ ব্যবহার করলে আপনি শুধু সেইসব রেকর্ড পাবেন যেগুলো শর্ত (condition) পূরণ করে।
উদাহরণ: ধরি আমাদের একটি টেবিল আছে — students:
SELECT * FROM students
WHERE age = 18;

7.How can you modify data using UPDATE statements?
Ans: UPDATE স্টেটমেন্ট ব্যবহার করে একটি টেবিলের এক বা একাধিক রেকর্ডের বিদ্যমান ডেটা পরিবর্তন করা যায়।

 উদাহরণ:
ধরি, আমাদের একটি টেবিল আছে students:

  UPDATE students
SET age = 21
WHERE name = 'Karim';