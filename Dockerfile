FROM node:18 AS build
ARG SRC_DIR=/home/demo
WORKDIR "$SRC_DIR"
COPY ./Cricket11/package.json "$SRC_DIR"
RUN npm install


FROM node:alpine AS production
LABEL np.com.techaxis.version=2.0
ARG SRC_DIR=/home/demo
ENV PORT=3000
WORKDIR "$SRC_DIR"
COPY ./Cricket11 "$SRC_DIR"
COPY --from=build /home/demo "$SRC_DIR"
EXPOSE "$PORT"
CMD ["node", "app.js"]
