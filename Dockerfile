# Use official node.js image as base
FROM node:lts-alpine

# Set working directory
WORKDIR /app

# Copy package.json and lock files
COPY package.json package-lock.json ./

# Install dep
RUN npm ci

# Copy rest of the code
COPY . .

# Build project 
RUN npm run build

# expose the port
EXPOSE 3000

CMD ["npm", "run", "dev"]
