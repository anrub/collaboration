FROM mattermost/mattermost-team-edition:release-5.21

USER root

RUN apk add --no-cache libcap && rm -rf /tmp/* && setcap cap_net_bind_service=+ep /mattermost/bin/mattermost

USER mattermost

HEALTHCHECK --interval=1s CMD bash -c 'true' || exit 1

ENTRYPOINT ["/entrypoint.sh"]
WORKDIR /mattermost
CMD ["mattermost"]

EXPOSE 8065 8067 8074 8075 443 80

# Declare volumes for mount point directories
VOLUME ["/mattermost/data", "/mattermost/logs", "/mattermost/config", "/mattermost/plugins", "/mattermost/client/plugins"]

