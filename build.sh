#!/bin/bash

docker build . -t yksam/debian-systemd:12

docker tag yksam/debian-systemd:12 yksam/debian-systemd:latest

docker push yksam/debian-systemd:12
docker push yksam/debian-systemd:latest
