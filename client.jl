using Thrift
import Thrift.process, Thrift.meta

# include the generated hello module
include("gen-jl/test/test.jl");
import test.FloatCalcProcessor, test.float_calculate, test.FloatCalcClient

# create a client instance with our choice of protocol and transport
clnt_transport = TSocket(9999)
proto = TBinaryProtocol(clnt_transport)
clnt = FloatCalcClient(proto)

# open a connection
open(clnt_transport)
# invoke service and print the result
println(float_calculate(clnt, "+", 1.0, 2.0))
# close connection
close(clnt_transport)
