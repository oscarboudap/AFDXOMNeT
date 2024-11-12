#include "LinkMonitor.h"

Define_Module(LinkMonitor);

LinkMonitor::LinkMonitor() : packetCount(0) {}

LinkMonitor::~LinkMonitor() {}

void LinkMonitor::initialize()
{
    packetCount = 0;
    WATCH(packetCount);  // This macro enables inspection of the variable in the simulation
}

void LinkMonitor::handleMessage(cMessage *msg)
{
    // Count the packets
    packetCount++;
    send(msg, "ethOut");
}

void LinkMonitor::finish()
{
    recordScalar("Total Packets", packetCount);  // Record the total packet count
}
