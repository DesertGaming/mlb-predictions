# Global Postgres connecion logic

import os
import psycopg2
from dotenv import load_dotenv

load_dotenv()

def get_connection():
    """
    Returns new psycopg2 connection uning DATABASE_URL in enviornment. Caller is resposible for closing the connection.
    """
    database_url = os.environ.get("DATABASE_URL")

    if not database_url:
        raise RuntimeError("DATBASE_URL is not set. Check .env or repo secrets.")

    return psycopg2.connect(database_url)


# Sanity check for initial connection test
if __name__ == "__main__":
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            cur.execute("SELECT 1;")
            result = cur.fetchone()
            print(f"Connection successful. Test query returned: {result}")
    finally:
        conn.close()