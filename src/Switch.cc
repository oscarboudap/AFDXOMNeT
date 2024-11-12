#include "Switch.h"
#include "SwitchPort.h"

Define_Module(Switch);

Switch::Switch()
{
    failureEvent = nullptr;
    recoveryEvent = nullptr;
}

Switch::~Switch()
{
    cancelAndDelete(failureEvent);
    cancelAndDelete(recoveryEvent);
}

void Switch::initialize()
{
    int noOfPorts = par("noOfPorts");
    failureEvent = new cMessage("failureEvent");
    recoveryEvent = new cMessage("recoveryEvent");

    simtime_t failureStartTime = par("failureStartTime");
    simtime_t recoveryStartTime = par("recoveryStartTime");

    scheduleAt(failureStartTime, failureEvent);
    scheduleAt(recoveryStartTime, recoveryEvent);

    for (int i = 0; i < noOfPorts; i++) {
        cModule *portModule = getSubmodule("switchPort", i);
        SwitchPort *port = check_and_cast<SwitchPort *>(portModule);
        port->setOperational(true); // Inicialmente todos los puertos están operativos
    }
}

void Switch::handleMessage(cMessage *msg)
{
    if (msg == failureEvent) {
        setOperational(false);
        EV_INFO << "Switch entering failure mode" << endl;
    } else if (msg == recoveryEvent) {
        setOperational(true);
        EV_INFO << "Switch recovering from failure mode" << endl;
    } else {
        // Manejo de otros mensajes si es necesario
    }
}

void Switch::setOperational(bool state)
{
    int noOfPorts = par("noOfPorts");

    for (int i = 0; i < noOfPorts; i++) {
        cModule *portModule = getSubmodule("switchPort", i);
        SwitchPort *port = check_and_cast<SwitchPort *>(portModule);
        port->setOperational(state);
    }
}
