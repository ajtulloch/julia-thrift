using Thrift
import Thrift.process, Thrift.meta

# include the generated module, which in-turn includes our implementation code in `hello_impl.jl`
include("gen-jl/StatisticsServer/StatisticsServer.jl");
## import StatisticsServer.StatisticsServerProcessor

# create a server instance with our choice of protocol and transport
srvr_processor = StatisticsServerProcessor()
srvr_transport = TServerSocket(9999)
srvr = TSimpleServer(srvr_transport, srvr_processor, x->x, x->TBinaryProtocol(x), x->x, x->TBinaryProtocol(x))

# start serving client requests
println("starting to serve requests...")
serve(srvr)
