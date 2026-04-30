-- CARICO I DATI NELLA TABELLA hotels
INSERT INTO hotels (hotel_name, hotel_address, lat, lng, hotel_country, hotel_city)
SELECT DISTINCT hotel_name, hotel_address, lat, lng, hotel_country, hotel_city
FROM supporto;

-- CARICO I DATI NELLA TABELLA hotel_stats
INSERT INTO hotel_stats (ID_hotel, average_score, total_number_of_reviews, additional_number_of_scoring)
SELECT h.ID_hotel, s.average_score, s.total_number_of_reviews, s.additional_number_of_scoring
FROM supporto AS s
JOIN hotels AS h ON s.hotel_address = h.hotel_address AND s.hotel_name = h.hotel_name
GROUP BY h.ID_hotel;

-- CARICO I DATI NELLA TABELLA reviewers
INSERT INTO reviewers (reviewer_nationality, total_number_of_reviews_reviewer_has_given)
SELECT DISTINCT reviewer_nationality, total_number_of_reviews_reviewer_has_given
FROM supporto;


-- CARICO I DATI A BLOCCHI NELLA TABELLA reviews
ALTER TABLE supporto ADD INDEX (hotel_name), ADD INDEX (hotel_address), ADD INDEX (reviewer_nationality);
ALTER TABLE hotels ADD INDEX (hotel_name), ADD INDEX (hotel_address);
ALTER TABLE reviewers ADD INDEX (reviewer_nationality), ADD INDEX (total_number_of_reviews_reviewer_has_given);

INSERT INTO reviews (
    review_date, negative_review, review_total_negative_word_counts, 
    positive_review, review_total_positive_word_counts, reviewer_score, 
    tags, day_since_review, review_length, year, month, ID_reviewer, ID_hotel
)
SELECT 
    s.review_date, s.negative_review, s.review_total_negative_word_counts,
    s.positive_review, s.review_total_positive_word_counts, s.reviewer_score,
    s.tags, s.days_since_review, s.review_length, s.year, s.month,
    r.ID_reviewer,
    h.ID_hotel
FROM supporto s
JOIN hotels h ON s.hotel_name = h.hotel_name AND s.hotel_address = h.hotel_address
JOIN reviewers r ON s.reviewer_nationality = r.reviewer_nationality 
     AND s.total_number_of_reviews_reviewer_has_given = r.total_number_of_reviews_reviewer_has_given
LIMIT 0, 10000;

INSERT INTO reviews (
    review_date, negative_review, review_total_negative_word_counts, 
    positive_review, review_total_positive_word_counts, reviewer_score, 
    tags, day_since_review, review_length, year, month, ID_reviewer, ID_hotel
)
SELECT 
    s.review_date, s.negative_review, s.review_total_negative_word_counts,
    s.positive_review, s.review_total_positive_word_counts, s.reviewer_score,
    s.tags, s.days_since_review, s.review_length, s.year, s.month,
    r.ID_reviewer,
    h.ID_hotel
FROM supporto s
JOIN hotels h ON s.hotel_name = h.hotel_name AND s.hotel_address = h.hotel_address
JOIN reviewers r ON s.reviewer_nationality = r.reviewer_nationality 
     AND s.total_number_of_reviews_reviewer_has_given = r.total_number_of_reviews_reviewer_has_given
LIMIT 10000, 10000;

INSERT INTO reviews (
    review_date, negative_review, review_total_negative_word_counts, 
    positive_review, review_total_positive_word_counts, reviewer_score, 
    tags, day_since_review, review_length, year, month, ID_reviewer, ID_hotel
)
SELECT 
    s.review_date, s.negative_review, s.review_total_negative_word_counts,
    s.positive_review, s.review_total_positive_word_counts, s.reviewer_score,
    s.tags, s.days_since_review, s.review_length, s.year, s.month,
    r.ID_reviewer,
    h.ID_hotel
FROM supporto s
JOIN hotels h ON s.hotel_name = h.hotel_name AND s.hotel_address = h.hotel_address
JOIN reviewers r ON s.reviewer_nationality = r.reviewer_nationality 
     AND s.total_number_of_reviews_reviewer_has_given = r.total_number_of_reviews_reviewer_has_given
LIMIT 20000, 20000;

INSERT INTO reviews (
    review_date, negative_review, review_total_negative_word_counts, 
    positive_review, review_total_positive_word_counts, reviewer_score, 
    tags, day_since_review, review_length, year, month, ID_reviewer, ID_hotel
)
SELECT 
    s.review_date, s.negative_review, s.review_total_negative_word_counts,
    s.positive_review, s.review_total_positive_word_counts, s.reviewer_score,
    s.tags, s.days_since_review, s.review_length, s.year, s.month,
    r.ID_reviewer,
    h.ID_hotel
