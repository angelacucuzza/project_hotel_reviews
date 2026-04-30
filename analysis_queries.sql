-- Verifica: conteggi righe
SELECT 'hotels' as tabella, COUNT(*) as totale FROM hotels
UNION
SELECT 'reviewers', COUNT(*) FROM reviewers
UNION
SELECT 'reviews', COUNT(*) FROM reviews
UNION
SELECT 'hotel_stats', COUNT(*) FROM hotel_stats;

-- Verifica: join hotels-reviews
SELECT 
    h.hotel_name, 
    COUNT(r.ID_review) as numero_recensioni
FROM hotels AS h
LEFT JOIN reviews AS r ON h.ID_hotel = r.ID_hotel
GROUP BY h.ID_hotel, h.hotel_name
ORDER BY numero_recensioni DESC
LIMIT 10;

-- Verifica: distribuzione score per nazionalità
SELECT 
    r.reviewer_nationality, 
    COUNT(rev.reviewer_score) AS numero_recensioni,
    MIN(rev.reviewer_score) AS voto_minimo,
    MAX(rev.reviewer_score) AS voto_massimo,
    AVG(rev.reviewer_score) AS voto_medio
FROM reviews AS rev 
JOIN reviewers AS r ON r.ID_reviewer = rev.ID_reviewer
GROUP BY r.reviewer_nationality
ORDER BY voto_medio DESC
LIMIT 30;

-- QUERIES
-- 4.3.1.1 Andamento delle recensioni (Mese e Anno)
-- Analisi del volume dei feedback e della distribuzione dei punteggi su base mensile.
-- Permette di osservare la stagionalità e l'evoluzione della soddisfazione dei clienti.

SELECT r.year AS anno,
	r.month AS mese,
    COUNT(*) AS totale_recensioni,
    MIN(r.reviewer_score) AS punteggio_minimo,
    MAX(r.reviewer_score) AS punteggio_massimo,
    ROUND(AVG(r.reviewer_score), 3) AS punteggio_medio
FROM reviews AS r
GROUP BY r.year, r.month
ORDER BY r.year ASC, r.month ASC

-- 4.3.1.2 Hotel con picco recensioni calcolato nel mese
-- Questa query identifica quale hotel ha ricevuto il maggior volume di recensioni in un singolo mese, evidenziando i momenti di massima affluenza.
SELECT h.ID_hotel, h.hotel_name, r.year, r.month, COUNT(*) AS recensioni_mensili
FROM reviews AS r JOIN hotels AS h ON r.ID_hotel=h.ID_hotel
GROUP BY h.ID_hotel, r.year, r.month
ORDER BY recensioni_mensili DESC
LIMIT 1;

-- 4.3.2.1 Top 10 nazionalità per volume di recensioni e punteggio medio
SELECT rev.reviewer_nationality AS nazionalita,
	COUNT(*) AS numero_recensioni,
    AVG(r.reviewer_score) as score_medio
FROM reviewers AS rev JOIN reviews AS r ON rev.ID_reviewer = r.ID_reviewer
GROUP BY nazionalita
ORDER BY numero_recensioni DESC
LIMIT 10;

-- 4.3.2.2 % contributo top nazionalità al totale recensioni
SELECT rev.reviewer_nationality AS nazionalita,
	COUNT(*) AS numero_recensioni,
    ROUND((COUNT(*) * 100 / (SELECT COUNT(*) FROM reviews)), 2) AS percentuale_contributo
FROM reviewers AS rev JOIN reviews AS r ON rev.ID_reviewer = r.ID_reviewer
GROUP BY nazionalita
ORDER BY numero_recensioni DESC
LIMIT 10;

-- 4.3.2.3 Confronto score medio UK vs altri
SELECT
	CASE
    	WHEN rev.reviewer_nationality = "United Kingdom" THEN "UK"
        ELSE "altri"
	END AS categoria_provenienza,
    COUNT(*) AS numero_recensioni,
    AVG(r.reviewer_score) AS punteggio_medio
FROM reviewers AS rev JOIN reviews AS r ON rev.ID_reviewer = r.ID_reviewer
GROUP BY categoria_provenienza;

-- 4.3.3.1 Hotel con maggior Average_Score e numero recensioni
-- Seleziona l'hotel con il punteggio medio più alto. 
-- A parità di punteggio, premia la struttura con il maggior numero di recensioni.

SELECT h.ID_hotel,
	h.hotel_name AS nome_hotel,
    hs.average_score,
    hs.total_number_of_reviews as numero_totale_recensioni
FROM hotels AS h JOIN hotel_stats AS hs ON h.ID_hotel = hs.ID_hotel
ORDER BY hs.average_score DESC, hs.total_number_of_reviews DESC
LIMIT 1;

-- 4.3.3.2 Analisi gap tra Reviewer Score e Average Score
-- Calcola la differenza tra la media dei voti nel database e lo score ufficiale.
-- Un gap positivo indica un miglioramento, un gap negativo un peggioramento.
SELECT h.hotel_name,
	hs.average_score AS score_ufficiale,
    AVG(r.reviewer_score) as media_recensioni_attuali,
    ROUND(AVG(r.reviewer_score) - hs.average_score, 2) AS gap_punteggio
FROM reviews as r 
	JOIN hotels AS h ON r.ID_hotel = h.ID_hotel
    JOIN hotel_stats AS hs ON h.ID_hotel = hs.ID_hotel
GROUP BY h.ID_hotel, h.hotel_name, hs.average_score
ORDER BY gap_punteggio DESC;

-- 4.3.4.1 Distribuzione recensioni per città
SELECT h.hotel_city AS citta,
	COUNT(*) as numero_recensioni,
    ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM reviews), 2) AS percentuale_sul_totale
FROM hotels AS h JOIN reviews as r ON h.ID_hotel = r.ID_hotel
GROUP BY h.hotel_city
ORDER BY numero_recensioni DESC;

-- 4.3.4.2 Score medio per nazione, top città
SELECT h.hotel_country AS nazione_hotel,
	h.hotel_city AS citta,
    ROUND(AVG(r.reviewer_score), 2) AS punteggio_medio,
    COUNT(*) AS numero_recensioni
FROM hotels AS h JOIN reviews as r ON h.ID_hotel = r.ID_hotel
GROUP BY nazione_hotel, citta
ORDER BY punteggio_medio DESC;

-- 4.3.5.1 Distribuzione Review_Length per categoria score
SELECT
	CASE
    	WHEN r.reviewer_score < 5 THEN "PESSIMO (0-5)"
        WHEN r.reviewer_score >= 5 AND r.reviewer_score <7 THEN "MEDIOCRE (5-7)"
        WHEN r.reviewer_score >=7 AND r.reviewer_score < 9 THEN "BUONE (7-9)"
        ELSE "ECCELLENTE (9-10)"
	END AS categoria_score,
    COUNT(*) AS numero_recensioni,
    ROUND(AVG(r.review_length), 2) AS numero_medio_caratteri,
    MAX(r.review_length) AS recensione_piu_lunga
FROM reviews as r 
GROUP BY categoria_score
ORDER BY categoria_score

-- 4.3.5.2 Correlazione lunghezza recensione vs Reviewer_Score
-- Questa query mostra se chi dà voti alti scrive di più o di meno di chi dà voti bassi.
SELECT r.reviewer_score AS voto,
	ROUND(AVG(r.review_length), 2) AS lunghezza_media_testo,
    COUNT(*) AS totale_recensioni
FROM reviews AS r 
GROUP BY voto
ORDER BY voto DESC;