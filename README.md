These developer tools are a series of scripts intended for developers of AudioKit, not developers who use AudioKit. It contains scripts that create the AudioKit documentation, web site materials, and templates for starting to create AudioKit nodes from scratch.

This repository should be installed parallel to the AudioKit (and optionally, the AudioKit web site) repositories.  The scripts should be run from the terminal from the main directory, preceded with "./bin/".

## Instructions for Creating a Soundpipe-powered AudioKit Node

* Run `lua data2yaml.lua` to make a yaml file
* Edit the yaml file to look like others
* Run `./bin/generate_node.rb path-to-folder/file.yaml`
* Add the folder to the Xcode project
* Change the XXXAudioUnit.h to a public header file
* Add <AudioKit/XXXAudioUnit.h> to the AudioKit.h file
* Add module.c to AudioKit's Soundpipe folder in Xcode
* Update the config.mk.ak with the new compiled module
* Generate a new soundpipe.h file with `make clean; make CONFIG=config.def.mk.ak` or some shell script
* Copy over the soundpipe.h file (if not part of a shell script)
* Commit the new files


## Be aware of how to code for an open-source framework

* [Tips for Writing a Great iOS Framework](https://medium.com/@samjarman/tips-for-writing-a-great-ios-framework-8cf3452f6c5d#.wzejktd3l)
* [Best practices running an iOS open source project on GitHub](https://www.cocoanetics.com/2014/10/best-practices-running-an-ios-open-source-project-on-github/)