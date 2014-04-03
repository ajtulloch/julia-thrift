using Logging
Logging.configure(level=DEBUG)

function appendEvent(event::StatisticsEvent)
    info("Event: ", event)
    return event
end



