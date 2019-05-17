FROM nginx:1.10-alpine

RUN apk --update --no-cache add bash

COPY ./scripts/ /scripts
ENTRYPOINT []
CMD ["/bin/bash", "/scripts/entrypoint.sh"]
