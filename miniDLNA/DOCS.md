# miniDLNA for Home Assistant (HA)
## Description

This addon provide a container for Home Assistant with miniDLNA. Based on work from [Drize](https://github.com/drize) & [Cavaliere78](https://github.com/cavaliere78). Current minidlna-version can be checked in the [alpine package details](https://pkgs.alpinelinux.org/package/edge/community/x86/minidlna).

## Installation

Follow these steps to get the app (formerly known as add-on) installed on your system:

 **Settings** > **Apps** > **Install app**. "Add New repository URL". Then search for minidlna, select the addon and install it. 

1. In Home Assistant, go to **Settings** > **Apps** > **Install app**.
2. Open the Add new repository panel (**3 dots in upright corner** > **Add New repository URL**).
3. Paste the url of [this repository](https://github.com/Moozzuzz/HA-addons) and click add.
4. Once the App store is updated, you can hit that "INSTALL" button.

## How to use

The app has a couple of options available. To get the app running:

1. Start the app.
2. Have some patience and wait a couple of minutes.
3. Check the app log output to see the result.

## Configuration

You can configure the app in the GUI (tab **Configuration** obviously).

### Default configuration 
```yaml
media_dir: V,/media;/share
options: -d
```

### Option `media_dir`

Set this to the directory you want scanned.
- if you want multiple directories, you can add ';' before each new directory
  (eg. media_dir: /media;/share)
- if you want to restrict a media_dir to specific content types, you
  can prepend the types, followed by a comma, to the directory:
  - **A** for audio  (eg. `media_dir: A,/home/jmaggard/Music`)
  - **V** for video  (eg. `media_dir: V,/home/jmaggard/Videos`)
  - **P** for images (eg. `media_dir: P,/home/jmaggard/Pictures`)
  - **PV** for pictures and video (eg. `media_dir: PV,/home/media/doorbell_camera`)

  
### Option `options`
```bash
[-d] [-v] [-f config_file] [-p port] [-i network_interface] [-u uid_to_run_as]
[-t notify_interval] [-P pid_filename] [-s serial] [-m model_number] [-w url] 
[-r] [-R] [-L] [-S] [-V] [-h]
```
**Notes:**
- Notify interval is in seconds. Default is 895 seconds. One can change it with `-t`
- Default pid file is /var/run/minidlna/minidlna.pid. You can change it with option `-P`
- With `-d` minidlna will run in debug mode (not daemonize).
- `-w` sets the presentation url. Default is http address on port 80
- `-v` enables verbose output
- `-r` forces a rescan
- `-R` forces a rebuild
- `-L` do not create playlists
- `-S` changes behaviour for systemd
- `-V` print the version number
- `-h` displays help text

For more detailed info on options: [Debian man page](https://manpages.debian.org/testing/minidlna/minidlnad.1.en.html) or [uex.se man page](https://man.uex.se/8/minidlnad).

## Bugcrushing

In case you've found a bug, please [open an issue on GitHub](https://github.com/Moozzuzz/HA-addons/issues/new).
