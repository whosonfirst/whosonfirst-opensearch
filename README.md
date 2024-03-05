# whosonfirst-opensearch

## Documentation

Documentation is incomplete.

## Examples

All of these examples assume you are using a local Docker instance running a [containerized version of OpenSearch](https://opensearch.org/docs/latest/install-and-configure/install-opensearch/docker/).

### Creating an index

```
$> cat schema/2.x/mappings.spelunker.json | \
	curl -k \
	-H 'Content-Type: application/json' \
	-X PUT \
	https://admin:$(OSPSWD)@localhost:9200/spelunker \
	-d @-

{"acknowledged":true,"shards_acknowledged":true,"index":"spelunker"}
```

## See also

* https://github.com/whosonfirst/go-whosonfirst-opensearch
* https://github.com/whosonfirst/go-whosonfirst-spelunker-opensearch
* https://opensearch.org/docs/latest/install-and-configure/install-opensearch/docker/
