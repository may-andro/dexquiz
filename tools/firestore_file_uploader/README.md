# Purpose

CLI tool for uploading data in the [Cloud Firestore](https://firebase.google.com/docs/firestore/).

# Introduction

- This is a dart CLI tool used for the uploading the JSON files to firestore.
- Download the service account from your Firebase project settings, then save it under `tools\data\credentials`.
- The JSON files to upload are under `tools\data\firestore`
- The project uses Firebase API to communicate with the Firestore.

# Usage

## Update data in firestore

### Command templates
`dart run bin/firestore_file_uploader.dart upload --flavor <flavor> --credentials <file_path> --data <file_path>`

### Examples
`dart run bin/firestore_file_uploader.dart upload --flavor kanto --credentials ../data/credentials/kanto_dexquiz.json --data ../data/firestore/kanto_pokedex.json`
`dart run bin/firestore_file_uploader.dart upload --flavor johto --credentials ../data/credentials/johto_dexquiz.json --data ../data/firestore/johto_pokedex.json`

