# miniDLNA for Home Assistant (HA)
## Description

miniDLNA is a lightweight media (audio, pictures & video) server, which aims to be fully compliant with DLNA/UPnP-AV clients.

This local app (HA-addon) provides a container for Home Assistant with miniDLNA. Based on work from [Drize](https://github.com/drize) & [Cavaliere78](https://github.com/cavaliere78), the former addon was updated to the latest HA approach for local apps, including apparmor etc. Current minidlna-version can be checked in the [alpine package details](https://pkgs.alpinelinux.org/package/edge/community/x86/minidlna).

## Installation

Add this repository to your [App-store](https://my.home-assistant.io/redirect/supervisor_store/). You can do so, by browsing to the App-store: [Config](https://my.home-assistant.io/redirect/config) ⇢ Apps ⇢ [App-store](https://my.home-assistant.io/redirect/supervisor_store/) ⇢ ⋮  ⇢ **Repositories**. Copy the url of [this repository](https://github.com/Moozzuzz/Apps4HA)) `https://github.com/Moozzuzz/HA-addons` into the list.

Once this repository has been succesfully added, search for *minidlna*, select the app and install it. 

See the **documentation** for optional configuration of the addon.


## Bugs:
HA generates a webui-button automatically, but this -very minimal- interface doesn't work (yet). You'll discover your server with [DLNA Digital Media Server](https://www.home-assistant.io/integrations/dlna_dms/) en in the [Media browser](https://my.home-assistant.io/redirect/media_browser).

Please note [miniDLNA](https://sourceforge.net/projects/minidlna/files/minidlna) has a number of other open bugs too. 


## Credits for miniDLNA (Readymedia)
- https://sourceforge.net/projects/minidlna/files/minidlna



## Contribute to this app (addon)
Thank you for submitting your translation as a Feature-request or a pull-request.
