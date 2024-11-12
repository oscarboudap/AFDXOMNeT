package afdx;

simple UtilizationTracker
{
    parameters:
        int noOfPorts;
        double ethSpeed @unit(Mbps); // velocidad de la interfaz
    gates:
        inout ethPort[noOfPorts] @labels(eth100);
}
