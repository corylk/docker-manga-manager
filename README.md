# docker-manga-manager

[Manga Manager](https://github.com/MangaManagerORG/Manga-Manager) collects useful tools to make managing your manga library easy.

This docker image runs the latest version of Manga Manager with VNC for remote access.

# Usage

## Environment

There are no required environment variables, however the optional variables you may wish to set are:

| Variable | Description | Default |
| - | - | - |
| `GIT_REPO` | URL of repo | https://github.com/MangaManagerORG/Manga-Manager |
| `GIT_BRANCH` | Name of branch | `main` |

Also see the (mostly VNC-related) [options for the base image](https://github.com/linuxserver/docker-baseimage-kasmvnc?tab=readme-ov-file#options).

## Ports

| Port | Description |
| - | - |
| `8080` | HTTP port on which VNC is exposed |

## Volumes

| Volume | Description |
| - | - |
| `/config` | Home directory and path to app config |
| `/manga` |  |
| `/covers` |  |

## Examples

### docker-compose

```yml
services:
  managa-manager:
    image: ckleinsc/managa-manager
    container_name: managa-manager
    environment:
      - GIT_REPO=https://github.com/MangaManagerORG/Manga-Manager
      - GIT_BRANCH=main
    volumes:
      - /path/to/config:/config
      - /path/to/manga:/manga
      - /path/to/covers:/covers
    ports:
      - 8080:8080
    restart: unless-stopped
```
