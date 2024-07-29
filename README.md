Forked in order to get working version via docker ubuntu:focal as newer versions appeared to have dependency issues.

# Run labelImg via premade image
`docker run -e DISPLAY=$DISPLAY -v .:/data -v /tmp/.X11-unix:/tmp/.X11-unix topher217/labelimg:latest`

Note: I mount the current working directory to /data in the container as I assume you will run this from within the directory representing your dataset. 
As labelImg can use two separate directories for images and xml or otherwise label files, I recommend mounting the directory containing your project root 
(not just images) to /data in the container.

The DISPLAY and X11 mappings are necessary to display the GUI.

If you want to update the predefined classes, you can mount a file to /data/predefined_classes.txt.
e.g.
`docker run -e DISPLAY=$DISPLAY -v .:/data -v /tmp/.X11-unix:/tmp/.X11-unix -v /path/to/predefined_classes.txt:/labelImg/data/predefined_classes.txt topher217/labelimg:latest`

