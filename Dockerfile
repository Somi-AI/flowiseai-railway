# Use the official Flowise image to avoid broken npm global installs
# (missing nested deps like turndown) and Alpine native-compile failures.
FROM flowiseai/flowise:latest

USER root

# postgresql-client: create the flowise database on first boot
# curl: health checks / debugging
RUN apk add --no-cache postgresql-client curl

COPY init-db.sh /init-db.sh
RUN chmod +x /init-db.sh

ENV PORT=80
ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

EXPOSE ${PORT}

ENTRYPOINT ["/init-db.sh"]
