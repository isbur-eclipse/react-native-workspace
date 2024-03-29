# Set permissions on /etc/passwd and /home to allow arbitrary users to write
COPY [--chown=0:0] entrypoint.sh /
RUN mkdir -p /home/user && chgrp -R 0 /home && chmod -R g=u /etc/passwd /home && chmod +x /entrypoint.sh

USER 10001
ENV HOME=/home/user
WORKDIR /projects
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["tail", "-f", "/dev/null"]