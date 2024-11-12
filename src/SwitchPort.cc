#include "SwitchPort.h"
#include "AFDXMessage_m.h"

Define_Module(SwitchPort);

SwitchPort::SwitchPort()
{
    ethPort = nullptr;
    toFabric = nullptr;
    lastPacketArrivalTime = SIMTIME_ZERO;
    totalOccupiedTime = SIMTIME_ZERO;
    numPacketsProcessed = 0;
    operational = true; // Estado inicial operativo
}

SwitchPort::~SwitchPort()
{
    // No necesitas eliminar los punteros a cGate aquí
}

void SwitchPort::initialize()
{
    ethPort = gate("ethPort");
    toFabric = gate("toFabric");

    lastPacketArrivalTime = SIMTIME_ZERO;
    totalOccupiedTime = SIMTIME_ZERO;
    numPacketsProcessed = 0;

    WATCH(totalOccupiedTime);

    // Programar eventos para falla y recuperación
    scheduleAt(simTime() + 10, new cMessage("startFailure"));
    scheduleAt(simTime() + 30, new cMessage("endFailure"));
}

void SwitchPort::handleMessage(cMessage *msg)
{
    if (msg->isSelfMessage()) {
        if (strcmp(msg->getName(), "startFailure") == 0) {
            setOperational(false);
            EV_INFO << "SwitchPort entering failure mode" << endl;
        } else if (strcmp(msg->getName(), "endFailure") == 0) {
            setOperational(true);
            EV_INFO << "SwitchPort recovering from failure mode" << endl;
        }
        delete msg;
        return;
    }

    if (operational) {
        if (msg->arrivedOn("ethPort")) {
            EV_INFO << "Received packet on ethPort" << endl;
            send(msg, "toFabric");
        } else {
            send(msg, "ethPort");
        }
    } else {
        // Descartar mensajes durante la falla
        EV_INFO << "SwitchPort in failure mode, discarding packet" << endl;
        delete msg;
    }
}

void SwitchPort::finish()
{
    // Implementar la lógica para finalizar y registrar estadísticas
    recordScalar("TotalPacketsProcessed", numPacketsProcessed);
    recordScalar("TotalOccupiedTime", totalOccupiedTime.dbl());
    recordScalar("UtilizationPercentage", calculateUtilizationPercentage());
}

double SwitchPort::calculateUtilizationPercentage() const
{
    simtime_t simulationTime = simTime();
    if (simulationTime == SIMTIME_ZERO)
        return 0.0;

    return (totalOccupiedTime.dbl() / simulationTime.dbl()) * 100.0;
}

void SwitchPort::setOperational(bool state)
{
    operational = state;
}

bool SwitchPort::isOperational() const
{
    return operational;
}
