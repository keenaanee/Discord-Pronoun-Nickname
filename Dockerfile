# Use a small Node image
FROM node:22-alpine

# Create and use /app as the working folder inside the container
WORKDIR /app

# Copy package info first (for cached installs)
COPY package*.json ./

# Install only production dependencies
RUN npm install --production

# Copy the rest of your bot code into the image
COPY . .

# Start the bot
CMD ["node", "index.js"]
