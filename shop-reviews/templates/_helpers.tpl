{{/*
Expand the name of the chart.
*/}}
{{- define "shop-reviews.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "shop-reviews.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "shop-reviews.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "shop-reviews.labels" -}}
helm.sh/chart: {{ include "shop-reviews.chart" . }}
{{ include "shop-reviews.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "shop-reviews.selectorLabels" -}}
app.kubernetes.io/name: {{ include "shop-reviews.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
version: v1
{{- end }}
{{/*

*/}}
{{- define "shop-reviews.selectorLabels-02" -}}
app.kubernetes.io/name: {{ include "shop-reviews.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
version: v2
{{- end }}
{{/*

Create the name of the service account to use
*/}}
{{- define "shop-reviews.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "shop-reviews.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}