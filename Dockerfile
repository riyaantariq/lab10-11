# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available) into the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code into the container
COPY . .

# Build the React application for production
RUN npm run build

# Expose port 80 to the outside world
EXPOSE 8080

# Command to run the application when the container starts
CMD ["npm", "start"]
