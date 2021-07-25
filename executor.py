from configparser import ConfigParser
import psycopg2
import psycopg2.extras as psql_extras
import os
import pandas as pd
from typing import Dict


def load_connection_info(ini_filename):
    """Loads database connection info.
    Source: https://medium.com/swlh/create-your-first-postgresql-database-in-python-with-psycopg2-9d0986e0e9ac

    Parameters
    ----------
    ini_filename : str
        Path to the .ini file.

    Returns
    -------
    Dict[str, str]
        What is this? This is a copy-pasted code.
    """
    parser = ConfigParser()
    parser.read(ini_filename)

    # Create a dictionary of the variables stored under the "postgresql" section of the .ini
    conn_info = {param[0]: param[1] for param in parser.items("postgresql")}
    return conn_info


def create_db(conn_info):
    """Creates database.
    Source: https://medium.com/swlh/create-your-first-postgresql-database-in-python-with-psycopg2-9d0986e0e9ac

    Parameters
    ----------
    conn_info : Dict[str, str]
        Database connection info.
    """
    # Connect just to PostgreSQL with the user loaded from the .ini file
    psql_connection_string = (
        f"user={conn_info['user']} password={conn_info['password']}"
    )
    conn = psycopg2.connect(psql_connection_string)
    cur = conn.cursor()

    # "CREATE DATABASE" requires automatic commits
    conn.autocommit = True
    sql_query = f"CREATE DATABASE {conn_info['database']}"

    try:
        cur.execute(sql_query)
    except Exception as e:
        print(f"{type(e).__name__}: {e}")
        print(f"Query: {cur.query}")
        # cur.close()
    else:
        # Revert autocommit settings
        conn.autocommit = False


def execute(sql_query, conn, cur):
    """Executes query.
    Source: https://medium.com/swlh/create-your-first-postgresql-database-in-python-with-psycopg2-9d0986e0e9ac

    Parameters
    ----------
    sql_query: str
        Path to the query to be executed.
    conn: psycopg2.extensions.connection
        Database connection.
    cur: psycopg2.extensions.cursor
        Database cursor.
    """
    try:
        # Execute the table creation query
        cur.execute(sql_query)
    except Exception as e:
        print(f"{type(e).__name__}: {e}")
        print(f"Query: {cur.query}")
        conn.rollback()
        # cur.close()
    else:
        # To take effect, changes need be committed to the database
        conn.commit()


def insert_data(query, conn, cur, df, page_size):
    """Executes query.
    Source: https://medium.com/swlh/create-your-first-postgresql-database-in-python-with-psycopg2-9d0986e0e9ac

    Parameters
    ----------
    sql_query: str
        Path to the query to be executed.
    conn: psycopg2.extensions.connection
        Database connection.
    cur: psycopg2.extensions.cursor
        Database cursor.
    df: pd.DataFrame,
        DataFrame of the values to be inserted.
    page_size: int
        Number of queries to be executed in one go.
    """
    data_tuples = [tuple(row.to_numpy()) for index, row in df.iterrows()]

    try:
        psql_extras.execute_values(cur, query, data_tuples, page_size=page_size)
        # print("Query:", cur.query)

    except Exception as error:
        print(f"{type(error).__name__}: {error}")
        print("Query:", cur.query)
        conn.rollback()
        # cur.close()

    else:
        conn.commit()


if __name__ == "__main__":
    
    # Set paths
    os.chdir(os.path.dirname(os.path.realpath(__file__)))
    path_ini = os.path.join(os.getcwd(), "creds.ini")


    # Loads database info
    conn_info = load_connection_info(path_ini)

    # Create the desired database
    create_db(conn_info)

    # Connect to the database created
    connection = psycopg2.connect(**conn_info)
    cursor = connection.cursor()

    # # TODO: Change filename
    # query_fn = '200606-01 upsert-trainer-minor1.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)

    # # TODO: Change filename
    # query_fn = '200606-02 upsert-tournament-minor1.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)

    # TODO: Change filename
    # query_fn = '200606-03 upsert-standing-minor1-d1.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)

    # TODO: Change filename
    # query_fn = '200612-01 upsert-trainer-minor1.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)

    # TODO: Change filename
    # query_fn = '200612-02 upsert-trainer-minor2.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)

    # # TODO: Change filename
    # query_fn = '200612-03 upsert-tournament-minor2.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)

    # TODO: Change filename
    # query_fn = '200613-01 upsert-standing-minor2.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)

    # TODO: Change filename
    # query_fn = '200614-01 upsert-trainer-fix.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)

    # TODO: Change filename
    # query_fn = '200618-01 delete-standing-minor2.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)

    # TODO: Change filename
    # query_fn = '200618-02 upsert-standing-minor2.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)


    # TODO: Change filename
    # query_fn = '200620-01 upsert-tournament-minor3.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)


    # TODO: Change filename
    # query_fn = '200620-02 upsert-trainer-minor3-new.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)


    # TODO: Change filename
    # query_fn = '200620-03 upsert-trainer-minor3-ret.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)


    # TODO: Change filename
    # query_fn = '200620-04 upsert-standing-minor3.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)


    # TODO: Change filename
    # query_fn = '200710-01 upsert-tournament-major1.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)


    # TODO: Change filename
    # query_fn = '200710-02 upsert-trainer-major1-new.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)


    # TODO: Change filename
    # query_fn = '200711-01 upsert-standing-major1.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)


    # TODO: Change filename
    # query_fn = '200718-01 upsert-trainer-minor4-new.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)


    # TODO: Change filename
    # query_fn = '200718-02 upsert-trainer-minor4-ret.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)


    # TODO: Change filename
    # query_fn = '200718-03 upsert-tournament-minor4.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)


    # TODO: Change filename
    # query_fn = '200718-04 upsert-standing-minor4.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)


    # TODO: Change filename
    # query_fn = '200724-01 upsert-trainer-minor5-new.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)


    # TODO: Change filename
    # query_fn = '200724-02 upsert-tournament-minor5.sql'
    # path_q = os.path.join(os.getcwd(), "query", query_fn)
    # with open(path_q, "r", encoding="utf8") as file:
    #     query = file.read()
    # execute(query, connection, cursor)


    # TODO: Change filename
    query_fn = '200725-01 upsert-standing-minor5.sql'
    path_q = os.path.join(os.getcwd(), "query", query_fn)
    with open(path_q, "r", encoding="utf8") as file:
        query = file.read()
    execute(query, connection, cursor)

    # Close all connections to the database
    connection.close()
    cursor.close()