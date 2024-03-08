# This is for debugging. Do not change this at your own risk.
# (That means you should change this.)
OSPSWD=dkjfhsjdkfkjdjhksfhskd98475kjHkzjxckj

spelunker-local:
	cat schema/2.x/mappings.spelunker.json | \
		curl -k \
		-H 'Content-Type: application/json' \
		-X PUT \
		https://admin:$(OSPSWD)@localhost:9200/spelunker \
		-d @-
	curl -k \
		-H 'Content-type:application/json' \
		-XPUT https://admin:$(OSPSWD)@localhost:9200/spelunker/_settings \
		-d '{"index.mapping.total_fields.limit": 5000}'
