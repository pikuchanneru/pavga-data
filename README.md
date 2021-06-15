# PAVGA 2021 Data

**PAVGA 2021 Data** is a data management and reporting project done for Pokémon Asia VG Association (PAVGA) regarding their **Pokémon Sword and Shield** (Nintendo Switch) tournament circuit in 2021, **PAVGA Asia Star Tournament 2021**.

## Background

To improve the tournament circuit's production value, player and Pokémon statistics are presented. This will allow people to understand the tournament circuit state and trend better by seeing data such as historical data and usage statistics.

## Authors

- [@pikuchanneru](https://www.github.com/pikuchanneru)

## Technology Services

- **Python** as scripting language.
- **PostgreSQL** as database.

## Limitation

- Due to the unavailability of a hosting service, data are stored in localhost.
- Due to the unavailability of a front-end, data queries are done in administration and development platforms and later be stored in Google Sheets.

## Table

### `trainer`

`trainer` table stores data related to each player's personal data. Player is commonly referred as *trainer* in Pokémon terms. Each entry is assigned a unique `id`.

### `tournament`

`tournament` table stores data related to each tournament's data. Each entry is assigned a unique `id`.

### `standings`

`standings` table stores data related to each player's performance during a tournament, such as sets won/draw/lost, final ranking, points awarded, and Pokémon team brought. Each entry is assigned a unique `id`. This table has foreign keys that refer to `trainer` and `tournament` tables' `id`.

## Tracked Data

### Pokémon

Pokémon data can be seen on the Google Sheets.

| Parameter | Definition |
| :--: | :-- |
`count` | The count of the Pokémon.
`usage_share` | The ratio of the Pokémon count compared to the maximum possible count for a Pokémon, in percentage.
`win` | The count of sets won by the Pokémon. Not including byes.
`draw` | The count of sets drawn by the Pokémon.
`loss` | The count of sets lost by the Pokémon. Not including double losses.
`winrate` | The ratio of sets win compared to the count of sets played of the Pokémon, in percentage.
`pt` | The total points accumulated by the Pokémon.
`pt_share` | The ratio of the total points accumulated by the Pokémon compared to the maximum possible points for a Pokémon, in percentage.

### Player

Player data can be seen on the Google Sheets.

| Parameter | Definition |
| :--: | :-- |
`participation` | The count of tournaments participated in of the player.
`win` | The count of sets won by the player.
`draw` | The count of sets drawn by the player.
`loss` | The count of sets lost by the player.
`winrate` | The ratio of sets win compared to the count of sets played of the player, in percentage.
`minor_pt` | The total points accumulated by the player from `Minor` tier tournaments, following the BFL Rules.

## Working Flow

### First-time Setup

1. Create `creds.ini` file.
2. Run `initiate-db.py`. This will create the database `pavga` in the localhost and the included tables and triggers.

### Post-tournament Report

1. Create needed queries and save in the `query-info` folder. The naming convention is ``YYMMDD-NN query-name.sql``, with `YY` being year (e.g. `21` for 2021), `MM` being month (e.g. `06` for June), `DD` being date (e.g. `12` for 12th), and `NN` for being the n-th query of the day (e.g. `02` for the second query of the day).
2. Open `executor.py` and append the query block on the end of the respective code block.
3. Comment all previously run queries block.

```
# TODO: Change filename
# query_fn = '200613-01 upsert-standing-minor2.sql'
# path_q = os.path.join(os.getcwd(), "query", query_fn)
# with open(path_q, "r", encoding="utf8") as file:
#     query = file.read()
# execute(query, connection, cursor)

# TODO: Change filename
query_fn = '200614-01 upsert-trainer-fix.sql'
path_q = os.path.join(os.getcwd(), "query", query_fn)
with open(path_q, "r", encoding="utf8") as file:
    query = file.read()
execute(query, connection, cursor)
```

4. Run `executor.py`.
5. Run any needed queries. Samples are available in `query-info` folder.
  - `pokemon.sql` for Pokémon statistics from a given tournament.
  - `pokemon-global.sql` for Pokémon statistics from the entire tournament circuit.
  - `trainer-global.sql` for player statistics from the entire tournament circuit.
6. Save the query results as .csv/.xlsx file.
7. Open the query result files and copy-paste to the respective Google Sheets.

