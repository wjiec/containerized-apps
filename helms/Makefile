.PHONY: all jaeger
.DEFAULT_GOAL: all
all: jaeger

HELM_UPGRADE_ARGS :=
ifeq ($(DEBUG), 1)
HELM_UPGRADE_ARGS += --dry-run
endif

jaeger:
	helm upgrade $@ ./jaeger $(HELM_UPGRADE_ARGS) -n tracing --install

jaeger-clean:
	kubectl -n tracing run jaeger-cleaner -ti --rm --restart=Never \
		--image jaegertracing/jaeger-es-index-cleaner --pod-running-timeout=10m \
		-- 0 http://jaeger-elasticsearch:9200
	kubectl -n tracing delete pod -l app.kubernetes.io/name=jaeger-collector
