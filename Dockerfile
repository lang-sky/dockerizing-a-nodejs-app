FROM node:12.13.0-alpine
RUN mkdir opt/app
WORKDIR /opt/app
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY addressbook/ .
RUN npm install
RUN chown -R appuser:appgroup /opt/app
USER appuser
EXPOSE 3000
CMD ["npm", "run", "pm2"]
