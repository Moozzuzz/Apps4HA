# miniDLNA for Home Assistant (HA)

## Description

miniDLNA is a lightweight media (audio, pictures & video) server, which aims to be fully compliant with DLNA/UPnP-AV clients.

This local app (HA-addon) provides a container for Home Assistant with miniDLNA. Based on work from [Drize](https://github.com/drize) & [Cavaliere78](https://github.com/cavaliere78), the former addon was updated to the latest HA approach for local apps, including apparmor etc. Current minidlna-version can be checked in the [alpine package details](https://pkgs.alpinelinux.org/package/edge/community/x86/minidlna).


## Installation

Add this repository to your [App-store](https://my.home-assistant.io/redirect/supervisor_store/). 
[![Add App-repository](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FMoozzuzz%2FApps4HA)

Once this repository has been succesfully added, search for *minidlna*, select the app and install it. 

See the [documentation](./DOCS.md) for optional configuration of the addon.

### Manual repository addition
If you prefer to add the App-repository by hand, browse to the App-store: [Config](https://my.home-assistant.io/redirect/config) ⇢ Apps ⇢ [App-store](https://my.home-assistant.io/redirect/supervisor_store/) ⇢ the three-dot menu (⋮)  ⇢ **Repositories**. Copy and save the url of [this repository](https://github.com/Moozzuzz/Apps4HA)) `https://github.com/Moozzuzz/HA-addons` into the list.



## Bugs
HA generates a webui-button automatically, but this -very minimal- interface doesn't work (yet). You'll discover your server with [DLNA Digital Media Server](https://www.home-assistant.io/integrations/dlna_dms/) or in the [Media browser](https://my.home-assistant.io/redirect/media_browser).

Please note [bugs](https://sourceforge.net/p/minidlna/bugs/) related to the [miniDLNA project](https://sourceforge.net/projects/minidlna/files/minidlna) (ReadyMedia) can be reported at its [projectpage](https://sourceforge.net/p/minidlna/bugs/) on sourceforge. 


## Credits for miniDLNA (ReadyMedia)
- https://sourceforge.net/projects/minidlna/files/minidlna



## Contribute to this app (addon)
Thank you for submitting your translation as a Feature-request or a pull-request.
