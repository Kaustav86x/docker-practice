# base image ( using version 20 as it's more stable and won't break in production )
FROM node:20-alpine AS production

# set env variable
ENV NODE_ENV production

#setting up working directory
WORKDIR /app

#copy dependencies files
COPY package*.json ./

#install only production dependencies
RUN npm ci --only=production

#runs as a non-root user
USER node    

#copy app source code
COPY . .

#expose port
EXPOSE 4000

#start the app
CMD ["node", "src/index.js"]
