#ifndef __LINK_MONITOR_H
#define __LINK_MONITOR_H

#include <omnetpp.h>

using namespace omnetpp;

class LinkMonitor : public cSimpleModule
{
  private:
    int packetCount; // Counter for packets

  protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
    virtual void finish() override;

  public:
    LinkMonitor();
    virtual ~LinkMonitor();
};

#endif
