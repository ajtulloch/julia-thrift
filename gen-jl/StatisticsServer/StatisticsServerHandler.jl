#
# Autogenerated by Thrift Compiler (1.0.0-dev)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING



# types encapsulating arguments and return values of method appendEvent

type appendEvent_args
  event::StatisticsEvent
  appendEvent_args() = (o=new(); fillunset(o); o)
end # type appendEvent_args

type appendEvent_result
  success::StatisticsEvent
  appendEvent_result() = (o=new(); fillunset(o); o)
  appendEvent_result(success) = (o=new(); fillset(o, :success); o.success=success; o)
end # type appendEvent_result
meta(t::Type{appendEvent_result}) = meta(t, Symbol[:success], Int[0], Dict{Symbol,Any}())



# Processor for StatisticsServerHandler service (to be used in server implementation)
type StatisticsServerHandlerProcessor <: TProcessor
  tp::ThriftProcessor
  function StatisticsServerHandlerProcessor()
    p = new(ThriftProcessor())
    handle(p.tp, ThriftHandler("appendEvent", _appendEvent, appendEvent_args, appendEvent_result))
    p
  end
  _appendEvent(inp::appendEvent_args) = appendEvent_result(appendEvent(inp.event))
end # type StatisticsServerHandlerProcessor
process(p::StatisticsServerHandlerProcessor, inp::TProtocol, outp::TProtocol) = process(p.tp, inp, outp)
distribute(p::StatisticsServerHandlerProcessor) = distribute(p.tp)


# Server side methods to be defined by user:
# function appendEvent(event::StatisticsEvent)
#     # returns StatisticsEvent


# Client implementation for StatisticsServerHandler service
type StatisticsServerHandlerClient <: StatisticsServerHandlerClientBase
  p::TProtocol
  seqid::Int32
  StatisticsServerHandlerClient(p::TProtocol) = new(p, 0)
end # type StatisticsServerHandlerClient

# Client callable method for appendEvent
function appendEvent(c::StatisticsServerHandlerClientBase, event::StatisticsEvent)
  p = c.p
  c.seqid = (c.seqid < (2^31-1)) ? (c.seqid+1) : 0
  writeMessageBegin(p, "appendEvent", MessageType.CALL, c.seqid)
  inp = appendEvent_args()
  set_field(inp, :event, event)
  write(p, inp)
  writeMessageEnd(p)
  flush(p.t)
  
  (fname, mtype, rseqid) = readMessageBegin(p)
  (mtype == MessageType.EXCEPTION) && throw(read(p, TSTRUCT, TApplicationException()))
  outp = read(p, TSTRUCT, appendEvent_result())
  readMessageEnd(p)
  (rseqid != c.seqid) && throw(TApplicationException(ApplicationExceptionType.BAD_SEQUENCE_ID, "response sequence id $rseqid did not match request ($(c.seqid))"))
  has_field(outp, :success) && (return get_field(outp, :success))
  throw(TApplicationException(ApplicationExceptionType.MISSING_RESULT, "retrieve failed: unknown result"))
end # function appendEvent

