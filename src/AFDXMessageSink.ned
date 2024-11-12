package afdx;

import afdx.queueinglib.Sink;

// Definición de la fuente de mensajes AFDX
simple AFDXMessageSink extends Sink
{
    @class(AFDXMessageSink);
    string destAddresses;  // Parámetro de dirección de destino
}

