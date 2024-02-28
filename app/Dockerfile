# Install and Build layer.
FROM node:20.11.1-slim as builder
WORKDIR /builder
COPY . /
RUN npm install
RUN npm run build

# Run layer.
FROM node:20.11.1-slim
WORKDIR /app
COPY app /