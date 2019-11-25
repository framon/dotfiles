#!/bin/bash

IMAGE=$(mktemp)
grim ${IMAGE}
mogrify -scale 10% -scale 1000% ${IMAGE}
swaylock -f -i ${IMAGE}
