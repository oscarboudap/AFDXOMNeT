package afdx;

channel Cable extends ned.DatarateChannel
{
    @display("ls=blue");
    @labels(Cable);
    double length @unit(km) = default(0km);
    delay = replaceUnit(length / 2e8, "s"); //2e8m/s -> wave propogation speed
}