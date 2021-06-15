from pathlib import Path
import pandas as pd
from configparser import ConfigParser
import psycopg2
from datetime import date


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


if __name__ == "__main__":

    # Create global params
    today = date.today().strftime("%Y%m%d")
    credentials = Path(__file__).resolve().parent / 'creds.ini'
    query_folder = Path(__file__).resolve().parent / 'query-info'
    poke_query = query_folder / 'pokemon.sql'
    pokegl_query = query_folder / 'pokemon-global.sql'
    trainer_query = query_folder / 'trainer-global.sql'
    tour_id = 1
    out_folder = Path(__file__).resolve().parent / 'output'
    poke_respath = out_folder / (today + '_poke' + str(tour_id) + '.xlsx')
    pokegl_respath = out_folder / (today + '_pokegl.xlsx')
    trainer_respath = out_folder / (today + '_trainer.xlsx')
    print(poke_respath)

    # Loads database info
    conn_info = load_connection_info(credentials)

    # Connect to the database created
    connection = psycopg2.connect(**conn_info)
    cursor = connection.cursor()

    # Get Pokemon data from tournament
    with open(poke_query, "r") as file:
        query = file.read().format(tour_id)
        data_poke = pd.read_sql_query(query, connection)
        print(data_poke)

    writer_poke = pd.ExcelWriter(  # pylint: disable=abstract-class-instantiated
        poke_respath, engine="xlsxwriter"  # pylint: disable=abstract-class-instantiated
    )  # pylint: disable=abstract-class-instantiated

    data_poke.to_excel(writer_poke, index=False)
    writer_poke.save()

    # Get global Pokemon data
    with open(pokegl_query, "r") as file:
        query = file.read()
        data_pokegl = pd.read_sql_query(query, connection)
        print(data_pokegl)

    writer_pokegl = pd.ExcelWriter(  # pylint: disable=abstract-class-instantiated
        pokegl_respath, engine="xlsxwriter"  # pylint: disable=abstract-class-instantiated
    )  # pylint: disable=abstract-class-instantiated

    data_pokegl.to_excel(writer_pokegl, index=False)
    writer_pokegl.save()

    # Get Pokemon data from tournament
    with open(trainer_query, "r") as file:
        query = file.read()
        data_trainer = pd.read_sql_query(query, connection)
        print(data_trainer)

    writer_trainer = pd.ExcelWriter(  # pylint: disable=abstract-class-instantiated
        trainer_respath, engine="xlsxwriter"  # pylint: disable=abstract-class-instantiated
    )  # pylint: disable=abstract-class-instantiated

    data_trainer.to_excel(writer_trainer, index=False)
    writer_trainer.save()

    # Close all connections to the database
    connection.close()
    cursor.close()
