# appimagevalidate
This docker container validates an appimage signature via the validate tool of [appimagekit](https://github.com/AppImage/AppImageKit)

Info: currently the validate tool is built based on the fork of https://github.com/yobson/AppImageKit because of https://github.com/AppImage/AppImageKit/pull/1090 

## Installation Prerequisites

### Prerequisites

- Docker v17
- Put the Appimage file and the public key inside of the same directory and go to the directory

## Usage

you can run the validation inside the folder where you placed your files with (replace YOURAPPIMAGE.AppImage and YOURKEY.asc with your filenames, for detailed environment variables see below):
```
docker run --rm -it -v $PWD:/work \
 -e APPIMAGEFILE=YOURAPPIMAGE.AppImage \
 -e PUBKEYASC=YOURKEY.asc \
 --name appimagevalidate \
 registry.gitlab.com/apfelwurm/appimagevalidate:latest

```

### Environment Vars
The following Variables are available:
- APPIMAGEFILE
    - the filename of your appimage in your current directory
- PUBKEYASC
    - the filename of your public key in your current directory 
  
