CREATE TABLE hotels(
    ID_hotel int PRIMARY KEY AUTO_INCREMENT,
    hotel_name varchar(150) NOT NULL,
    hotel_address varchar(250) NOT NULL,
    lat decimal(10,6) NOT NULL,
    lng decimal(11,6) NOT NULL,
    hotel_country varchar(50) NOT NULL,
    hotel_city varchar(50) NOT NULL
	);
   
CREATE TABLE reviewers(
    ID_reviewer int PRIMARY KEY AUTO_INCREMENT,
    reviewer_nationality varchar(50) NOT NULL,
    total_number_of_reviews_reviewer_has_given int NOT NULL
    );
    
CREATE TABLE reviews(
    ID_review int PRIMARY KEY AUTO_INCREMENT,
    review_date date NOT NULL,
    negative_review text,
    review_total_negative_word_counts int NOT NULL,
    positive_review text,
    review_total_positive_word_counts int NOT NULL,
    reviewer_score decimal(3,1) NOT NULL,
    tags text NOT NULL,
    day_since_review int NOT NULL,
    review_length int NOT NULL,
    year int NULL,
    month int NOT NULL,
    ID_reviewer int,
    FOREIGN KEY (ID_reviewer) REFERENCES reviewers(ID_reviewer),
    ID_hotel int,
    FOREIGN KEY (ID_hotel) REFERENCES hotels(ID_hotel)
    );
    
CREATE TABLE hotel_stats(
    ID_hotel int PRIMARY KEY,
    average_score decimal(3,1) NOT NULL,
    total_number_of_reviews int NOT NULL,
    additional_number_of_scoring int NOT NULL,
    FOREIGN KEY (ID_hotel) REFERENCES hotels(ID_hotel) ON DELETE CASCADE
    );

CREATE TABLE supporto(
    hotel_address varchar(250) NOT NULL,
    additional_number_of_scoring int NOT NULL,
    review_date date NOT NULL,
    average_score decimal(3,1) NOT NULL,
    hotel_name varchar(150) NOT NULL,
	reviewer_nationality varchar(50) NOT NULL,
    negative_review text,
    review_total_negative_word_counts int NOT NULL,
    total_number_of_reviews int NOT NULL,
    positive_review text,
    review_total_positive_word_counts int NOT NULL,
    total_number_of_reviews_reviewer_has_given int NOT NULL,
    reviewer_score decimal(3,1) NOT NULL,
    tags text NOT NULL,
    days_since_review int NOT NULL,
    lat decimal(10,6) NOT NULL,
    lng decimal(11,6) NOT NULL,
    year int NULL,
    month int NOT NULL,
    review_length int NOT NULL,
    hotel_country varchar(50) NOT NULL,
    hotel_city varchar(50) NOT NULL
    );