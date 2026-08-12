## miniDLNA for Home Assistant (HA)
## Description

This addon provides a container for Home Assistant with miniDLNA. Based on work from [Drize](https://github.com/drize) & [Cavaliere78](https://github.com/cavaliere78). Current minidlna-version can be checked in the [alpine package details](https://pkgs.alpinelinux.org/package/edge/community/x86/minidlna).

## Installation

Copy the url of [this repository](https://github.com/Moozzuzz/HA-addons) into "Supervisor" -> "Addon Store" -> "Add New repository URL". Then search for minidlna, select the addon and install it. 

## Example configuration 
```yaml
media_dir: V,/media;/share
options: -v
```

### Option `media_dir`

Set this to the directory you want scanned.
- if you want multiple directories, you can add ';' before each new directory
  (eg. media_dir: /media;/share)
- if you want to restrict a media_dir to specific content types, you
  can prepend the types, followed by a comma, to the directory:
  - **A** for audio  (eg. `media_dir: A,/home/userA/Music`)
  - **V** for video  (eg. `media_dir: V,/home/userB/Videos`)
  - **P** for images (eg. `media_dir: P,/home/userA/Pictures`)
  - **PV** for pictures and video (eg. `media_dir: PV,/home/media/doorbell_camera`)

  
### Option `options`
```bash
[-d] [-v] [-f config_file] [-p port] [-i network_interface] [-u uid_to_run_as]
[-t notify_interval] [-P pid_filename] [-s serial] [-m model_number] [-w url] 
[-r] [-R] [-L] [-S] [-V] [-h]
```
**Notes:**
- `-d` Activate debug mode (do not daemonize).
- `-f config_file` Specify the location of the configuration file. Uses /etc/minidlna.conf by default.
- `-h` Displays helptext and exit.
- `-L` Do not create playlists.
- `-m model_number` Define model number the daemon will report to clients in its XML description.
- `-P pid_filename` Define custom PID file to use; the default is /run/minidlna/minidlna.pid.
- `-R` Forces a full rescan (rebuild) of the media files. First it will remove all cached data and database. Any bookmarks will be lost.
- `-r` Do a non-destructive rescan of the media files on start-up.
- `-S` Stay foreground. Can be used when minidlnad is being managed by systemd
- `-s serial` Serial number the daemon will report to clients in its XML description.
- `-t notify_interval` Notify interval, in seconds; defaults to 895 seconds.
- `-V` Show the program version and exit.
- `-v` Verbose output.
- `-w presentation_url` Sets the presentation url; the default is http address on port 80.

For more detailed info on options: [Debian man page](https://manpages.debian.org/testing/minidlna/minidlnad.1.en.html) or [uex.se man page](https://man.uex.se/8/minidlnad).

### Defined via configuration
- `-p port` Defines port number to listen on.

### Defined by HA
- `-i interface` Network interface to listen on. Can be specified more than once.
