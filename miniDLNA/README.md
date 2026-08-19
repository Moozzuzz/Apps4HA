# miniDLNA for Home Assistant (HA)
## Description

miniDLNA is a simple media (audio, pictures & video) server, which aims to be fully compliant with DLNA/UPnP-AV clients.

This local app (HA-addon) provides a container for Home Assistant with miniDLNA. Based on work from [Drize](https://github.com/drize) & [Cavaliere78](https://github.com/cavaliere78), the former addon was updated to the latest HA approach for local apps, including apparmor etc. Current minidlna-version can be checked in the [alpine package details](https://pkgs.alpinelinux.org/package/edge/community/x86/minidlna).

## Installation

Add this repository to your [App-store](https://my.home-assistant.io/redirect/supervisor_store/). You can do so, by browsing to the App-store: [Config](https://my.home-assistant.io/redirect/config) ⇢ Apps ⇢ [App-store](https://my.home-assistant.io/redirect/supervisor_store/) ⇢ ⋮  ⇢ **Repositories**. Copy the url of [this repository](https://github.com/Moozzuzz/Apps4HA)) `https://github.com/Moozzuzz/HA-addons` into the list.

Once this repository has been succesfully added, search for *minidlna*, select the app and install it. 

### Notes:
HA generates a webui-button automatically, but this -very minimal- interface doesn't work (yet). You'll discover your server with [DLNA Digital Media Server](https://www.home-assistant.io/integrations/dlna_dms/) en in the [Media browser](https://my.home-assistant.io/redirect/media_browser).

Please note [miniDLNA](https://sourceforge.net/projects/minidlna/files/minidlna) has a number of open bugs. 

## Example configuration 
```yaml
media_dir: V,/media;/share
options: -r
```

### Option `media_dir`

Set this to the directory you want scanned.
- When you want to set multiple directories, seperate the directories with semicolons `;`  (eg. `media_dir: /media;/share`)
- if you would like to restrict a media_dir to specific content type(s), you
  can prepend the types, followed by a comma, to the directory:
  - **A** for audio  (eg. `media_dir: A,/home/user_A/Music`)
  - **V** for video  (eg. `media_dir: V,/home/user_B/Videos`)
  - **P** for images (eg. `media_dir: P,/home/user_C/Pictures`)
  - **PV** for pictures and video (eg. `media_dir: PV,/home/media/doorbell_camera`)

### Option `options`
```bash
[-d] [-v] [-f config_file] [-p port] [-i network_interface] [-u uid_to_run_as]
[-t notify_interval] [-P pid_filename] [-s serial] [-m model_number] [-w presentation_url] 
[-r] [-R] [-L] [-S] [-V] [-h]
```
#### Configuration options
- `-f config_file` Specify the location of the configuration file. Uses */etc/minidlna.conf* by default.
- `-L` Do not create playlists.
- `-m model_number` Define model number the daemon will report to clients in its XML description.
- `-P pid_filename` Define custom PID file to use; the default is */run/minidlna/minidlna.pid*.
- `-R` Forces a full rescan (rebuild) of the media files. First it will remove all cached data and database. Any bookmarks will be lost.
- `-r` Do a non-destructive rescan of the media files on start-up.
- `-S` Stay foreground. Can be used when minidlnad is being managed by systemd
- `-s serial` Serial number the daemon will report to clients in its XML description.
- `-t notify_interval` Notify interval, in seconds; defaults to 895 seconds.
- `-u uid_to_run_as` Run as different user (with `uid`)
- `-w presentation_url` Sets the presentation url; the default is http address on port 80.

#### Debugging options
- `-d` Activate debug mode (do not daemonize).
- `-h` Displays helptext and exit.
- `-V` Show the program version and exit.
- `-v` Verbose output.

#### Option defined via configuration (of this app)
- `-p port` Defines port number to listen on.

#### Defined by HA
- `-i network_interface` Network interface to listen on. Can be specified more than once.

For more detailed info on options: [Debian man page](https://manpages.debian.org/testing/minidlna/minidlnad.1.en.html) or [uex.se man page](https://man.uex.se/8/minidlnad).

### Option `Friendly_name`
Define how the dlna-server presents itself on the network.

## Credits for miniDLNA (Readymedia)
- https://sourceforge.net/projects/minidlna/files/minidlna

## Contribute to this app (addon)
Submit your translation as Feature-request or pull-request.
