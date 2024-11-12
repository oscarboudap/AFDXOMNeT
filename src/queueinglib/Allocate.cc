//
// This file is part of an OMNeT++/OMNEST simulation example.
//
// Copyright (C) 2006-2008 OpenSim Ltd.
//
// This file is distributed WITHOUT ANY WARRANTY. See the file
// `license' for details on this and other legal matters.
//

#include "Allocate.h"
#include "Job.h"

namespace queueing {

Define_Module(Allocate);

Allocate::Allocate()
{
}

Allocate::~Allocate()
{
}

void Allocate::initialize()
{
    fifo = par("fifo");
    capacity = par("capacity");
    queue.setName("queue");

    resourceAmount = par("resourceAmount");
    resourcePriority = par("resourcePriority");

    const char *resourceName = par("resourceModuleName");
    cModule *mod = getParentModule()->getModuleByPath(resourceName);
    if (!mod)
        throw cRuntimeError("Cannot find resource pool module `%s'", resourceName);
    resourcePool = check_and_cast<IResourcePool*>(mod);

    numDropped = 0;
    WATCH(numDropped);
    droppedVector.setName("dropped jobs");
    lengthVector.setName("length");
    queueingTimeVector.setName("queueing time");

}

void Allocate::handleMessage(cMessage *msg)
{
    Job *job = check_and_cast<Job *>(msg);
    if (queue.isEmpty() && allocateResource(job))
        send(job, "out");
    else
        enqueueOrDrop(job);
}

void Allocate::finish()
{
    recordScalar("jobs dropped", numDropped);
}

bool Allocate::allocateResource(Job *job)
{
    return resourcePool->tryToAllocate(this, resourceAmount, resourcePriority + job->getPriority());
}

std::string Allocate::getFullPath() const
{
    return cSimpleModule::getFullPath();
}

void Allocate::resourceGranted(IResourcePool *provider)
{
    Enter_Method("resourceGranted");

    // send out job for which resource was granted
    ASSERT2(!queue.isEmpty(), "Resource granted while no jobs are waiting");
    Job *job = dequeue();
    send(job, "out");

    // try to handle other waiting jobs as well
    while (!queue.isEmpty() && allocateResource(peek()))
    {
        Job *job = dequeue();
        send(job, "out");
    }
}

Job *Allocate::peek()
{
    return fifo ? (Job *)queue.front() : (Job *)queue.back();
}

Job *Allocate::dequeue()
{
    Job *job;
    if (fifo)
    {
        job = (Job *)queue.pop();
    }
    else
    {
        job = (Job *)queue.back();
        queue.remove(job);
    }

    lengthVector.record(queue.getLength());

    simtime_t dt = simTime() - job->getTimestamp();
    job->setTotalQueueingTime(job->getTotalQueueingTime() + dt);
    queueingTimeVector.record(dt);

    return job;
}

void Allocate::enqueueOrDrop(Job *job)
{
    // check for container capacity
    if (capacity >=0 && queue.getLength() >= capacity)
    {
        EV << "Capacity full! Job dropped.\n";
        if (hasGUI()) bubble("Dropped!");
        droppedVector.record(++numDropped);
        delete job;
        return;
    }
    else
    {
        EV << "Job enqueued.\n";
        job->setTimestamp();
        queue.insert(job);
        lengthVector.record(queue.getLength());
    }
}

}; //namespace