FROM supporto s
JOIN hotels h ON s.hotel_name = h.hotel_name AND s.hotel_address = h.hotel_address
JOIN reviewers r ON s.reviewer_nationality = r.reviewer_nationality 
     AND s.total_number_of_reviews_reviewer_has_given = r.total_number_of_reviews_reviewer_has_given
LIMIT 40000, 20000;

INSERT INTO reviews (
    review_date, negative_review, review_total_negative_word_counts, 
    positive_review, review_total_positive_word_counts, reviewer_score, 
    tags, day_since_review, review_length, year, month, ID_reviewer, ID_hotel
)
SELECT 
    s.review_date, s.negative_review, s.review_total_negative_word_counts,
    s.positive_review, s.review_total_positive_word_counts, s.reviewer_score,
    s.tags, s.days_since_review, s.review_length, s.year, s.month,
    r.ID_reviewer,
    h.ID_hotel
FROM supporto s
JOIN hotels h ON s.hotel_name = h.hotel_name AND s.hotel_address = h.hotel_address
JOIN reviewers r ON s.reviewer_nationality = r.reviewer_nationality 
     AND s.total_number_of_reviews_reviewer_has_given = r.total_number_of_reviews_reviewer_has_given
LIMIT 60000, 50000;

INSERT INTO reviews (
    review_date, negative_review, review_total_negative_word_counts, 
    positive_review, review_total_positive_word_counts, reviewer_score, 
    tags, day_since_review, review_length, year, month, ID_reviewer, ID_hotel
)
SELECT 
    s.review_date, s.negative_review, s.review_total_negative_word_counts,
    s.positive_review, s.review_total_positive_word_counts, s.reviewer_score,
    s.tags, s.days_since_review, s.review_length, s.year, s.month,
    r.ID_reviewer,
    h.ID_hotel
FROM supporto s
JOIN hotels h ON s.hotel_name = h.hotel_name AND s.hotel_address = h.hotel_address
JOIN reviewers r ON s.reviewer_nationality = r.reviewer_nationality 
     AND s.total_number_of_reviews_reviewer_has_given = r.total_number_of_reviews_reviewer_has_given
LIMIT 110000, 50000;

INSERT INTO reviews (
    review_date, negative_review, review_total_negative_word_counts, 
    positive_review, review_total_positive_word_counts, reviewer_score, 
    tags, day_since_review, review_length, year, month, ID_reviewer, ID_hotel
)
SELECT 
    s.review_date, s.negative_review, s.review_total_negative_word_counts,
    s.positive_review, s.review_total_positive_word_counts, s.reviewer_score,
    s.tags, s.days_since_review, s.review_length, s.year, s.month,
    r.ID_reviewer,
    h.ID_hotel
FROM supporto s
JOIN hotels h ON s.hotel_name = h.hotel_name AND s.hotel_address = h.hotel_address
JOIN reviewers r ON s.reviewer_nationality = r.reviewer_nationality 
     AND s.total_number_of_reviews_reviewer_has_given = r.total_number_of_reviews_reviewer_has_given
LIMIT 160000, 50000;

INSERT INTO reviews (
    review_date, negative_review, review_total_negative_word_counts, 
    positive_review, review_total_positive_word_counts, reviewer_score, 
    tags, day_since_review, review_length, year, month, ID_reviewer, ID_hotel
)
SELECT 
    s.review_date, s.negative_review, s.review_total_negative_word_counts,
    s.positive_review, s.review_total_positive_word_counts, s.reviewer_score,
    s.tags, s.days_since_review, s.review_length, s.year, s.month,
    r.ID_reviewer,
    h.ID_hotel
FROM supporto s
JOIN hotels h ON s.hotel_name = h.hotel_name AND s.hotel_address = h.hotel_address
JOIN reviewers r ON s.reviewer_nationality = r.reviewer_nationality 
     AND s.total_number_of_reviews_reviewer_has_given = r.total_number_of_reviews_reviewer_has_given
LIMIT 210000, 50000;

INSERT INTO reviews (
    review_date, negative_review, review_total_negative_word_counts, 
    positive_review, review_total_positive_word_counts, reviewer_score, 
    tags, day_since_review, review_length, year, month, ID_reviewer, ID_hotel
)
SELECT 
    s.review_date, s.negative_review, s.review_total_negative_word_counts,
    s.positive_review, s.review_total_positive_word_counts, s.reviewer_score,
    s.tags, s.days_since_review, s.review_length, s.year, s.month,
    r.ID_reviewer,
    h.ID_hotel
