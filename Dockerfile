FROM arm32v6/node:10-alpine

RUN apk add python make gcc libc-dev g++ linux-headers dbus avahi avahi-dev avahi-compat-libdns_sd

# Set the home directory to our app user's home.
ENV HOME=/home/app

# Create the home directory for the new app user.
RUN mkdir -p $HOME

# Create a non-root user. This is necessary in order for sqlite compilation on armv6 to complete.
RUN adduser -S app -h $HOME -s /sbin/nologin

WORKDIR $HOME

# Run npm install before copying app code so Docker will cache installed node_modules as a separate layer
COPY package*.json ./

# Chown all the files to the app user.
RUN chown -R app $HOME

USER app

RUN npm install --loglevel verbose

# Copy in the application code.
ADD index.js $HOME
ADD startup.sh $HOME

USER root

ENV NODE_ENV production

ENTRYPOINT ["./startup.sh"]