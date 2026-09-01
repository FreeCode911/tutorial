# SSH Setup

Follow these steps to set up your server.

## Type these commands first

```bash
apt update && apt upgrade -y
passwd root
```

Then type the root password twice.

Example:

```bash
123
123
```

## Next steps

```bash
apt install dropbear -y
dropbear -p server-port
```

You can add or find the server port here: https://control.lykcloud.com

> NOTE: This does not work for Ubuntu on LykCloud.
