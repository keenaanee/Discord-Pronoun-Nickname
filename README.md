![Discord Pronoun Nickname Bot](https://repository-images.githubusercontent.com/1096099312/03ae624f-f171-4de1-8abf-0758b6865b4f)

# Discord Pronoun Nickname Bot

Small Discord bot that lets users pick pronouns from buttons in a locked roles
channel and automatically appends those pronouns to their server nickname, e.g.:

`Cricket [She/They / Xe/Xem]`

Designed to be simple, self-hosted, and Discord-only (no web UI needed).

## Pull from DockerHub

Discord pronoun nickname bot:

[![Docker Pulls](https://img.shields.io/docker/pulls/keenaanee/discord-pronoun-nickname)](https://hub.docker.com/r/keenaanee/discord-pronoun-nickname)

## What it does

### Pronoun buttons → nickname suffix

- You run a one-time setup command (`!setup-pronouns`) in a roles channel.
- The bot posts a single message with buttons for pronouns, including:
  - He/Him, She/Her, They/Them, It/Its, Any pronouns, Ask me
  - She/They, He/They, Ze/Hir, Xe/Xem, Ey/Em
  - Clear pronouns
- Users click buttons to toggle pronoun sets on or off.
- The bot edits their nickname in that server to:

  `Name [pronoun / pronoun / …]`

- Multiple pronouns are supported (e.g. `Name [She/They / Xe/Xem]`).
- “Clear pronouns” removes the suffix and restores the base nickname.

### Locked roles channel friendly

- Works well with a dedicated roles channel (e.g. `🌈roles`) where:
  - Only the bot can send messages.
  - Everyone can press buttons.
- Setup command message is deleted after use to keep the channel clean.

## Requirements

- A Discord bot application with:
  - `DISCORD_TOKEN` (bot token).
  - **Privileged Intents** enabled:
    - Server Members Intent
    - Message Content Intent
- Bot permissions in your Discord server:
  - `View Channels`
  - `Send Messages` in your roles channel
  - `Read Message History`
  - `Change Nickname`
  - `Manage Nicknames`
- The bot’s role must be **above** normal member roles so it can edit nicknames.

## Configuration (environment variables)

Configuration is minimal and done via environment variables:

- `DISCORD_TOKEN` (required)  
  Your Discord bot token from the Developer Portal.

You can provide this via:

- `.env` file (when running locally or with `--env-file`), or  
- A variable in your Docker/Unraid template.

## Running this bot with Docker

### Build (optional, if you want your own image)

```bash
docker build -t your-docker-user/discord-pronoun-nickname .
```

##Run

```bash
docker run -d \
  --name discord-pronoun-nickname \
  -e DISCORD_TOKEN="your-discord-bot-token" \
  --restart unless-stopped \
  keenaanee/discord-pronoun-nickname
```

##Logs

```bash
docker logs -f discord-pronoun-nickname
```

##Command
```bash
!setup-pronouns
```