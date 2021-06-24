FROM alpine:3.13

ENV GF_PATHS_CONFIG="/etc/grafana/grafana.ini" \
    GF_PATHS_HOME="/usr/share/grafana" \
    GF_PATHS_DASHBOARDS="/usr/share/grafana/public/dashboards" \
#    GF_PATHS_PLUGINS="/usr/share/grafana/conf/provisioning/plugins" \
    GF_PATHS_PROVISIONING="/usr/share/grafana/conf/provisioning"
#    GF_AUTH_DEFAULT_HOME_DASHBOARD_PATH="/usr/share/grafana/public/dashboards/home.json"


RUN apk update \
&& apk add --no-cache grafana=7.3.6-r0

RUN rm -f "$GF_PATHS_PROVISIONING/dashboards/sample.yaml" \
          "$GF_PATHS_PROVISIONING/datasources/sample.yaml" \
          "$GF_PATHS_DASHBOARDS/default.json" \
          "$GF_PATHS_DASHBOARDS/template_vars.json" \
&& mkdir -p /etc/grafana "$GF_PATHS_DASHBOARDS/ft-services"
RUN chown -R grafana:grafana "$GF_PATHS_HOME" \
&& chown -R grafana:grafana /etc/grafana

VOLUME ["$GF_PATHS_HOME/data"]

WORKDIR $GF_PATHS_HOME

EXPOSE 3000

COPY  ./entrypoint.sh .
ENTRYPOINT ["sh", "./entrypoint.sh"]

CMD [ "/usr/sbin/grafana-server" ]
