#ifndef __AFDXMESSAGESINK_H__
#define __AFDXMESSAGESINK_H__

#include <omnetpp.h>
#include "queueinglib/Sink.h"
#include "AFDXMessage_m.h"

namespace afdx {

/**
 * AFDX Message Sink module.
 */
class AFDXMessageSink : public queueing::Sink
{
  protected:
    virtual void handleMessage(cMessage *msg) override;
};

}; // namespace afdx

#endif
