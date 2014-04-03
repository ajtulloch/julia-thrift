Simple demonstration of Thrift RPC with Julia.

## Build ##


```bash
make thrift
```

## Server ##

```bash
make server
```

## Client ##

(with the server running)

```bash
make client
```

Output should be as follows.


```bash
∴ make server
julia server.jl
starting to serve requests...
04-Apr 00:35:12:INFO:root:Event: StatisticsEvent(1396568112,11)
```

```bash
∴ make client
julia client.jl
04-Apr 00:35:11:INFO:root:Event: StatisticsEvent(1396568112,11)
StatisticsEvent(1396568112,11)
```