FROM supporto s
JOIN hotels h ON s.hotel_name = h.hotel_name AND s.hotel_address = h.hotel_address
JOIN reviewers r ON s.reviewer_nationality = r.reviewer_nationality 
     AND s.total_number_of_reviews_reviewer_has_given = r.total_number_of_reviews_reviewer_has_given
LIMIT 260000, 50000;

INSERT INTO reviews (
    review_date, negative_review, review_total_negative_word_counts, 
    positive_review, review_total_positive_word_counts, reviewer_score, 
    tags, day_since_review, review_length, year, month, ID_reviewer, ID_hotel
)
SELECT 
    s.review_date, s.negative_review, s.review_total_negative_word_counts,
    s.positive_review, s.review_total_positive_word_counts, s.reviewer_score,
    s.tags, s.days_since_review, s.review_length, s.year, s.month,
    r.ID_reviewer,
    h.ID_hotel
FROM supporto s
JOIN hotels h ON s.hotel_name = h.hotel_name AND s.hotel_address = h.hotel_address
JOIN reviewers r ON s.reviewer_nationality = r.reviewer_nationality 
     AND s.total_number_of_reviews_reviewer_has_given = r.total_number_of_reviews_reviewer_has_given
LIMIT 310000, 50000;

INSERT INTO reviews (
    review_date, negative_review, review_total_negative_word_counts, 
    positive_review, review_total_positive_word_counts, reviewer_score, 
    tags, day_since_review, review_length, year, month, ID_reviewer, ID_hotel
)
SELECT 
    s.review_date, s.negative_review, s.review_total_negative_word_counts,
    s.positive_review, s.review_total_positive_word_counts, s.reviewer_score,
    s.tags, s.days_since_review, s.review_length, s.year, s.month,
    r.ID_reviewer,
    h.ID_hotel
FROM supporto s
JOIN hotels h ON s.hotel_name = h.hotel_name AND s.hotel_address = h.hotel_address
JOIN reviewers r ON s.reviewer_nationality = r.reviewer_nationality 
     AND s.total_number_of_reviews_reviewer_has_given = r.total_number_of_reviews_reviewer_has_given
LIMIT 360000, 50000;

INSERT INTO reviews (
    review_date, negative_review, review_total_negative_word_counts, 
    positive_review, review_total_positive_word_counts, reviewer_score, 
    tags, day_since_review, review_length, year, month, ID_reviewer, ID_hotel
)
SELECT 
    s.review_date, s.negative_review, s.review_total_negative_word_counts,
    s.positive_review, s.review_total_positive_word_counts, s.reviewer_score,
    s.tags, s.days_since_review, s.review_length, s.year, s.month,
    r.ID_reviewer,
    h.ID_hotel
FROM supporto s
JOIN hotels h ON s.hotel_name = h.hotel_name AND s.hotel_address = h.hotel_address
JOIN reviewers r ON s.reviewer_nationality = r.reviewer_nationality 
     AND s.total_number_of_reviews_reviewer_has_given = r.total_number_of_reviews_reviewer_has_given
LIMIT 410000, 50000;

INSERT INTO reviews (
    review_date, negative_review, review_total_negative_word_counts, 
    positive_review, review_total_positive_word_counts, reviewer_score, 
    tags, day_since_review, review_length, year, month, ID_reviewer, ID_hotel
)
SELECT 
    s.review_date, s.negative_review, s.review_total_negative_word_counts,
    s.positive_review, s.review_total_positive_word_counts, s.reviewer_score,
    s.tags, s.days_since_review, s.review_length, s.year, s.month,
    r.ID_reviewer,
    h.ID_hotel
FROM supporto s
JOIN hotels h ON s.hotel_name = h.hotel_name AND s.hotel_address = h.hotel_address
JOIN reviewers r ON s.reviewer_nationality = r.reviewer_nationality 
     AND s.total_number_of_reviews_reviewer_has_given = r.total_number_of_reviews_reviewer_has_given
LIMIT 460000, 50000;

INSERT INTO reviews (
    review_date, negative_review, review_total_negative_word_counts, 
    positive_review, review_total_positive_word_counts, reviewer_score, 
    tags, day_since_review, review_length, year, month, ID_reviewer, ID_hotel
)
SELECT 
    s.review_date, s.negative_review, s.review_total_negative_word_counts,
    s.positive_review, s.review_total_positive_word_counts, s.reviewer_score,
    s.tags, s.days_since_review, s.review_length, s.year, s.month,
    r.ID_reviewer,
    h.ID_hotel
FROM supporto s
JOIN hotels h ON s.hotel_name = h.hotel_name AND s.hotel_address = h.hotel_address
JOIN reviewers r ON s.reviewer_nationality = r.reviewer_nationality 
     AND s.total_number_of_reviews_reviewer_has_given = r.total_number_of_reviews_reviewer_has_given
LIMIT 510000, 50000;
