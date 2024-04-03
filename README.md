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

It is also necessary to bump the "total_fields" limit on the index since any give Who's On First repository can exceed the default limit of 1000 fields:

```
$> curl -k \
	-H 'Content-type:application/json' \
	-XPUT https://admin:$(OSPSWD)@localhost:9200/spelunker/_settings \
	-d '{"index.mapping.total_fields.limit": 6000}'
	
{"acknowledged":true}
```

_5000, it turns out, is still too small._

### Indexing data

Using the `wof-opensearch-index` tool from the [whosonfirst/go-whosonfirst-opensearch](https://github.com/whosonfirst/go-whosonfirst-opensearch) package:

```
$> bin/wof-opensearch-index \
	-writer-uri 'constant://?val=opensearch2%3A%2F%2Flocalhost%3A9200%2Fspelunker%3Fusername%3Dadmin%26password%3...%26debug%3Dtrue%26insecure%3Dtrue%26require-tls%3Dtrue' \
	/usr/local/data/whosonfirst-data-admin-ca/
```

## See also

* https://github.com/whosonfirst/go-whosonfirst-opensearch
* https://github.com/whosonfirst/go-whosonfirst-spelunker-opensearch
* https://opensearch.org/docs/latest/install-and-configure/install-opensearch/docker/
