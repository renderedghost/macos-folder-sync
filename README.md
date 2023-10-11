# macOS Folder Sync Automation

> Automatically sync folders on MacOS

## Overview

This repository contains an AppleScript for automating folder synchronization between between folders on macOS.

The script ensures that the folders are kept in sync every time the external drive is connected.

## Features

- Copies new files from the source folder to the destination folder
- Skips files that already exist in the destination folder
- Deletes files in the destination folder that no longer exist in the source folder

## Requirements

- macOS
- AppleScript
- launchd (for automation)

## Setup

### Define the Paths

Edit the `SyncMyFiles.applescript` file to specify the paths of your source and destination folders.

```applescript
-- Define source folder on the internal drive
set sourceFolder to "/source"
-- Define destination folder on the external drive
set destinationFolder to "/destination"
```

### Compile the Script

Compile the modified AppleScript as an `SyncMyFiles.scpt` file on your Mac.

### Sync the `.plist` file for `launchd`

Copy the `SyncMyFiles.plist` file to `~/Library/LaunchAgents/` to automate the script execution when the external drive is connected.

```bash
cp ~/code/macos-hd-sync/SyncMyFiles.plist ~/Library/LaunchAgents/
```

Run the following command in Terminal to load the `SyncMyFiles.plist` file:

```bash
launchctl load ~/Library/LaunchAgents/SyncMyFiles.plist
```

## Usage

### Automated

1. Connect your external drive.
2. The script should run automatically, syncing the specified folders.
3. That's it.

### Manual

```bash
osascript ~/code/macos-hd-sync/SyncMyFiles.scpt
```

## License

MIT

