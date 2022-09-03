FROM irinesistiana/mosdns:latest

COPY ./content /etc/mosdns

ADD hosts /hosts
COPY hosts /hosts
ADD crontab.txt /crontab.txt
ADD script1.sh /script1.sh
ADD script2.sh /script2.sh
ADD my_first_process /my_first_process
ADD my_second_process /my_second_process

ENV PORT=8080
ENV DOH_PATH=/dns-query

EXPOSE 8080
RUN chmod +x /my_first_process
RUN chmod +x /my_second_process
RUN chmod +x /etc/mosdns/entrypoint.sh
ENTRYPOINT [ "sh","/etc/mosdns/entrypoint.sh" ]
