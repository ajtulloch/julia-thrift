using Logging
Logging.configure(level=DEBUG)

function appendEvent(event::StatisticsEvent)
    info("Event: %s", event)
    return event
end



