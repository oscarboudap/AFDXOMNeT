package afdx;

import afdx.queueinglib.Sink;

// Definici�n de la fuente de mensajes AFDX
simple AFDXMessageSink extends Sink
{
    @class(AFDXMessageSink);
    string destAddresses;  // Par�metro de direcci�n de destino
}

