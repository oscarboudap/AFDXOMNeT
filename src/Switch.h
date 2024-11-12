#ifndef SWITCH_H_
#define SWITCH_H_

#include <omnetpp.h>

using namespace omnetpp;

class Switch : public cSimpleModule
{
  private:
    cMessage *failureEvent;
    cMessage *recoveryEvent;

  public:
    Switch();
    virtual ~Switch();

  protected:
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;

    void setOperational(bool state);
};

#endif /* SWITCH_H_ */
