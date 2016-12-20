{{- define "api_paste_ini_tpl" -}}
# Ceilometer API WSGI Pipeline
# Define the filters that make up the pipeline for processing WSGI requests
# Note: This pipeline is PasteDeploy's term rather than Ceilometer's pipeline
# used for processing samples

# Remove authtoken from the pipeline if you don't want to use keystone authentication
[pipeline:main]
pipeline = request_id authtoken api-server

[app:api-server]
paste.app_factory = ceilometer.api.app:app_factory

[filter:authtoken]
paste.filter_factory = keystonemiddleware.auth_token:filter_factory

[filter:request_id]
paste.filter_factory = oslo_middleware:RequestId.factory
{{- end -}}