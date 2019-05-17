FROM nginx:1.10-alpine

COPY ./scripts/ /scripts
ENTRYPOINT []
CMD ["/bin/bash", "/scripts/entrypoint.sh"]

