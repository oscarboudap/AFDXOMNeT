#include "VLRouter.h"
#include "AFDXMessage_m.h"
#include <map>
#include <vector>
#include <fstream>
#include <sstream>
#include <iostream>

namespace afdx {

Define_Module(VLRouter);

// Tabla de enrutamiento: asocia cada VL ID con un vector de índices de las puertas de salida
std::map<int, std::vector<int>> routingTable;

// Función para cargar la tabla de enrutamiento desde un archivo
void VLRouter::loadRoutingTable(const std::string& filename)
{
    std::ifstream file(filename);
    if (!file.is_open()) {
        EV_ERROR << "No se pudo abrir el archivo de enrutamiento: " << filename << "\n";
        return;
    }

    std::string line;
    while (std::getline(file, line)) {
        // Cada línea tiene el formato "0xXXXX : {N, M, ...}"
        std::istringstream iss(line);
        std::string vlIdStr, portsStr;

        // Parsear el VL ID
        if (!(iss >> vlIdStr)) {
            continue; // Saltar líneas mal formadas
        }

        int vlId = std::stoi(vlIdStr, nullptr, 16); // Convertir el VL ID de hex a int

        // Buscar los puertos entre llaves
        size_t pos = line.find('{');
        if (pos != std::string::npos) {
            portsStr = line.substr(pos + 1, line.find('}') - pos - 1);

            // Separar los puertos y agregarlos al vector
            std::vector<int> outputGates;
            std::istringstream portsStream(portsStr);
            std::string port;

            while (std::getline(portsStream, port, ',')) {
                outputGates.push_back(std::stoi(port));
            }

            // Agregar a la tabla de enrutamiento
            routingTable[vlId] = outputGates;
        }
    }

    file.close();
}

void VLRouter::initialize()
{
    // Cargar la tabla de enrutamiento desde un archivo
    const char* filename = par("routingFile").stringValue();
    loadRoutingTable(filename);
}

void VLRouter::handleMessage(cMessage *msg)
{
    AFDXMessage *afdxMsg = check_and_cast<AFDXMessage *>(msg);

    int vlId = afdxMsg->getVirtualLinkId();
    EV_INFO << "VL ID: 0x" << std::hex << vlId << std::dec << "\n"; // Imprimir el valor de vlId en la consola

    // Buscar el VL ID en la tabla de enrutamiento
    auto it = routingTable.find(vlId);
    if (it != routingTable.end()) {
        // Obtener las puertas de salida correspondientes al VL ID
        const std::vector<int>& outputGates = it->second;

        // Enviar el mensaje a cada una de las puertas de salida especificadas en la tabla
        for (int gateIndex : outputGates) {
            // Crear una copia del mensaje para cada puerta de salida
            send((cMessage *)afdxMsg->dup(), "out", gateIndex);
        }
    } else {
        EV_WARN << "VL ID no encontrado en la tabla de enrutamiento. Descartando el mensaje.\n";
    }

    // Eliminar el mensaje original para evitar fugas de memoria
    delete afdxMsg;
}

}; // namespace afdx
