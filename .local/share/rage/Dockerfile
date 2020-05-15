FROM gentoo/portage:latest as portage

FROM gentoo/stage3-amd64:latest

COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

RUN mkdir -p /usr/local/share

COPY .local/share /usr/local/share

RUN /bin/sh /usr/local/share/rage/scripts/provision.sh

