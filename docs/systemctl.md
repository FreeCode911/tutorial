# Fixing Systemctl

The default `systemctl` does not work with this system. Follow these steps to fix it.

## Step 1: Install Python 3

```bash
apt-get install python3
```

Ensure you have `python3` installed on your system. This is required for the `systemctl` replacement script.

## Step 2: Download the systemctl replacement script

```bash
curl -o /bin/systemctl https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py
```

## Step 3: Make the script executable

```bash
chmod +x /bin/systemctl
```

## Step 4: Verify the installation

```bash
systemctl
```

Run the `systemctl` command to make sure the replacement script is working. You should see a list of services if everything is configured correctly.
