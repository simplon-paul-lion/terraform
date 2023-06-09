# monitoring

## cpu usage

sum(rate(container_cpu_usage_seconds_total{namespace="default", pod_name="voteapp"}[5m])) * 100

sum(rate(container_cpu_usage_seconds_total{namespace="default", pod_name="redis"}[5m])) * 100

## memory en byte

container_memory_usage_bytes{namespace="default", pod_name="voteapp"}

container_memory_usage_bytes{namespace="default", pod_name="redis"}

## memory en pourcentage

sum(container_memory_usage_bytes{namespace="default", pod_name="voteapp"}) / sum(container_spec_memory_limit_bytes{namespace="default", pod_name="voteapp"}) * 100

sum(container_memory_usage_bytes{namespace="default", pod_name="redis"}) / sum(container_spec_memory_limit_bytes{namespace="default", pod_name="redis"}) * 100

## swap en byte

container_swap_usage_bytes{namespace="default", pod_name="voteapp"}

container_swap_usage_bytes{namespace="default", pod_name="redis"}
