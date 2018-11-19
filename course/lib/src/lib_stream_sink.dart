/*
 Sink calss represents a generic interface for data receivers .

 EventSink class uses the 'add' method of the Sink class to send a data event to stream , as well ass the 'close' method to send a done event.
                 uses 'addError' method belongs to the EventSink class  that sends an asynchronous error to a stream .
 */

/*
StreamSink class combines methods from StreamCousumer and Eventsink. 

  methods from StreamCousumer and Eventsink class will block each other .

  We cannot send the data or error events via the methods of the EventSink class while we are adding the source stream via the addStream method from StreamConsumer.

  We can start using the methods from EventSink only after the Future instance returned by the addStream method is completed with a value. Also, the addStream method will be delayed until the underling system consumes the data added by the EventSink method.

StreamSink class has a done getter that return the Future instance that is completed when the owned StreamSink Class is finished 


*/