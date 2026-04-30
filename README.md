🏨 Booking.com Data Intelligence: Big Data Analysis & Reputation Strategy

📌 Project Overview

Questo progetto nasce con l'obiettivo di trasformare oltre 515.000 recensioni di hotel di lusso in Europa in insight strategici. Attraverso l'integrazione di Python e SQL, ho analizzato le dinamiche che legano l'esperienza dell'ospite alla performance economica, fornendo strumenti concreti per il Revenue Management e il monitoraggio della reputazione online.

Dataset Source: Il progetto utilizza il dataset pubblico 515K Hotel Reviews Data in Europe disponibile su Kaggle.

🚀 Data Engineering Pipeline & Workflow

Il progetto segue un'architettura rigorosa per garantire l'integrità del dato e la scalabilità dell'analisi su grandi volumi. Per consultare o replicare il progetto, seguire l'ordine logico dei moduli:

1️⃣ Data Refining & Pre-processing (EDA_Cleaning.ipynb)

In questa fase critica, il dataset grezzo (Kaggle) viene trasformato in un asset pronto per l'analisi.

•	Pulizia dei dati e gestione dei valori mancanti tramite Pandas e NumPy.

•	Normalizzazione dei tipi di dato e feature engineering.

•	Esportazione del dataset ottimizzato per l'ambiente database.

2️⃣ Relational Database Design (create_table.sql)

Progettazione di uno schema SQL normalizzato per massimizzare l'efficienza delle query.

•	Definizione delle entità: hotels, reviews, reviewers e hotel_stats.

•	Introduzione di una tabella di staging (supporto), utilizzata per il caricamento massivo dei dati.

•	Implementazione di vincoli di integrità referenziale.

3️⃣ High-Performance Data Ingestion (import_csv.py)

Sviluppo di uno script Python custom per il caricamento massivo dei dati.

•	Utilizzo della tecnica di chunking (blocchi da 5.000 record) per prevenire timeout del server.

•	Automazione del processo di popolamento del database tramite SQLAlchemy.

4️⃣ Data Migration & Normalization (Insert_data.sql)

Gestione della transizione dei dati dalla tabella di staging (supporto) alle tabelle finali.

•	Distribuzione atomica delle informazioni per eliminare la ridondanza.

•	Popolamento dei metadati degli hotel e dei profili dei recensori.

5️⃣ Strategic Analytics & Validation (analysis_queries.sql & 02_analysis_pandas_plots.ipynb)

Il cuore analitico del progetto, dove i dati diventano informazioni.

•	Estrazione dei KPI tramite query SQL avanzate.

•	Cross-Environment Validation: confronto dei risultati tra SQL e Python per garantire la precisione statistica.

•	Visualizzazione scientifica dei trend (Seaborn/Matplotlib).

6️⃣ Final Reporting (Final_report.pdf)

Documento di sintesi direzionale che raccoglie le conclusioni dello studio.

•	Interpretazione dei risultati e raccomandazioni operative per la gestione alberghiera.

•	Presentazione degli insight sui mercati chiave e sul benchmarking cittadino.

💡 Key Business Insights

•	Negative Feedback Correlation: Identificata una correlazione negativa (-0.38) tra punteggio e lunghezza della recensione: un cliente insoddisfatto scrive mediamente il doppio di uno soddisfatto, rendendo la lunghezza del commento un "indicatore precoce di criticità".

•	Geographical Dominance: Il mercato UK rappresenta quasi il 48% dei volumi, suggerendo strategie di marketing mirate.

•	Stagionalità: I dati mostrano picchi di feedback a luglio, evidenziando la necessità di intensificare il monitoraggio reputazionale durante l'alta stagione.

•	City Benchmarking: Vienna emerge come la città con il gradimento medio più alto (8.57/10).

🛠️ Tech Stack

•	Languages: SQL, Python.

•	Libraries: Pandas, NumPy, SQLAlchemy, Seaborn, Matplotlib.

•	Infrastructure: Database relazionale (SQL Server/PostgreSQL).
