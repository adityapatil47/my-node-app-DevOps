# Use an official Node.js runtime as the base image
FROM node:22-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available) to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application (if applicable)
# Uncomment the following line if you have a build step
# RUN npm run build

# Expose the application port
EXPOSE 3000

# Set environment variables
ENV CI=true
ENV NODE_ENV=production

# Define the command to run the application
CMD ["npm", "start"]
