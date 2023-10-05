# Pokedex Builder

A CLI took to fetch the pokedex entries and save them in FireStore compatible JSON structure.

## Motivation

The pokemon data is fetched [PokeApi](https://pokeapi.co/docs/v2#pokemon). This tools calls the api
for each pokemon and prepares a json structure and saves it in a json file stored at given path.

## Usage

Run it with ``` dart run bin/pokedex_builder.dart build --flavor << flavor >> --path << path >>```

For example:
``` dart run bin/pokedex_builder.dart build --flavor kanto --path ../data/firestore/kanto_pokedex.json```

## Further Read

[CLI in Flutter](https://dart.dev/tutorials/server/get-started#3-create-a-small-app)


