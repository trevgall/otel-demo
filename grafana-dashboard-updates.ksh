#!/usr/bin/env bash 

# Script to help update the Opentelemetry Demo - Collector Data Flow grafana dashboard with updated prometheus metric names 
# Run once only - or else the metric names will corrupt 
# Logic could be added to check/prevent this... 

# Make updates to grafana dashboard metric names 
kubectl get cm my-otel-demo-grafana-dashboards -o yaml | sed "s/otelcol_process_cpu_seconds/otelcol_process_cpu_seconds_total/g" | kubectl replace -f -
kubectl get cm my-otel-demo-grafana-dashboards -o yaml | sed "s/otelcol_exporter_sent_spans/otelcol_exporter_sent_spans_total/g" | kubectl replace -f -
kubectl get cm my-otel-demo-grafana-dashboards -o yaml | sed "s/otelcol_receiver_accepted_spans/otelcol_receiver_accepted_spans_total/g" | kubectl replace -f -
kubectl get cm my-otel-demo-grafana-dashboards -o yaml | sed "s/otelcol_receiver_refused_spans/otelcol_receiver_refused_spans_total/g" | kubectl replace -f -
kubectl get cm my-otel-demo-grafana-dashboards -o yaml | sed "s/otelcol_exporter_sent_metric_points/otelcol_exporter_sent_metric_points_total/g" | kubectl replace -f -
kubectl get cm my-otel-demo-grafana-dashboards -o yaml | sed "s/otelcol_receiver_accepted_metric_points/otelcol_receiver_accepted_metric_points_total/g" | kubectl replace -f -
kubectl get cm my-otel-demo-grafana-dashboards -o yaml | sed "s/otelcol_receiver_refused_metric_points/otelcol_receiver_refused_metric_points_total/g" | kubectl replace -f -
kubectl get cm my-otel-demo-grafana-dashboards -o yaml | sed "s/otelcol_process_uptime/otelcol_process_uptime_total/g" | kubectl replace -f -
kubectl get cm my-otel-demo-grafana-dashboards -o yaml | sed "s/otelcol_receiver_accepted_log_records/otelcol_receiver_accepted_log_records_total/g" | kubectl replace -f -
kubectl get cm my-otel-demo-grafana-dashboards -o yaml | sed "s/otelcol_receiver_refused_log_records/otelcol_receiver_refused_log_records_total/g" | kubectl replace -f -
kubectl get cm my-otel-demo-grafana-dashboards -o yaml | sed "s/otelcol_exporter_sent_log_records/otelcol_exporter_sent_log_records_total/g" | kubectl replace -f -

# Restart the prometheus server pod to pick up the updated dashboard configmap 
kubectl rollout restart deployment my-otel-demo-prometheus-server


