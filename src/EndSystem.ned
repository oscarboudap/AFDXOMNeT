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

import afdx.queueinglib.PassiveQueue;
import afdx.queueinglib.Sink;


//
// This module represents an EndSystem device in an AFDX network. It has two 
// separate ethernet interfaces which should be attached to different networks
//
module EndSystem
{
    @display("i=device/device;bgb=728,464");
    gates:
        inout ethPortA @labels(eth100);
        inout ethPortB @labels(eth100);
        inout ethPortC @labels(eth100);
        inout ethPortD @labels(eth100);
        inout ethPortE @labels(eth100);
        inout ethPortF @labels(eth100);
        inout ethPortAA @labels(eth100);
        inout ethPortH @labels(eth100);
        inout ethPortI @labels(eth100);
    submodules:
        trafficSource1: AFDXMessageSource {
            @display("p=59,44");
        }
        trafficSink: AFDXMessageSink {
            @display("p=59,228");
        }
        macB: MAC {
            @display("p=450,189");
        }
        macA: MAC {
            @display("p=450,119");
        }
        macC: MAC {
            @display("p=450,259");
        }
        macD: MAC {
            @display("p=450,329");
        }
        macE: MAC {
            @display("p=450,399");
        }
        macF: MAC {
            @display("p=450,469");
        }
        macAA: MAC {
            @display("p=450,469");
        }
        macH: MAC {
            @display("p=450,539");
        }
        macI: MAC {
            @display("p=450,609");
        }
        txQueueA: PassiveQueue {
            @display("p=356,44");
        }
        txQueueB: PassiveQueue {
            @display("p=356,119");
        }
        txQueueC: PassiveQueue {
            @display("p=356,189");
        }
        txQueueD: PassiveQueue {
            @display("p=356,259");
        }
        txQueueE: PassiveQueue {
            @display("p=356,329");
        }
        txQueueF: PassiveQueue {
            @display("p=356,399");
        }
        txQueueAA: PassiveQueue {
            @display("p=356,399");
        }
        txQueueH: PassiveQueue {
            @display("p=356,469");
        }
        txQueueI: PassiveQueue {
            @display("p=356,539");
        }
        integrityCheckerA: IntegrityChecker {
            @display("p=356,189");
        }
        integrityCheckerB: IntegrityChecker {
            @display("p=356,257");
        }
        integrityCheckerC: IntegrityChecker {
            @display("p=356,329");
        }
        integrityCheckerD: IntegrityChecker {
            @display("p=356,399");
        }
        integrityCheckerE: IntegrityChecker {
            @display("p=356,469");
        }
        integrityCheckerF: IntegrityChecker {
            @display("p=356,539");
        }
        integrityCheckerAA: IntegrityChecker {
            @display("p=356,539");
        }
        integrityCheckerH: IntegrityChecker {
            @display("p=356,609");
        }
        integrityCheckerI: IntegrityChecker {
            @display("p=356,679");
        }
        regulatorLogic: RegulatorLogic {
            @display("p=155,44");
        }
        redundancyChecker: RedundancyChecker {
            @display("p=242,228");
        }
        redundancyController: RedundancyController {
            @display("p=254,83");
        }
    connections:
        ethPortA <--> macA.eth;
        ethPortB <--> macB.eth;
        ethPortC <--> macC.eth;
        ethPortD <--> macD.eth;
        ethPortE <--> macE.eth;
        ethPortF <--> macF.eth;
        ethPortAA <--> macAA.eth;
        ethPortH <--> macH.eth;
        ethPortI <--> macI.eth;
        txQueueA.out++ --> macA.in++;
        txQueueB.out++ --> macB.in++;
        txQueueC.out++ --> macC.in++;
        txQueueD.out++ --> macD.in++;
        txQueueE.out++ --> macE.in++;
        txQueueF.out++ --> macF.in++;
        txQueueAA.out++ --> macAA.in++;
        txQueueH.out++ --> macH.in++;
        txQueueI.out++ --> macI.in++;
        macA.out --> integrityCheckerA.in;
        macB.out --> integrityCheckerB.in;
        macC.out --> integrityCheckerC.in;
        macD.out --> integrityCheckerD.in;
        macE.out --> integrityCheckerE.in;
        macF.out --> integrityCheckerF.in;
        macAA.out --> integrityCheckerAA.in;
        macH.out --> integrityCheckerH.in;
        macI.out --> integrityCheckerI.in;
        integrityCheckerA.out --> redundancyChecker.inA;
        integrityCheckerB.out --> redundancyChecker.inB;
        integrityCheckerC.out --> redundancyChecker.inC;
        integrityCheckerD.out --> redundancyChecker.inD;
        integrityCheckerE.out --> redundancyChecker.inE;
        integrityCheckerF.out --> redundancyChecker.inF;
        integrityCheckerAA.out --> redundancyChecker.inAA;
        integrityCheckerH.out --> redundancyChecker.inH;
        integrityCheckerI.out --> redundancyChecker.inI;
        trafficSource1.out --> regulatorLogic.in;
        redundancyChecker.out --> trafficSink.in++;
        regulatorLogic.out --> redundancyController.in++;
        redundancyController.outA --> txQueueA.in++;
        redundancyController.outB --> txQueueB.in++;
        redundancyController.outC --> txQueueC.in++;
        redundancyController.outD --> txQueueD.in++;
        redundancyController.outE --> txQueueE.in++;
        redundancyController.outF --> txQueueF.in++;
        redundancyController.outAA --> txQueueAA.in++;
        redundancyController.outH --> txQueueH.in++;
        redundancyController.outI --> txQueueI.in++;
}
