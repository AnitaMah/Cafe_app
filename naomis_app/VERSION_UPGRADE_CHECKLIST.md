# Naomi's Coffee Club App — Implementation Checklist

Every box below is one small, single action. Where there's a command, it's shown on its own line so you can copy-paste it directly — type it (or paste it) into the terminal and press Enter. Work through everything in order at `C:\Users\amakh\Cafe\naomis_app`. Your `.gitignore` already excludes `.dart_tool/`, `/build/`, and similar generated folders, so `git init` here is safe.

If something goes wrong partway through, the fastest recovery is `git reset --hard` back to the snapshot commit from Phase 0 (step 7) — that's what it's there for.

## Phase 0 — Safety net ✅ done

- [x] 1. Open a terminal (Command Prompt or PowerShell).
- [x] 2. Go to the project folder.
```
cd C:\Users\amakh\Cafe\naomis_app
```
- [x] 3. Initialize git.
```
git init
```
- [x] 4. Stage everything.
```
git add -A
```
- [x] 5. Commit the snapshot.
```
git commit -m "Pre-upgrade snapshot"
```
- [x] 6. Confirm the commit.
```
git log --oneline -1
```
- [x] 7. Commit hash to remember: `ba5fd43` — this is your rollback point.

## Phase 0b — Improve the commit message (in progress)

There's a leftover lock file from an interrupted attempt earlier that needs clearing first, then the amend can go through.

- [ ] 7a. Clear any stale git lock files.
```
del .git\HEAD.lock .git\index.lock
```
- [ ] 7b. Rewrite the commit message with full detail.
```
git commit --amend -m "Pre-upgrade snapshot: Flutter ~3.44.x, Gradle 9.1.0, AGP 9.0.1, Kotlin 2.3.20" -m "Baseline before the version upgrade (see VERSION_UPGRADE_PLAN.md and VERSION_UPGRADE_CHECKLIST.md). Flutter SDK ~3.44.x, Gradle wrapper 9.1.0, AGP 9.0.1, Kotlin 2.3.20, app version 0.1.0 with no explicit build number, Android minSdk 24 / targetSdk 36, iOS deployment target 13.0. Roll back to this commit with git reset --hard <hash> if the upgrade needs to be undone."
```
- [ ] 7c. Confirm the new message.
```
git log -1
```

## Phase 1 — Explicit build number

- [ ] 8. Open `pubspec.yaml` in a text editor.
- [ ] 9. Find the line:
```
version: 0.1.0
```
- [ ] 10. Change it to:
```
version: 0.1.0+1
```
- [ ] 11. Save the file.

## Phase 2 — Upgrade the Flutter SDK

- [ ] 12. Check the active channel.
```
flutter channel
```
- [ ] 13. Look for the line with a `*` next to it — confirm it says `stable`.
- [ ] 14. If it does **not** say stable:
```
flutter channel stable
```
- [ ] 15. Upgrade.
```
flutter upgrade
```
- [ ] 16. Wait for it to finish — this can take several minutes; don't close the terminal.
- [ ] 17. Check the new version.
```
flutter --version
```
- [ ] 18. Confirm the first line shows `Flutter 3.47.2` or newer.
- [ ] 19. Run the doctor check.
```
flutter doctor -v
```
- [ ] 20. Read through the output and confirm every line that had a green checkmark before still has one.
- [ ] 21. If a new red X appears about Android licenses:
```
flutter doctor --android-licenses
```
Type `y` at each prompt.

## Phase 3 — Refresh dependencies

- [ ] 22. Clean old build artifacts.
```
flutter clean
```
- [ ] 23. Refetch dependencies.
```
flutter pub get
```
Wait for "Got dependencies!".
- [ ] 24. Check what changed.
```
git diff pubspec.lock
```
- [ ] 25. Confirm the `flutter:` line under `sdks:` near the bottom changed (e.g. to `>=3.47.0`).
- [ ] 26. If a pager opened, press `q` to exit it.

## Phase 4 — Bump the Gradle wrapper

- [ ] 27. Go into the android folder.
```
cd android
```
- [ ] 28. Upgrade the wrapper.
```
gradlew.bat wrapper --gradle-version 9.7.1
```
- [ ] 29. Wait for it to finish (it may download Gradle 9.7.1 — can take a minute).
- [ ] 30. Open `android\gradle\wrapper\gradle-wrapper.properties` in a text editor.
- [ ] 31. Confirm the `distributionUrl` line now ends in `gradle-9.7.1-all.zip`.
- [ ] 32. Close the editor without changing anything else.
- [ ] 33. Go back to the project root.
```
cd ..
```

