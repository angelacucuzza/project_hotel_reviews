import pandas as pd
from sqlalchemy import create_engine


engine = create_engine("mysql+pymysql://root@127.0.0.1:3306/hotel_reviews")

file_path = r"C:\Users\user\Desktop\Progetto\hotel_reviews_clean.csv"

for chunk in pd.read_csv(file_path, chunksize=5000):

    if "reviewer_nationality" in chunk.columns:
        chunk["reviewer_nationality"] = chunk["reviewer_nationality"].fillna("Unknown")

    if "negative_review" in chunk.columns:
        chunk["negative_review"] = chunk["negative_review"].fillna("")

    if "positive_review" in chunk.columns:
        chunk["positive_review"] = chunk["positive_review"].fillna("")

    chunk.to_sql(
        "supporto",
        con=engine,
        if_exists="append",
        index=False,
        method="multi"
    )

    print("chunk caricato")