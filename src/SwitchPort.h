#ifndef SWITCHPORT_H_
#define SWITCHPORT_H_

#include <omnetpp.h>

using namespace omnetpp;

class SwitchPort : public cSimpleModule
{
  private:
    cGate *ethPort;
    cGate *toFabric;
    simtime_t lastPacketArrivalTime;
    simtime_t totalOccupiedTime;
    int numPacketsProcessed; // Declaraci�n de numPacketsProcessed
    bool operational; // Declaraci�n de la variable de estado operacional

  public:
    SwitchPort();
    virtual ~SwitchPort();

    // M�todos para acceder y modificar el estado operacional
    void setOperational(bool state);
    bool isOperational() const;

  protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
    virtual void finish() override;

    // Declaraci�n de la funci�n calculateUtilizationPercentage
    double calculateUtilizationPercentage() const;
};

#endif /* SWITCHPORT_H_ */
