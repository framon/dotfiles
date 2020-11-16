#!/bin/bash

IMAGE=$(mktemp)
grim ${IMAGE}
mogrify -scale 5% -scale 2000% ${IMAGE}
swaylock -f -i ${IMAGE}
