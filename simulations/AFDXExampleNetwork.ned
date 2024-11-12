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

import afdx.Switch;
import afdx.EndSystem;
import afdx.Cable;
//
// TODO auto-generated module
//
network AFDXExampleNetwork
{
    double ethSpeed @unit(Mbps) = default(100Mbps);
    @display("bgb=1815.756,1308.234;i=block/network2");
    submodules:
        S1: Switch {
            @display("p=229,140");
            noOfPorts = 24;
            routingTableFile = "Switch1.txt";  // Especifica el archivo de enrutamiento a cargar
        }

        SECC1_COM: EndSystem {
            @display("p=72,103");
            trafficSource1.interArrivalTime = exponential(0.016s);
            trafficSource1.packetLength = 64;
            trafficSource1.virtualLinkId = intuniform(0x1000, 0x1300);
            trafficSource1.numJobs = -1; //Generar un número indefinido de jobs
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSink.destAddresses = "SECC1_MON";
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = exponential(0.008s);
            trafficSource1.stopTime = -1s; //No detener el tráfico
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
        }

        ECSC1_COM: EndSystem {
            @display("p=179,103");
            trafficSource1.interArrivalTime = uniform(0s, 0.001667s);//60000Hz
            trafficSource1.packetLength = 128;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.001667s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "ECSC1_MON";
            //614.4Kbps
        }
        ECSC1_MON: EndSystem {
            @display("p=218,103");
            trafficSource1.interArrivalTime = uniform(0s, 0.001667s);//60000Hz
            trafficSource1.packetLength = 128;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.001667s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "IOM";
            //614.4Kbps
        }
        SECC1_MON: EndSystem {
            @display("p=111,103");
            
            trafficSource1.interArrivalTime = exponential(0.008s);  // Tiempo entre llegadas de paquetes
            trafficSource1.packetLength = 64;  // Tamaño del paquete
            trafficSource1.virtualLinkId = intuniform(0x2000, 0x2500);  // Rango de VL IDs válidos basados en la tabla de enrutamiento
            trafficSource1.numJobs = -1;  // Generar un número indefinido de trabajos 
            trafficSource1.jobName = "job";  // Nombre de los trabajos
            trafficSource1.jobKind = intuniform(0, 3);  // Tipo de trabajo aleatorio
            trafficSource1.jobPriority = intuniform(0, 1);  // Prioridad aleatoria
            trafficSource1.startTime = exponential(0.008s);  // Tiempo de inicio aleatorio
            trafficSource1.stopTime = -1s;  // No detener el tráfico
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
        
            // Sink para recibir mensajes
            trafficSink.destAddresses = "ADIRU1";  // Enviar el tráfico generado a ADIRU1
            // 64kbps de tráfico
        }

        S11: Switch {
            @display("p=628,140");
            noOfPorts = 24;
        }
        ECGC1_COM: EndSystem {
            @display("p=271,103");
            trafficSource1.interArrivalTime = uniform(0s, 0.000833s);//120000Hz
            trafficSource1.packetLength = 256;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.000833s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "ECGC1_MON";
            //2.46Mbps
        }
         ECGC2_COM: EndSystem {
            @display("p=770,103");
            trafficSource1.interArrivalTime = uniform(0s,0.000833*1s);//120000Hz
            trafficSource1.packetLength = 256;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = exponential(0.000833s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "ECGC2_MON";
            //2.46Mbps

        }
        ECGC2_MON: EndSystem {
            @display("p=809,103");
            trafficSource1.interArrivalTime = uniform(0s,0.000833*1s);//120000Hz
            trafficSource1.packetLength = 256;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = exponential(0.000833s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "R1";
            //2.46Mbps
        }
        ECSC2_COM: EndSystem {
            @display("p=678,103");
            trafficSource1.interArrivalTime = uniform(0s,0.001667*1s);//60000Hz
            trafficSource1.packetLength = 128;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = exponential(0.001667s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "ECSC2_MON";
            //614.4Kbps
        }
        ECSC2_MON: EndSystem {
            @display("p=717,103");
            trafficSource1.interArrivalTime = uniform(0s,0.001667*1s);//60000Hz
            trafficSource1.packetLength = 128;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = exponential(0.001667s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "IOM_1";
            //614.4Kbps
        }
        ECGC1_MON: EndSystem {
            @display("p=310,103");
            trafficSource1.interArrivalTime = uniform(0s, 0.000833s);//120000Hz
            trafficSource1.packetLength = 256;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.000833s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "C1";
            //2.46Mbps
        }
        SECC2_COM: EndSystem {
            @display("p=571,103");
            trafficSource1.interArrivalTime = uniform(0s, 0.008s);//1250Hz
            trafficSource1.packetLength = 64;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.008s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "SECC2_MON";
            //64kbps
        }
        SECC2_MON: EndSystem {
            @display("p=610,103");
            trafficSource1.interArrivalTime = uniform(0s, 0.008s);//1250Hz
            trafficSource1.packetLength = 64;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.008s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "ADIRU2";
            //64kbps
        }
        ECGC3_COM: EndSystem {
            @display("p=397,103");
            trafficSource1.interArrivalTime = uniform(0s, 0.000833s);//12000Hz
            trafficSource1.packetLength = 256;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.000833s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "ECG3_MON";
            //2.46Mbps
        }
        ECGC3_MON: EndSystem {
            @display("p=436,103");
            trafficSource1.interArrivalTime = uniform(0s, 0.000833s);//12000Hz
            trafficSource1.packetLength = 256;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.000833s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "R1";
            //2.46Mbps
        }
        S111: Switch {
            @display("p=440,170");
            noOfPorts = 24;
        }
        ECSC3_COM: EndSystem {
            @display("p=475,103");
            trafficSource1.interArrivalTime = uniform(0s, 0.001667s);//6000Hz
            trafficSource1.packetLength = 128;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.001667s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "ECSC3_MON";
            //614.4Kbps
        }
        ECSC3_MON: EndSystem {
            @display("p=508,103");
            trafficSource1.interArrivalTime = uniform(0s, 0.001667s);//6000Hz
            trafficSource1.packetLength = 128;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.001667s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "ADIRU3";
            //614.4Kbps
        }
        IOM: EndSystem {
            @display("p=82,147");
            trafficSource1.interArrivalTime = uniform(0s, 0.00133s);//7500Hz
            trafficSource1.packetLength = 128;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.00133s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.keepJobs = false;
            trafficSink.destAddresses = "ADIRU1";
            //768Kbps
        }
        ADIRU1: EndSystem {//Genera
            @display("p=114,190");
            trafficSource1.interArrivalTime = uniform(0s, 0.005s);//2000Hz
            trafficSource1.packetLength = 64;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.005s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "FM1";
            //102.4Kbps
        }
        FM1: EndSystem {//Consume
            @display("p=160,202");
            trafficSink.keepJobs = false;
        }
        ADIRU3: EndSystem {//Genera
            @display("p=358,211");
            trafficSource1.interArrivalTime = uniform(0s, 0.005s);//2000Hz
            trafficSource1.packetLength = 64;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.005s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "FM3";
            //102.4Kbps
        }
        FM3: EndSystem {//Consume
            @display("p=497,211");
            trafficSink.keepJobs = false;
        }
        IOM_1: EndSystem {//Genera y Consume
            @display("p=699,158");
            trafficSource1.interArrivalTime = uniform(0s, 0.00133s);//7500Hz
            trafficSource1.packetLength = 128;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.00133s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.keepJobs = false;
            trafficSink.destAddresses = "ADIRU2";
            //768Kbps
        }
        ADIRU2: EndSystem {//Genera
            @display("p=656,202");
            trafficSource1.interArrivalTime = uniform(0s, 0.005s);//2000Hz
            trafficSource1.packetLength = 64;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.005s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "FM2";
            //102.4Kbps
        }
        FM2: EndSystem {//Consume
            @display("p=585,195");
            trafficSink.keepJobs = false;
        }
        L1: EndSystem {
            @display("p=218,246");
            trafficSink.keepJobs = false;
        }
        L2: EndSystem {
            @display("p=257,246");
            trafficSink.keepJobs = false;
        }
        CDAM: EndSystem {//Consume
            @display("p=440,401");
            trafficSink.keepJobs = false;
        }
        R1: EndSystem {
            @display("p=605,261");
            trafficSink.keepJobs = false;
        }
        R2: EndSystem {
            @display("p=575,261");
            trafficSink.keepJobs = false;
        }
        EEC1A: EndSystem {
            @display("p=29,220");
            trafficSource1.interArrivalTime = uniform(0s, 0.002s);//5000Hz
            trafficSource1.packetLength = 256;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.002s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "L1";
            //1.024Mbps
        }
        EEC1B: EndSystem {
            @display("p=29,236");
            trafficSource1.interArrivalTime = uniform(0s, 0.002s);//5000Hz
            trafficSource1.packetLength = 256;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.002s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "L1";
            //1.024Mbps
        }
        EEC2B: EndSystem {
            @display("p=29,286");
            trafficSource1.interArrivalTime = uniform(0s, 0.002s);//5000Hz
            trafficSource1.packetLength = 256;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.002s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "R1";
            //1.024Mbps
        }
        EEC2A: EndSystem {
            @display("p=29,322");
            trafficSource1.interArrivalTime = uniform(0s, 0.002s);//5000Hz
            trafficSource1.packetLength = 256;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.002s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "R1";
            //1.024Mbps
        }
        EEC3B: EndSystem {
            @display("p=813,220");
            trafficSource1.interArrivalTime = uniform(0s, 0.002s);//5000Hz
            trafficSource1.packetLength = 256;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.002s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "L2";
            //1.024Mbps
        }
        EEC3A: EndSystem {
            @display("p=813,236");
            trafficSource1.interArrivalTime = uniform(0s, 0.002s);//5000Hz
            trafficSource1.packetLength = 256;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.002s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "L2";
            //1.024Mbps
        }
        EEC4B: EndSystem {
            @display("p=813,322");
            trafficSource1.interArrivalTime = uniform(0s, 0.002s);//5000Hz
            trafficSource1.packetLength = 256;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.002s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "R2";
            //1.024Mbps
        }
        EEC4A: EndSystem {
            @display("p=813,286");
            trafficSource1.interArrivalTime = uniform(0s, 0.002s);//5000Hz
            trafficSource1.packetLength = 256;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.002s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "R2";
            //1.024Mbps
        }
        S2: Switch {
            @display("p=229,381");
            noOfPorts = 24;
        }
        S22: Switch {
            @display("p=642,381");
            noOfPorts = 24;
        }
        C1: EndSystem {
            @display("p=440,261");
            trafficSink.keepJobs = false;
        }
        C2: EndSystem {
            @display("p=440,311");
            trafficSink.keepJobs = false;
        }
        R3: EndSystem {
            @display("p=485,311");
            trafficSink.keepJobs = false;
        }
        L3: EndSystem {
            @display("p=386,311");
            trafficSink.keepJobs = false;
        }
        ATC1: EndSystem {//Consume
            @display("p=272,304");
            trafficSink.keepJobs = false;
        }
        ACR1: EndSystem {//Consume
            @display("p=218,304");
            trafficSink.keepJobs = false;
        }
        FW1: EndSystem {//Consume
            @display("p=121,322");
            trafficSink.keepJobs = false;
        }
        FCDC1: EndSystem {//Consume
            @display("p=81,360");
            trafficSink.keepJobs = false;
        }
        AESU1: EndSystem {
            @display("p=87,393");
            trafficSink.keepJobs = false;
        }
        IOM_2: EndSystem {//Genera y Consume
            @display("p=117,424");
            trafficSource1.interArrivalTime = uniform(0s, 0.00133s);//7500Hz
            trafficSource1.packetLength = 128;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.00133s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.keepJobs = false;
            trafficSink.destAddresses = "IOM_3";
            //768Kbps
        }
        SCI: EndSystem {//Genera
            @display("p=160,429");
            trafficSource1.interArrivalTime = uniform(0s, 0.005s);//2000Hz
            trafficSource1.packetLength = 128;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.005s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "ATC2";
            //204.8Kbps
        }
        ACR2: EndSystem {
            @display("p=629,309");
            trafficSink.keepJobs = false;
        }
        ATC2: EndSystem {
            @display("p=679,311");
            trafficSink.keepJobs = false;
        }
        FW2: EndSystem {
            @display("p=719,348");
            trafficSink.keepJobs = false;
        }
        FCDC2: EndSystem {
            @display("p=747,373");
            trafficSink.keepJobs = false;
        }
        AESU2: EndSystem {
            @display("p=740,409");
            trafficSink.keepJobs = false;
        }
        IOM_3: EndSystem {//Genera y Conusme
            @display("p=679,420");
            trafficSource1.interArrivalTime = uniform(0s, 0.00133s);//7500Hz
            trafficSource1.packetLength = 128;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.00133s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.keepJobs = false;
            trafficSink.destAddresses = "ATC1";
            //768Kbps
        }
        SCI_1: EndSystem {
            @display("p=608,427");
            trafficSource1.interArrivalTime = uniform(0s, 0.005s);//2000Hz
            trafficSource1.packetLength = 128;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.005s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.destAddresses = "ELM";
            //204.8Kbps
        }
        S3: Switch {
            @display("p=213,547");
            noOfPorts = 24;
        }
        S33: Switch {
            @display("p=642,547");
            noOfPorts = 24;
        }
        ELM: EndSystem {//Consume
            @display("p=257,463");
            trafficSink.keepJobs = false;
        }
        HSM: EndSystem {//Consume
            @display("p=290,488");
            trafficSink.keepJobs = false;
        }
        ECB: EndSystem {
            @display("p=282,533");
            trafficSource1.interArrivalTime = uniform(0s, 0.00133s);//7500Hz
            trafficSource1.packetLength = 64;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.00133s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.keepJobs = false;
            trafficSink.destAddresses = "PWCU";
            //384Kbps
        }
        CIDS: EndSystem {
            @display("p=264,588");
            trafficSink.keepJobs = false;
        }
        PWCU: EndSystem {
            @display("p=164,616");
            trafficSink.keepJobs = false;
        }
        IRDC: EndSystem {
            @display("p=74,592");
            trafficSink.keepJobs = false;
        }
        LGTRRS_COM: EndSystem {
            @display("p=31,532");
            trafficSink.keepJobs = false;
        }
        LGTRRS_MON: EndSystem {
            @display("p=42,513");
            trafficSink.keepJobs = false;
        }
        Fuel_COM: EndSystem {
            @display("p=84,477");
            trafficSink.keepJobs = false;
        }
        Fuel_Mon: EndSystem {
            @display("p=114,477");
            trafficSink.keepJobs = false;
        }
        HSM_1: EndSystem {
            @display("p=573,478");
            trafficSink.keepJobs = false;
        }
        ELM_1: EndSystem {
            @display("p=614,477");
            trafficSink.keepJobs = false;
        }
        Fuel_COM1: EndSystem {
            @display("p=682,477");
            trafficSink.keepJobs = false;
        }
        Fuel_MON1: EndSystem {
            @display("p=708,478");
            trafficSink.keepJobs = false;
        }
        LGTRRS_COM1: EndSystem {
            @display("p=774,487");
            trafficSink.keepJobs = false;
        }
        LGTRRS_MON1: EndSystem {
            @display("p=804,488");
            trafficSink.keepJobs = false;
        }
        IRDC_1: EndSystem {
            @display("p=817,546");
            trafficSink.keepJobs = false;
        }
        extlights: EndSystem {
            @display("p=501,515");
            trafficSink.keepJobs = false;
        }
        CIDS_1: EndSystem {
            @display("p=546,561");
            trafficSink.keepJobs = false;
        }
        PESC: EndSystem {
            @display("p=572,594");
            trafficSink.keepJobs = false;
        }
        S4: Switch {
            @display("p=213,690");
            noOfPorts = 24;
        }
        S44: Switch {
            @display("p=642,690");
            noOfPorts = 24;
        }
        IPCU: EndSystem {
            @display("p=254,636");
            trafficSource1.interArrivalTime = uniform(0s, 0.005s);//2000Hz
            trafficSource1.packetLength = 64;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.005s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.keepJobs = false;
            trafficSink.destAddresses = "IPCU_1";
            //102.4Kbps
        }
        DSMC12: EndSystem {
            @display("p=266,732");
            trafficSink.keepJobs = false;
        }
        CPIOMB12: EndSystem {
            @display("p=188,763");
            trafficSink.keepJobs = false;
        }
        CPIOMA12: EndSystem {
            @display("p=126,763");
            trafficSink.keepJobs = false;
        }
        SPDB: EndSystem {
            @display("p=68,732");
            trafficSource1.interArrivalTime = uniform(0s, 0.01s);//1000Hz
            trafficSource1.packetLength = 64;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.01s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.keepJobs = false;
            trafficSink.destAddresses = "SPDB_1";
            //51.2kbps
        }
        VSC: EndSystem {
            @display("p=67,670");
            trafficSink.keepJobs = false;
        }
        IPCU_1: EndSystem {
            @display("p=713,625");
            trafficSource1.interArrivalTime = uniform(0s, 0.005s);//2000Hz
            trafficSource1.packetLength = 64;
            trafficSource1.virtualLinkId = intuniform(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.005s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.keepJobs = false;
            trafficSink.destAddresses = "VSC";
            //102.4Kbps
        }
        SPDB_1: EndSystem {
            @display("p=754,683");
            trafficSource1.interArrivalTime = exponential(0.01s);//1000Hz
            trafficSource1.packetLength = 64;
            trafficSource1.virtualLinkId = exponential(0, 3);
            trafficSource1.numJobs = -1;
            trafficSource1.jobName = "job";
            trafficSource1.jobKind = intuniform(0, 3);
            trafficSource1.jobPriority = intuniform(0, 1);
            trafficSource1.startTime = uniform(0s, 0.01s);
            trafficSource1.stopTime = -1s;
            trafficSource1.networkId = 0;
            trafficSource1.equipmentId = 0;
            trafficSource1.interfaceId = 0;
            trafficSource1.seqNum = 0;
            trafficSource1.partitionId = 0;
            trafficSource1.udpSrcPort = 1234;
            trafficSource1.udpDestPort = 5678;
            trafficSink.keepJobs = false;
            trafficSink.destAddresses = "CPIOMA12";
            //51.2kbps
        }
        CPIOMB34: EndSystem {
            @display("p=726,738");
            trafficSink.keepJobs = false;
        }
        CPIOMA34: EndSystem {
            @display("p=620,768");
            trafficSink.keepJobs = false;
        }
        DSMC: EndSystem {
            @display("p=536,720");
            trafficSink.keepJobs = false;
        }


    connections allowunconnected:
        SECC1_COM.ethPortA <--> Cable {  datarate = ethSpeed; length = 3m; } <--> S1.ethPort[1];
ECSC1_COM.ethPortA <--> Cable {  datarate = ethSpeed; length = 3m; } <--> S1.ethPort[3];
ECSC1_MON.ethPortA <--> Cable {  datarate = ethSpeed; length = 3m; } <--> S1.ethPort[4];
ECGC1_COM.ethPortA <--> Cable {  datarate = ethSpeed; length = 3m; } <--> S1.ethPort[5];
ECGC1_MON.ethPortB <--> Cable {  datarate = ethSpeed; length = 3m; } <--> S1.ethPort[6];
SECC2_COM.ethPortA <--> Cable {  datarate = ethSpeed; length = 3m; } <--> S11.ethPort[1];
ECSC2_COM.ethPortA <--> Cable {  datarate = ethSpeed; length = 3m; } <--> S11.ethPort[3];
ECSC2_MON.ethPortA <--> Cable {  datarate = ethSpeed; length = 3m; } <--> S11.ethPort[4];
ECGC2_COM.ethPortA <--> Cable {  datarate = ethSpeed; length = 3m; } <--> S11.ethPort[5];
ECGC2_MON.ethPortA <--> Cable {  datarate = ethSpeed; length = 3m; } <--> S11.ethPort[6];
S1.ethPort[7] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> S111.ethPort[0];
S111.ethPort[1] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> S11.ethPort[8];
ECGC3_COM.ethPortA <--> Cable {  datarate = ethSpeed; length = 3m; } <--> S111.ethPort[2];
ECGC3_MON.ethPortA <--> Cable {  datarate = ethSpeed; length = 3m; } <--> S111.ethPort[3];
ECSC3_COM.ethPortA <--> Cable {  datarate = ethSpeed; length = 3m; } <--> S111.ethPort[4];
ECSC3_MON.ethPortA <--> Cable {  datarate = ethSpeed; length = 3m; } <--> S111.ethPort[5];
IOM.ethPortA <--> Cable {  datarate = ethSpeed; length = 5m; } <--> S1.ethPort[8];
IOM.ethPortB <--> Cable {  datarate = ethSpeed; length = 5m; } <--> S1.ethPort[9];
ADIRU1.ethPortA <--> Cable {  datarate = ethSpeed; length = 5m; } <--> S1.ethPort[10];
FM1.ethPortA <--> Cable {  datarate = ethSpeed; length = 5m; } <--> S1.ethPort[11];
S111.ethPort[6] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> ADIRU3.ethPortA;
S111.ethPort[7] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> FM3.ethPortA;
S11.ethPort[9] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> IOM_1.ethPortA;
S11.ethPort[10] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> IOM_1.ethPortB;
S11.ethPort[11] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> ADIRU2.ethPortA;
S11.ethPort[12] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> FM2.ethPortA;
S1.ethPort[12] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> L1.ethPortA;
S1.ethPort[13] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> L2.ethPortA;
S1.ethPort[14] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> CDAM.ethPortA;
CDAM.ethPortB <--> Cable {  datarate = ethSpeed; length = 5m; } <--> S111.ethPort[8];
CDAM.ethPortC <--> Cable {  datarate = ethSpeed; length = 5m; } <--> S11.ethPort[13];
R1.ethPortA <--> Cable {  datarate = ethSpeed; length = 5m; } <--> S11.ethPort[14];
R2.ethPortA <--> Cable {  datarate = ethSpeed; length = 5m; } <--> S11.ethPort[15];
EEC1A.ethPortA <--> Cable {  datarate = ethSpeed; length = 20m; } <--> S1.ethPort[15];
EEC2B.ethPortA <--> Cable {  datarate = ethSpeed; length = 20m; } <--> S11.ethPort[16];
EEC3A.ethPortA <--> Cable {  datarate = ethSpeed; length = 20m; } <--> S1.ethPort[16];
EEC4B.ethPortA <--> Cable {  datarate = ethSpeed; length = 20m; } <--> S11.ethPort[17];
S2.ethPort[20] <--> Cable {  datarate = ethSpeed; length = 30m; } <--> S22.ethPort[0];
S2.ethPort[1] <--> Cable {  datarate = ethSpeed; length = 30m; } <--> S1.ethPort[17];
S2.ethPort[3] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> ACR1.ethPortA;
S2.ethPort[4] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> FW1.ethPortA;
S2.ethPort[5] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> FCDC1.ethPortA;
S2.ethPort[6] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> AESU1.ethPortA;
S2.ethPort[7] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> IOM_2.ethPortA;
S2.ethPort[8] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> IOM_2.ethPortB;
S2.ethPort[9] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> SCI.ethPortA;
S2.ethPort[10] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> CDAM.ethPortD;
S2.ethPort[11] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> L3.ethPortA;
S2.ethPort[12] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> C1.ethPortA;
S2.ethPort[13] <--> Cable {  datarate = ethSpeed; length = 15m; } <--> EEC2A.ethPortA;
S2.ethPort[14] <--> Cable {  datarate = ethSpeed; length = 15m; } <--> EEC4A.ethPortA;
S22.ethPort[1] <--> Cable {  datarate = ethSpeed; length = 30m; } <--> S111.ethPort[17];
S22.ethPort[2] <--> Cable {  datarate = ethSpeed; length = 30m; } <--> S11.ethPort[18];
S22.ethPort[3] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> ACR2.ethPortA;
S22.ethPort[4] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> ATC2.ethPortA;
S22.ethPort[5] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> FW2.ethPortA;
S22.ethPort[6] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> FCDC2.ethPortA;
S22.ethPort[7] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> AESU2.ethPortA;
S22.ethPort[8] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> IOM_3.ethPortA;
S22.ethPort[9] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> IOM_3.ethPortB;
S22.ethPort[10] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> SCI_1.ethPortA;
EEC3B.ethPortA <--> Cable {  datarate = ethSpeed; length = 15m; } <--> S22.ethPort[11];
S22.ethPort[12] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> R3.ethPortA;
S22.ethPort[13] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> C2.ethPortA;
S22.ethPort[14] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> CDAM.ethPortE;
S3.ethPort[0] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> S2.ethPort[15];
S3.ethPort[1] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> S33.ethPort[0];
S3.ethPort[2] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> ELM.ethPortA;
S3.ethPort[3] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> HSM.ethPortA;
S3.ethPort[4] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> ECB.ethPortA;
S3.ethPort[5] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> CIDS.ethPortA;
S3.ethPort[6] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> PWCU.ethPortA;
S3.ethPort[7] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> IRDC.ethPortA;
S3.ethPort[8] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> IRDC.ethPortB;
S3.ethPort[9] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> IRDC.ethPortC;
S3.ethPort[10] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> LGTRRS_MON.ethPortA;
S3.ethPort[11] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> LGTRRS_COM.ethPortA;
S3.ethPort[12] <--> Cable {  datarate = ethSpeed; length = 15m; } <--> Fuel_Mon.ethPortA;
S3.ethPort[13] <--> Cable {  datarate = ethSpeed; length = 15m; } <--> Fuel_COM.ethPortA;
S3.ethPort[14] <--> Cable {  datarate = ethSpeed; length = 7m; } <--> CDAM.ethPortF;
S33.ethPort[1] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> S22.ethPort[15];
S33.ethPort[2] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> HSM_1.ethPortA;
S33.ethPort[3] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> ELM_1.ethPortA;
S33.ethPort[4] <--> Cable {  datarate = ethSpeed; length = 15m; } <--> Fuel_COM1.ethPortA;
S33.ethPort[5] <--> Cable {  datarate = ethSpeed; length = 15m; } <--> Fuel_MON1.ethPortA;
S33.ethPort[6] <--> Cable {  datarate = ethSpeed; length = 7m; } <--> LGTRRS_COM1.ethPortA;
S33.ethPort[7] <--> Cable {  datarate = ethSpeed; length = 7m; } <--> LGTRRS_MON1.ethPortA;
S33.ethPort[8] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> IRDC_1.ethPortA;
S33.ethPort[9] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> IRDC_1.ethPortB;
S33.ethPort[10] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> IRDC_1.ethPortC;
S33.ethPort[11] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> PESC.ethPortA;
S33.ethPort[12] <--> Cable {  datarate = ethSpeed; length = 7m; } <--> CIDS_1.ethPortA;
S33.ethPort[13] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> extlights.ethPortA;
S33.ethPort[14] <--> Cable {  datarate = ethSpeed; length = 7m; } <--> CDAM.ethPortH;
S4.ethPort[0] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> S3.ethPort[15];
S4.ethPort[1] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> S44.ethPort[0];
S4.ethPort[2] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> IPCU.ethPortA;
S4.ethPort[3] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> IPCU.ethPortB;
S4.ethPort[4] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> DSMC12.ethPortA;
S4.ethPort[5] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> DSMC12.ethPortB;
S4.ethPort[6] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> CPIOMB12.ethPortA;
S4.ethPort[7] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> CPIOMB12.ethPortB;
S4.ethPort[8] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> CPIOMA12.ethPortA;
S4.ethPort[9] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> CPIOMA12.ethPortB;
S4.ethPort[10] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> SPDB.ethPortA;
S4.ethPort[11] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> SPDB.ethPortB;
S4.ethPort[12] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> SPDB.ethPortC;
S4.ethPort[13] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> SPDB.ethPortD;
S4.ethPort[14] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> VSC.ethPortA;
S4.ethPort[15] <--> Cable {  datarate = ethSpeed; length = 7m; } <--> CDAM.ethPortI;
S44.ethPort[1] <--> Cable {  datarate = ethSpeed; length = 7m; } <--> CDAM.ethPortAA;
S44.ethPort[2] <--> Cable {  datarate = ethSpeed; length = 10m; } <--> S33.ethPort[15];
S44.ethPort[3] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> IPCU_1.ethPortA;
S44.ethPort[4] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> IPCU_1.ethPortAA;
S44.ethPort[5] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> IPCU_1.ethPortB;
S44.ethPort[6] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> SPDB_1.ethPortA;
S44.ethPort[7] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> SPDB_1.ethPortAA;
S44.ethPort[8] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> SPDB_1.ethPortB;
S44.ethPort[9] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> SPDB_1.ethPortC;
S44.ethPort[10] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> SPDB_1.ethPortD;
S44.ethPort[11] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> CPIOMB34.ethPortA;
S44.ethPort[12] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> CPIOMB34.ethPortAA;
S44.ethPort[13] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> CPIOMA34.ethPortA;
S44.ethPort[14] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> CPIOMA34.ethPortAA;
S44.ethPort[15] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> DSMC.ethPortA;
S1.ethPort[0] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> S11.ethPort[20];
S2.ethPort[2] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> ATC1.ethPortA;
S11.ethPort[7] <--> Cable {  datarate = ethSpeed; length = 5m; } <--> SECC2_MON.ethPortA;
}
