thrift:
	thrift --gen jl StatisticsServer.thrift

server:
	julia server.jl

client: 
	julia client.jl
