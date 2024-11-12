#ifndef UTILIZATIONTRACKER_H
#define UTILIZATIONTRACKER_H

#include <omnetpp.h>
#include <map>

using namespace omnetpp;

namespace afdx {

class UtilizationTracker : public cSimpleModule
{
  private:
    int noOfPorts;
    double ethSpeed; // velocidad de la interfaz en Mbps
    std::map<int, long> bytesSent;
    std::map<int, double> utilization;
    std::map<int, int> packetCount;

    cMessage *utilizationEvent; // Evento periódico para calcular la utilización

  protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
    virtual void finish() override;
    virtual void handleUtilizationEvent(); // Declaración de la función

  public:
    UtilizationTracker();
    virtual ~UtilizationTracker();
    void calculateUtilization(); // Declaración de la función
};

}; // namespace afdx

#endif // UTILIZATIONTRACKER_H
