# Naomi's Coffee Club — App

Flutter companion app skeleton. Matches the website's design tokens
(`css/tokens.css` in `naomis-coffee-club/`) via `lib/theme/app_theme.dart`.

## Run it locally

You need the Flutter SDK installed (`flutter doctor` should pass) —
this can't be run or tested from where the code was generated.

```
flutter pub get
flutter run
```

## Status

- [x] Theme (`lib/theme/app_theme.dart`) — colors/fonts from the site
- [x] Navigation skeleton (`lib/main.dart`) — bottom nav across 5 tabs
- [x] Empty screen stubs with placeholder text (Home, Menu, Events,
      Location, Info)
- [ ] Real screen content (menu data, events list, map/hours, about
      text) — next step
