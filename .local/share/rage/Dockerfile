FROM gentoo/portage:latest as portage

FROM gentoo/stage3-amd64:latest

COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

WORKDIR /var/db/repos/rage
COPY . /var/db/repos/rage

RUN /bin/sh .local/share/rage/bin/provision.sh
