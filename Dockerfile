# Copy everything from nginx-alpine into data container to invert the layers.
# This allows the server to be updated without repulling the data layer.

FROM nginx:alpine
RUN echo hi

FROM scratch
COPY --from=0 / /

EXPOSE 80
STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]
