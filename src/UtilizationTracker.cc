// UtilizationTracker.cc
#include "UtilizationTracker.h"
#include "AFDXMessage_m.h"

namespace afdx {

Define_Module(UtilizationTracker);

UtilizationTracker::UtilizationTracker() {
    utilizationEvent = nullptr;
}

UtilizationTracker::~UtilizationTracker() {
    cancelAndDelete(utilizationEvent);
}

void UtilizationTracker::initialize() {
    noOfPorts = par("noOfPorts");
    ethSpeed = par("ethSpeed");

    utilizationEvent = new cMessage("utilizationEvent");
    scheduleAt(simTime() + 1, utilizationEvent);  // Schedule the first utilization calculation in 1 second

    bytesSent.clear();
    utilization.clear();
    for (int i = 0; i < noOfPorts; i++) {
        bytesSent[i] = 0;
        utilization[i] = 0.0;
    }

    WATCH_MAP(bytesSent);
    WATCH_MAP(utilization);
}

void UtilizationTracker::handleMessage(cMessage *msg) {
    if (msg == utilizationEvent) {
        handleUtilizationEvent();
        scheduleAt(simTime() + 1, utilizationEvent);  // Reschedule the utilization calculation in 1 second
    } else {
        AFDXMessage *afdxMsg = check_and_cast<AFDXMessage *>(msg);
        int portIndex = afdxMsg->getArrivalGate()->getIndex();
        bytesSent[portIndex] += afdxMsg->getByteLength();
        delete afdxMsg;
    }
}

void UtilizationTracker::handleUtilizationEvent() {
    calculateUtilization();
}

void UtilizationTracker::calculateUtilization() {
    double currentTime = simTime().dbl();
    for (int i = 0; i < noOfPorts; i++) {
        double bitsSent = bytesSent[i] * 8.0;  // Convert bytes to bits
        double utilizationPercentage = (bitsSent / (ethSpeed * 1e6 * currentTime)) * 100.0;
        utilization[i] = utilizationPercentage;
        bytesSent[i] = 0;  // Reset the byte count for the next interval
    }
}

void UtilizationTracker::finish() {
    for (int i = 0; i < noOfPorts; i++) {
        recordScalar((std::string("utilization_") + std::to_string(i)).c_str(), utilization[i]);
    }
}

} // namespace afdx
