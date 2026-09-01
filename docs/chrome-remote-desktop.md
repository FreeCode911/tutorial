# Chrome Remote Desktop

To get started, run the following commands:

## 1. Install dependencies

```bash
apt update && apt upgrade -y && apt install curl sudo dropbear python3 -y
```

## 2. Change the root password to enable SSH

```bash
echo root:changethiswithyourpassword | chpasswd
```

Replace `changethiswithyourpassword` with a secure password for the root user. For example:

```bash
echo root:123456 | chpasswd
```

> DO NOT USE THIS DIRECTLY

## 3. Start Dropbear

```bash
dropbear -p yourServerPort
```

Replace `yourServerPort` with the actual server port you have been assigned.

## 4. Connect to the VPS with PuTTY or SSH

You will need to figure this out yourself.

## 5. Fix `systemctl` (important)

The default `systemctl` does not work with this system. Execute the commands one by one:

```bash
curl -o /bin/systemctl https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py
chmod +x /bin/systemctl
systemctl
```

If it returns a large list of services, you are good to go. Otherwise, repeat this step.

## 6. Run the installation script

```bash
bash <(curl -s https://raw.githubusercontent.com/unknownpersonog/RDPXcript/main/install.sh)
```

## 7. Follow the script guidance

Ensure you select `0` when choosing CRD or XRDP.

> NOTE: This only works for Debian!
