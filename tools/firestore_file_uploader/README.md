# Purpose

CLI tool for uploading data in the [Cloud Firestore](https://firebase.google.com/docs/firestore/).

# Introduction

- This is a dart CLI tool used for the uploading the JSON files to firestore.
- Download the service account from your Firebase project settings, then save it under `tools\data\credentials`.
- The JSON files to upload are under `tools\data\firestore`
- The project uses Firebase API to communicate with the Firestore.

# Usage

## Build service_account.json for the firebase

### Command templates
`dart run bin/firestore_file_uploader.dart credential_builder --credentials <credentials> --path <file_path>`

### Examples
`dart bin/firestore_file_uploader.dart credential_builder --credentials "{\"type\": \"service_account\", \"project_id\": \"kanto-dexquiz\"}" --path ../data/firebase/service_account.json`

## Update data in firestore

### Command templates
`dart run bin/firestore_file_uploader.dart upload --flavor <flavor> --credentials <file_path> --data <file_path>`

### Examples
`dart run bin/firestore_file_uploader.dart upload --flavor kanto --credentials ../data/firebase/service_account.json --data ../data/firestore/pokedex.json`
`dart run bin/firestore_file_uploader.dart upload --flavor johto --credentials ../data/firebase/service_account.json --data ../data/firestore/pokedex.json`