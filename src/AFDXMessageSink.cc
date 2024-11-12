#include "AFDXMessageSink.h"

namespace afdx {

Define_Module(AFDXMessageSink);

void AFDXMessageSink::handleMessage(cMessage *msg) {
    // Check if the received message is an AFDX message
    AFDXMessage *afdxMsg = dynamic_cast<AFDXMessage *>(msg);
    if (!afdxMsg) {
        EV << "Received message is not an AFDX message." << endl;
        delete msg;
        return;
    }

    delete msg;
}

}; // namespace afdx
