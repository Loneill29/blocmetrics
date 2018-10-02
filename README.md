# MyMetrics

An analytics service featuring a client-side JavaScript snippet that allows users to track events on their website, a server-side API that captures and saves those events to a database, and a Rails application that displays the captured event data for a user.


**JS added to Blocitoff application:**

```
var blocmetrics = {};
blocmetrics.report = function(eventName) {
   var event = {event: { name: eventName }};
   var request = new XMLHttpRequest();
   request.open("POST", "http://localhost:3000/api/events", true);
   request.setRequestHeader('Content-Type', 'application/json');
   request.send(JSON.stringify(event));
}
```
