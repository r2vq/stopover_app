# stopover_app

[![Codemagic build status](https://api.codemagic.io/apps/5c8abfa117fd830de2e701fc/5c8abfa117fd830de2e701fb/status_badge.svg)](https://codemagic.io/apps/5c8abfa117fd830de2e701fc/5c8abfa117fd830de2e701fb/latest_build)

This project is a simple project for the TribalScale Hackathon.

## Getting Started

1. Run the app from your Android or iOS phone.
2. The app will display your flight details in the flight tab.
3. Check out the sales in your current airport using the shops tab.
4. Save your favourite deals to see them later.

# Contributing

1. Obtain a Google Maps API Key from the Developer Console.
2. Create a `secrets.xml` file that shares your API Key with the name `map_key`.
3. Create a `Secrets.swift` file that has a struct named `Secrets` that shares your API Key as a static String with the name `mapKey`.
4. Run `flutter packages get`