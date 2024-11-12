package afdx;

import afdx.queueinglib.Source;

simple AFDXMessageSource extends Source
{
    @class(AFDXMessageSource);
    volatile int packetLength = default(128); // the length of AFDX Ethernet frame
    volatile int networkId; // (1) used as [n]
    volatile int equipmentId; // (1) used as [e]
    volatile int interfaceId; // (3bit) used as [i]
    volatile int virtualLinkId = default(0x1000); // (2) used as [v], valor por defecto
    volatile int seqNum; // (1) used as [s]
    volatile int partitionId; // (5bit) used as [p]
    volatile int udpSrcPort; // (2)
    volatile int udpDestPort; // (2)
}
