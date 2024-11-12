//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package afdx;

// A channel representing a twisted pair 100MBps ethernet line
channel Eth100 extends ned.DatarateChannel
{
    @labels(eth100);
    @display("ls=blue");
    datarate = 100Mbps;
}

// Represents an AFDX switch
module Switch
{
    @display("i=device/router");
    int noOfPorts = default(24);
        @signal[statusSignal];
        @statistic[statusChanged];
    gates:
        inout ethPort[noOfPorts] @labels(eth100);
    submodules:
        switchPort[noOfPorts]: SwitchPort {
            @display("p=70,70,ri,180");
        }
        switchFabric: SwitchFabric {
            @display("p=250,250");
            gates:
                port[noOfPorts];
        }
    connections allowunconnected:
        for i=0..noOfPorts-1 {
            ethPort[i] <--> switchPort[i].ethPort;
            switchPort[i].toFabric <--> switchFabric.port[i];
        }
}
