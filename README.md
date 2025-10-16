# Minecraft Server on Project IDX

A Minecraft server setup configured to run on Google's Project IDX environment with automatic tunneling via playit.gg.

## 📋 Overview

This project provides a complete Minecraft server environment that:
- Runs on Project IDX using Nix configuration
- Uses Java 21 (JDK 21) for optimal performance
- Automatically starts with playit.gg tunneling for external access
- Allocates 29GB RAM for the server
- Runs in a screen session for background operation

## 🚀 Prerequisites

- Google Project IDX workspace
- Minecraft server JAR file (see Setup section)
- playit.gg account (for external server access)

## 📦 Project Structure

```
minecraft-idx/
├── dev.nix           # Nix configuration for Project IDX
├── start.sh          # Server startup script
├── playit            # playit.gg tunnel binary
└── server/
    ├── server.jar    # Minecraft server JAR (not included)
    └── readme.md     # Server directory instructions
```

## 🛠️ Setup

### 1. Install Server JAR

Download your preferred Minecraft server JAR file and place it in the `server/` directory:

```bash
cd server
# Download your server JAR, for example:
# wget https://papermc.io/api/v2/projects/paper/versions/1.20.4/builds/xyz/downloads/paper-1.20.4-xyz.jar -O server.jar
```

### 2. Configure playit.gg

1. Sign up at [playit.gg](https://playit.gg)
2. The `playit` binary will start automatically and provide a tunnel URL
3. Follow the authentication prompts when first running

### 3. Accept Minecraft EULA

Before the server can start, you need to accept the EULA:

```bash
cd server
# After first run, edit eula.txt and change eula=false to eula=true
```

## ▶️ Running the Server

The server is configured to start automatically when the IDX workspace starts. You can also manually start it:

```bash
./start.sh
```

This script will:
1. Start playit.gg in a screen session named `playit`
2. Launch the Minecraft server with 29GB RAM allocation

### Accessing Screen Sessions

To view the playit tunnel information:
```bash
screen -r playit
```

To detach from a screen session: Press `Ctrl+A` then `D`

## ⚙️ Configuration

### Memory Allocation

The server is configured with 29GB RAM by default. To adjust this, edit `start.sh`:

```bash
java -Xms29G -Xmx29G -jar server.jar
```

Change `29G` to your desired amount (e.g., `4G`, `8G`, `16G`).

### Nix Packages

The `dev.nix` file includes:
- `jdk21` - Java Development Kit 21
- `unzip` - For extracting archives
- `screen` - For background process management

## 🌐 Connecting to Your Server

1. Check the playit screen session for your tunnel URL
2. Share the tunnel address with players
3. Players connect using: `<your-playit-url>:25565`

## 🔧 Troubleshooting

### Server won't start
- Ensure `server.jar` exists in the `server/` directory
- Check that EULA has been accepted (`eula=true` in `server/eula.txt`)
- Verify sufficient disk space

### Can't connect to server
- Ensure playit tunnel is running: `screen -r playit`
- Check that the Minecraft server is running
- Verify firewall settings allow the connection

### Out of memory errors
- Reduce RAM allocation in `start.sh`
- Check IDX workspace resource limits

## 📝 Notes

- The server runs in the foreground after starting (no screen for the main server)
- Only the playit tunnel runs in a screen session
- Server files and world data are stored in the `server/` directory
- Remember to backup your world data regularly
