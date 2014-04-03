using Thrift
using Logging
Logging.configure(level=DEBUG)

import Thrift.process, Thrift.meta

# include the generated hello module
include("gen-jl/StatisticsServer/StatisticsServer.jl");

# create a client instance with our choice of protocol and transport
clnt_transport = TSocket(9999)
proto = TBinaryProtocol(clnt_transport)
clnt = StatisticsServer.StatisticsServerHandlerClient(proto)

# open a connection
open(clnt_transport)
# invoke service and print the result
request = StatisticsServer.StatisticsEvent()
set_field(request, :timestamp, int64(time()))
set_field(request, :value, rand(1:100))

info("Event: ", request)
println(StatisticsServer.appendEvent(clnt, request))
# close connection
close(clnt_transport)
