from sqlalchemy import create_engine

DB_URI = "postgresql+psycopg2://postgres:citypass@localhost:5432/city_insights"
engine = create_engine(DB_URI)
