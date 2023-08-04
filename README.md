# Debian with systemd

Start container with systemd, and you can exec every systemd commands.

## Usage

You can deploy this container with docker command.

```bash
docker run -itd --name systemd-test \
    --privileged \
    --security-opt seccomp=unconfined \
    --cgroup-parent=docker.slice \
    --tmpfs /tmp \
    --tmpfs /run \
    --tmpfs /run/lock \
    yksam/debian-systemd:latest
```

Also, you can deploy this container easily with docker-compose.

```bash
# Deploy
root@docker-host:~$ docker-compose -f debian-systemd.yml up -d
# Check
root@docker-host:~$ docker exec -it systemd-test bash
root@079da47afc5f:/# systemctl status
● 079da47afc5f
    State: running
    Units: 83 loaded (incl. loaded aliases)
     Jobs: 0 queued
   Failed: 0 units
    Since: Fri 2023-08-04 09:13:54 UTC; 1min 1s ago
  systemd: 252.12-1~deb12u1
   CGroup: /
           ├─init.scope
           │ ├─ 1 /lib/systemd/systemd
           │ ├─22 bash
           │ ├─29 systemctl status
           │ └─30 "(pager)"
           └─system.slice
             └─systemd-journald.service
               └─21 /lib/systemd/systemd-journald
```

## Build

```bash
root@docker-host:~$ git clone https://github.com/YK-Samgo/debian-systemd.git
root@docker-host:~$ cd debian-systemd
root@docker-host:~$ docker build . -t debian-systemd
```
