FROM irinesistiana/mosdns:latest

COPY ./content /etc/mosdns

ADD hosts /hosts
COPY hosts /hosts

ENV PORT=8080
ENV DOH_PATH=/dns-query

RUN chmod 0644 /etc/mosdns/entrypoint.sh
RUN chmod 0644 /etc/mosdns/install_geodata.sh
RUN chmod 0644 /etc/mosdns/my_first_process.sh
RUN chmod 0644 /etc/mosdns/my_second_process.sh
RUN chmod 0644 /etc/mosdns/script1.sh
RUN chmod 0644 /etc/mosdns/script2.sh

EXPOSE 8080

ENTRYPOINT [ "sh","/etc/mosdns/entrypoint.sh" ]
