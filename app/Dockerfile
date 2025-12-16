#Build image

# lightweight base image set to keep builds fast and images small.
FROM node:20-alpine AS build

#working directory of container set to /app, all commands will run relative to /app
WORKDIR /app

#copy dependency based files to container, do this first for docker layer caching for faster builds
COPY package.json yarn.lock ./

#install dependencies inside container
RUN yarn install

#copy source code of application into container
COPY . .

#Build the app into a production ready bundle
RUN yarn build



#Runtime image
FROM node:20-alpine AS runtime

WORKDIR /app 

#install a light weight server to serve the built files so the application can run
RUN yarn global add serve

COPY --from=build app/public /app/public

COPY --from=build app/build /app/build

#Declare which port the container will listen on at runtime
EXPOSE 3000

#Running container as non-root user
RUN addgroup -g 1001 -S ismail_group && adduser -u 1001 -S -G ismail_group ismail_user

RUN chown -R ismail_user:ismail_group /app/public 

USER ismail_user

#specify the command to run when the container starts up, entrypoint instruction cannot be ignored or overridden
ENTRYPOINT ["serve","-s","build"]

#To verify the container is running as a non-root user use command docker exec {containername} whoami






