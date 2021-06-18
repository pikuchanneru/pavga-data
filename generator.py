from pathlib import Path
import pandas as pd
from configparser import ConfigParser
import psycopg2
from datetime import date
from chameleon import PageTemplateLoader
from contextlib import redirect_stdout


class Pokemon:
    def __init__(self, name, count, usage, winrate, pt, rank):
        self.name = name
        self.count = count
        self.usage = usage
        self.winrate = winrate
        self.pt = pt
        self.rank = rank

    def get_name(self):
        return self.name

    def get_count(self):
        return self.count

    def get_usage(self):
        return self.usage

    def get_winrate(self):
        return self.winrate

    def get_pt(self):
        return self.pt

    def get_rank(self):
        return self.rank

    def printme(self):
        return str(self.rank) + " | " + self.name + " | " + str(self.count) + " | " + self.usage + " | " + self.winrate + " | " + str(self.pt)


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
    # Set tournament id
    tour_id = 1  # TODO

    # Create global params
    today = date.today().strftime("%Y%m%d")
    credentials = Path(__file__).resolve().parent / 'creds.ini'
    query_folder = Path(__file__).resolve().parent / 'query-info'
    poke_query = query_folder / 'pokemon.sql'
    pokegl_query = query_folder / 'pokemon-global.sql'
    trainer_query = query_folder / 'trainer-global.sql'
    out_folder = Path(__file__).resolve().parent / 'output'
    poke_respath = out_folder / (today + '_poke' + str(tour_id) + '.xlsx')
    pokegl_respath = out_folder / (today + '_pokegl.xlsx')
    trainer_respath = out_folder / (today + '_trainer.xlsx')
    templates_path = Path(__file__).resolve().parent / 'template'
    template_loader = PageTemplateLoader(
        str(templates_path),
        ".pt",
    )
    out_path = Path(__file__).resolve().parent / 'template' / (today + '_' + str(tour_id) + '.html')
    template = template_loader["pavgatest"]

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

    # Get top 10 from tournament
    print(data_poke.loc[9]['count'])
    data_poke = data_poke.loc[data_poke["count"] >= data_poke.loc[9]['count']]

    # Reformat percentage columns
    data_poke.loc[:, ["winrate"]] = data_poke.loc[:, [
        "winrate"]].apply(lambda x: round(x * 100, 2))
    data_poke.loc[:, "winrate"] = data_poke.loc[:,
                                                "winrate"].map('{:.2f}'.format)
    data_poke.loc[:, ["winrate"]] = data_poke.loc[:, ["winrate"]].astype(str)
    data_poke.loc[:, ["winrate"]] = data_poke.loc[:,
                                                  ["winrate"]].apply(lambda x: x + '%')

    data_poke.loc[:, ["pt_share"]] = data_poke.loc[:, [
        "pt_share"]].apply(lambda x: round(x * 100, 2))
    data_poke.loc[:, "pt_share"] = data_poke.loc[:,
                                                 "pt_share"].map('{:.2f}'.format)
    data_poke.loc[:, ["pt_share"]] = data_poke.loc[:, ["pt_share"]].astype(str)
    data_poke.loc[:, ["pt_share"]] = data_poke.loc[:,
                                                   ["pt_share"]].apply(lambda x: x + '%')

    data_poke.loc[:, ["usage_share"]] = data_poke.loc[:, [
        "usage_share"]].apply(lambda x: round(x * 100, 2))
    data_poke.loc[:, "usage_share"] = data_poke.loc[:,
                                                    "usage_share"].map('{:.2f}'.format)
    data_poke.loc[:, ["usage_share"]] = data_poke.loc[:,
                                                      ["usage_share"]].astype(str)
    data_poke.loc[:, ["usage_share"]] = data_poke.loc[:,
                                                      ["usage_share"]].apply(lambda x: x + '%')

    # Reformat int columns
    data_poke.loc[:, "win"] = data_poke.loc[:, "win"].map('{:.0f}'.format)
    data_poke.loc[:, "draw"] = data_poke.loc[:, "draw"].map('{:.0f}'.format)
    data_poke.loc[:, "loss"] = data_poke.loc[:, "loss"].map('{:.0f}'.format)
    data_poke.loc[:, "pt"] = data_poke.loc[:, "pt"].map('{:.0f}'.format)

    # Create list of Pokemons and calculate rank
    pokes = []
    prv_rk = 1
    cur_rk = 1
    prv_us = 0
    for index, row in data_poke.iterrows():
        if(cur_rk == 1):
            prv_us = row['count']
        if(row['count'] < prv_us):
            prv_rk = cur_rk
            prv_us = row['count']
        cur_rk += 1
        pokes.append(Pokemon(row['pokemon'], row['count'], row['usage_share'],
                     row['winrate'], row['pt_share'], ('#'+str(prv_rk))))

    for idx in range(0, len(pokes)):
        print(pokes[idx].printme())
        
    with open(str(out_path), "w") as f:
        with redirect_stdout(f):
            print(
                template(pokes=pokes)
            )