## Phase 5 — Bump AGP

- [ ] 34. Open `android/settings.gradle.kts` in a text editor.
- [ ] 35. Find this line:
```
id("com.android.application") version "9.0.1" apply false
```
- [ ] 36. Change `"9.0.1"` to `"9.4.0"`.
- [ ] 37. Save the file (keep it open for the next phase).

## Phase 6 — Bump Kotlin

- [ ] 38. In the same file, find:
```
id("org.jetbrains.kotlin.android") version "2.3.20" apply false
```
- [ ] 39. Change `"2.3.20"` to `"2.4.20"`.
- [ ] 40. Save the file.
- [ ] 41. Close the editor.

## Phase 7 — Rebuild and verify Android

- [ ] 42. Clean.
```
flutter clean
```
- [ ] 43. Build.
```
flutter build apk --debug
```
- [ ] 44. Wait — this can take a few minutes the first time with new tool versions.
- [ ] 45. Read the last few lines of output.
- [ ] 46. If you see `Built build\app\outputs\flutter-apk\app-debug.apk` — success, skip to step 51.
- [ ] 47. If you see an error instead, scroll up and read the **first** error message shown, not the last.
- [ ] 48. If it mentions a Gradle cache/daemon problem:
```
cd android
gradlew.bat --stop
cd ..
```
Then repeat step 43.
- [ ] 49. If it's a different error, stop here and share the exact error text before continuing.
- [ ] 50. Once the build succeeds, continue to step 51.
- [ ] 51. (Optional) With a device or emulator connected, install it.
```
flutter install
```
- [ ] 52. (Optional) Open the app and tap through all 5 tabs (Home, Menu, Events, Location, Info) to confirm navigation still works.

## Phase 8 — Verify iOS (only if you build iOS on this machine — otherwise skip to Phase 9)

- [ ] 53. Open Xcode, go to Xcode > About Xcode, and note the version number.
- [ ] 54. Compare it against Apple's current minimum required Xcode version for App Store submissions (check developer.apple.com if unsure).
- [ ] 55. Build.
```
flutter build ios --debug --no-codesign
```
- [ ] 56. Wait for it to finish.
- [ ] 57. Confirm there's no error about resolving Swift packages.

## Phase 9 — Commit

- [ ] 58. Stage everything.
```
git add -A
```
- [ ] 59. Review what changed.
```
git status
```
- [ ] 60. Read the list of changed files.
- [ ] 61. Confirm it only includes `pubspec.yaml`, `pubspec.lock`, `android/settings.gradle.kts`, and `android/gradle/wrapper/gradle-wrapper.properties`.
- [ ] 62. If files under `build/` or `.dart_tool/` are listed too — stop, don't commit, and check why `.gitignore` isn't being respected.
- [ ] 63. Commit.
```
git commit -m "Upgrade Flutter 3.47.2, Gradle 9.7.1, AGP 9.4.0, Kotlin 2.4.20; set explicit build number 0.1.0+1"
```
- [ ] 64. (Optional) Tag it.
```
git tag v0.1.0+1
```

## Phase 10 — Final validation

- [ ] 65. Analyze.
```
flutter analyze
```
- [ ] 66. Confirm no new issues appear compared to before the upgrade.
- [ ] 67. Test.
```
flutter test
```
- [ ] 68. Confirm it ends with "All tests passed!".
- [ ] 69. Run the app once more and click through all 5 tabs one last time.
- [ ] 70. If anything is broken and not quickly fixable, undo everything:
```
git reset --hard ba5fd43
```

## Troubleshooting quick reference

| Symptom | Likely cause | What to try |
|---|---|---|
| `flutter build apk` fails immediately after the Gradle/AGP/Kotlin edits | Old Gradle daemon still running with cached config | Steps in Phase 7, item 48 |
| Build error mentioning AGP requiring a newer Gradle | Phase 4 didn't take | Re-check `gradle-wrapper.properties` shows `9.7.1`, not `9.1.0` |
| `flutter doctor` shows a new Android licenses warning | SDK components updated during `flutter upgrade` | Phase 2, step 21 |
| iOS build fails resolving Swift packages | Stale `ios/Flutter/ephemeral/Packages` cache from the old SDK | `flutter clean` again, then retry step 55 |
| `git` fails with "Unable to create .git/HEAD.lock" or "index.lock: File exists" | Leftover lock file from an interrupted git command | `del .git\HEAD.lock .git\index.lock` then retry |
