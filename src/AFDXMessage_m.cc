//
// Generated file, do not edit! Created by nedtool 5.6 from AFDXMessage.msg.
//

// Disable warnings about unused variables, empty switch stmts, etc:
#ifdef _MSC_VER
#  pragma warning(disable:4101)
#  pragma warning(disable:4065)
#endif

#if defined(__clang__)
#  pragma clang diagnostic ignored "-Wshadow"
#  pragma clang diagnostic ignored "-Wconversion"
#  pragma clang diagnostic ignored "-Wunused-parameter"
#  pragma clang diagnostic ignored "-Wc++98-compat"
#  pragma clang diagnostic ignored "-Wunreachable-code-break"
#  pragma clang diagnostic ignored "-Wold-style-cast"
#elif defined(__GNUC__)
#  pragma GCC diagnostic ignored "-Wshadow"
#  pragma GCC diagnostic ignored "-Wconversion"
#  pragma GCC diagnostic ignored "-Wunused-parameter"
#  pragma GCC diagnostic ignored "-Wold-style-cast"
#  pragma GCC diagnostic ignored "-Wsuggest-attribute=noreturn"
#  pragma GCC diagnostic ignored "-Wfloat-conversion"
#endif

#include <iostream>
#include <sstream>
#include "AFDXMessage_m.h"

namespace omnetpp {

// Template pack/unpack rules. They are declared *after* a1l type-specific pack functions for multiple reasons.
// They are in the omnetpp namespace, to allow them to be found by argument-dependent lookup via the cCommBuffer argument

// Packing/unpacking an std::vector
template<typename T, typename A>
void doParsimPacking(omnetpp::cCommBuffer *buffer, const std::vector<T,A>& v)
{
    int n = v.size();
    doParsimPacking(buffer, n);
    for (int i = 0; i < n; i++)
        doParsimPacking(buffer, v[i]);
}

template<typename T, typename A>
void doParsimUnpacking(omnetpp::cCommBuffer *buffer, std::vector<T,A>& v)
{
    int n;
    doParsimUnpacking(buffer, n);
    v.resize(n);
    for (int i = 0; i < n; i++)
        doParsimUnpacking(buffer, v[i]);
}

// Packing/unpacking an std::list
template<typename T, typename A>
void doParsimPacking(omnetpp::cCommBuffer *buffer, const std::list<T,A>& l)
{
    doParsimPacking(buffer, (int)l.size());
    for (typename std::list<T,A>::const_iterator it = l.begin(); it != l.end(); ++it)
        doParsimPacking(buffer, (T&)*it);
}

template<typename T, typename A>
void doParsimUnpacking(omnetpp::cCommBuffer *buffer, std::list<T,A>& l)
{
    int n;
    doParsimUnpacking(buffer, n);
    for (int i=0; i<n; i++) {
        l.push_back(T());
        doParsimUnpacking(buffer, l.back());
    }
}

// Packing/unpacking an std::set
template<typename T, typename Tr, typename A>
void doParsimPacking(omnetpp::cCommBuffer *buffer, const std::set<T,Tr,A>& s)
{
    doParsimPacking(buffer, (int)s.size());
    for (typename std::set<T,Tr,A>::const_iterator it = s.begin(); it != s.end(); ++it)
        doParsimPacking(buffer, *it);
}

template<typename T, typename Tr, typename A>
void doParsimUnpacking(omnetpp::cCommBuffer *buffer, std::set<T,Tr,A>& s)
{
    int n;
    doParsimUnpacking(buffer, n);
    for (int i=0; i<n; i++) {
        T x;
        doParsimUnpacking(buffer, x);
        s.insert(x);
    }
}

// Packing/unpacking an std::map
template<typename K, typename V, typename Tr, typename A>
void doParsimPacking(omnetpp::cCommBuffer *buffer, const std::map<K,V,Tr,A>& m)
{
    doParsimPacking(buffer, (int)m.size());
    for (typename std::map<K,V,Tr,A>::const_iterator it = m.begin(); it != m.end(); ++it) {
        doParsimPacking(buffer, it->first);
        doParsimPacking(buffer, it->second);
    }
}

template<typename K, typename V, typename Tr, typename A>
void doParsimUnpacking(omnetpp::cCommBuffer *buffer, std::map<K,V,Tr,A>& m)
{
    int n;
    doParsimUnpacking(buffer, n);
    for (int i=0; i<n; i++) {
        K k; V v;
        doParsimUnpacking(buffer, k);
        doParsimUnpacking(buffer, v);
        m[k] = v;
    }
}

// Default pack/unpack function for arrays
template<typename T>
void doParsimArrayPacking(omnetpp::cCommBuffer *b, const T *t, int n)
{
    for (int i = 0; i < n; i++)
        doParsimPacking(b, t[i]);
}

template<typename T>
void doParsimArrayUnpacking(omnetpp::cCommBuffer *b, T *t, int n)
{
    for (int i = 0; i < n; i++)
        doParsimUnpacking(b, t[i]);
}

// Default rule to prevent compiler from choosing base class' doParsimPacking() function
template<typename T>
void doParsimPacking(omnetpp::cCommBuffer *, const T& t)
{
    throw omnetpp::cRuntimeError("Parsim error: No doParsimPacking() function for type %s", omnetpp::opp_typename(typeid(t)));
}

template<typename T>
void doParsimUnpacking(omnetpp::cCommBuffer *, T& t)
{
    throw omnetpp::cRuntimeError("Parsim error: No doParsimUnpacking() function for type %s", omnetpp::opp_typename(typeid(t)));
}

}  // namespace omnetpp

namespace afdx {

// forward
template<typename T, typename A>
std::ostream& operator<<(std::ostream& out, const std::vector<T,A>& vec);

// Template rule which fires if a struct or class doesn't have operator<<
template<typename T>
inline std::ostream& operator<<(std::ostream& out,const T&) {return out;}

// operator<< for std::vector<T>
template<typename T, typename A>
inline std::ostream& operator<<(std::ostream& out, const std::vector<T,A>& vec)
{
    out.put('{');
    for(typename std::vector<T,A>::const_iterator it = vec.begin(); it != vec.end(); ++it)
    {
        if (it != vec.begin()) {
            out.put(','); out.put(' ');
        }
        out << *it;
    }
    out.put('}');
    
    char buf[32];
    sprintf(buf, " (size=%u)", (unsigned int)vec.size());
    out.write(buf, strlen(buf));
    return out;
}

Register_Class(AFDXMessage)

AFDXMessage::AFDXMessage(const char *name, short kind) : ::queueing::Job(name,kind)
{
    this->networkId = 0;
    this->equipmentId = 0;
    this->interfaceId = 0;
    this->virtualLinkId = 0;
    this->seqNum = 0;
    this->partitionId = 0;
    this->udpSrcPort = 0;
    this->udpDestPort = 0;
}

AFDXMessage::AFDXMessage(const AFDXMessage& other) : ::queueing::Job(other)
{
    copy(other);
}

AFDXMessage::~AFDXMessage()
{
}

AFDXMessage& AFDXMessage::operator=(const AFDXMessage& other)
{
    if (this==&other) return *this;
    ::queueing::Job::operator=(other);
    copy(other);
    return *this;
}

void AFDXMessage::copy(const AFDXMessage& other)
{
    this->networkId = other.networkId;
    this->equipmentId = other.equipmentId;
    this->interfaceId = other.interfaceId;
    this->virtualLinkId = other.virtualLinkId;
    this->seqNum = other.seqNum;
    this->partitionId = other.partitionId;
    this->udpSrcPort = other.udpSrcPort;
    this->udpDestPort = other.udpDestPort;
}

void AFDXMessage::parsimPack(omnetpp::cCommBuffer *b) const
{
    ::queueing::Job::parsimPack(b);
    doParsimPacking(b,this->networkId);
    doParsimPacking(b,this->equipmentId);
    doParsimPacking(b,this->interfaceId);
    doParsimPacking(b,this->virtualLinkId);
    doParsimPacking(b,this->seqNum);
    doParsimPacking(b,this->partitionId);
    doParsimPacking(b,this->udpSrcPort);
    doParsimPacking(b,this->udpDestPort);
}

void AFDXMessage::parsimUnpack(omnetpp::cCommBuffer *b)
{
    ::queueing::Job::parsimUnpack(b);
    doParsimUnpacking(b,this->networkId);
    doParsimUnpacking(b,this->equipmentId);
    doParsimUnpacking(b,this->interfaceId);
    doParsimUnpacking(b,this->virtualLinkId);
    doParsimUnpacking(b,this->seqNum);
    doParsimUnpacking(b,this->partitionId);
    doParsimUnpacking(b,this->udpSrcPort);
    doParsimUnpacking(b,this->udpDestPort);
}

int AFDXMessage::getNetworkId() const
{
    return this->networkId;
}

void AFDXMessage::setNetworkId(int networkId)
{
    this->networkId = networkId;
}

int AFDXMessage::getEquipmentId() const
{
    return this->equipmentId;
}

void AFDXMessage::setEquipmentId(int equipmentId)
{
    this->equipmentId = equipmentId;
}

int AFDXMessage::getInterfaceId() const
{
    return this->interfaceId;
}

void AFDXMessage::setInterfaceId(int interfaceId)
{
    this->interfaceId = interfaceId;
}

int AFDXMessage::getVirtualLinkId() const
{
    return this->virtualLinkId;
}

void AFDXMessage::setVirtualLinkId(int virtualLinkId)
{
    this->virtualLinkId = virtualLinkId;
}

int AFDXMessage::getSeqNum() const
{
    return this->seqNum;
}

void AFDXMessage::setSeqNum(int seqNum)
{
    this->seqNum = seqNum;
}

int AFDXMessage::getPartitionId() const
{
    return this->partitionId;
}

void AFDXMessage::setPartitionId(int partitionId)
{
    this->partitionId = partitionId;
}

int AFDXMessage::getUdpSrcPort() const
{
    return this->udpSrcPort;
}

void AFDXMessage::setUdpSrcPort(int udpSrcPort)
{
    this->udpSrcPort = udpSrcPort;
}

int AFDXMessage::getUdpDestPort() const
{
    return this->udpDestPort;
}

void AFDXMessage::setUdpDestPort(int udpDestPort)
{
    this->udpDestPort = udpDestPort;
}

class AFDXMessageDescriptor : public omnetpp::cClassDescriptor
{
  private:
    mutable const char **propertynames;
  public:
    AFDXMessageDescriptor();
    virtual ~AFDXMessageDescriptor();

    virtual bool doesSupport(omnetpp::cObject *obj) const override;
    virtual const char **getPropertyNames() const override;
    virtual const char *getProperty(const char *propertyname) const override;
    virtual int getFieldCount() const override;
    virtual const char *getFieldName(int field) const override;
    virtual int findField(const char *fieldName) const override;
    virtual unsigned int getFieldTypeFlags(int field) const override;
    virtual const char *getFieldTypeString(int field) const override;
    virtual const char **getFieldPropertyNames(int field) const override;
    virtual const char *getFieldProperty(int field, const char *propertyname) const override;
    virtual int getFieldArraySize(void *object, int field) const override;

    virtual const char *getFieldDynamicTypeString(void *object, int field, int i) const override;
    virtual std::string getFieldValueAsString(void *object, int field, int i) const override;
    virtual bool setFieldValueAsString(void *object, int field, int i, const char *value) const override;

    virtual const char *getFieldStructName(int field) const override;
    virtual void *getFieldStructValuePointer(void *object, int field, int i) const override;
};

Register_ClassDescriptor(AFDXMessageDescriptor)

AFDXMessageDescriptor::AFDXMessageDescriptor() : omnetpp::cClassDescriptor("afdx::AFDXMessage", "queueing::Job")
{
    propertynames = nullptr;
}

AFDXMessageDescriptor::~AFDXMessageDescriptor()
{
    delete[] propertynames;
}

bool AFDXMessageDescriptor::doesSupport(omnetpp::cObject *obj) const
{
    return dynamic_cast<AFDXMessage *>(obj)!=nullptr;
}

const char **AFDXMessageDescriptor::getPropertyNames() const
{
    if (!propertynames) {
        static const char *names[] = {  nullptr };
        omnetpp::cClassDescriptor *basedesc = getBaseClassDescriptor();
        const char **basenames = basedesc ? basedesc->getPropertyNames() : nullptr;
        propertynames = mergeLists(basenames, names);
    }
    return propertynames;
}

const char *AFDXMessageDescriptor::getProperty(const char *propertyname) const
{
    omnetpp::cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : nullptr;
}

int AFDXMessageDescriptor::getFieldCount() const
{
    omnetpp::cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 8+basedesc->getFieldCount() : 8;
}

unsigned int AFDXMessageDescriptor::getFieldTypeFlags(int field) const
{
    omnetpp::cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount())
            return basedesc->getFieldTypeFlags(field);
        field -= basedesc->getFieldCount();
    }
    static unsigned int fieldTypeFlags[] = {
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
        FD_ISEDITABLE,
    };
    return (field>=0 && field<8) ? fieldTypeFlags[field] : 0;
}

const char *AFDXMessageDescriptor::getFieldName(int field) const
{
    omnetpp::cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount())
            return basedesc->getFieldName(field);
        field -= basedesc->getFieldCount();
    }
    static const char *fieldNames[] = {
        "networkId",
        "equipmentId",
        "interfaceId",
        "virtualLinkId",
        "seqNum",
        "partitionId",
        "udpSrcPort",
        "udpDestPort",
    };
    return (field>=0 && field<8) ? fieldNames[field] : nullptr;
}

int AFDXMessageDescriptor::findField(const char *fieldName) const
{
    omnetpp::cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount() : 0;
    if (fieldName[0]=='n' && strcmp(fieldName, "networkId")==0) return base+0;
    if (fieldName[0]=='e' && strcmp(fieldName, "equipmentId")==0) return base+1;
    if (fieldName[0]=='i' && strcmp(fieldName, "interfaceId")==0) return base+2;
    if (fieldName[0]=='v' && strcmp(fieldName, "virtualLinkId")==0) return base+3;
    if (fieldName[0]=='s' && strcmp(fieldName, "seqNum")==0) return base+4;
    if (fieldName[0]=='p' && strcmp(fieldName, "partitionId")==0) return base+5;
    if (fieldName[0]=='u' && strcmp(fieldName, "udpSrcPort")==0) return base+6;
    if (fieldName[0]=='u' && strcmp(fieldName, "udpDestPort")==0) return base+7;
    return basedesc ? basedesc->findField(fieldName) : -1;
}

const char *AFDXMessageDescriptor::getFieldTypeString(int field) const
{
    omnetpp::cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount())
            return basedesc->getFieldTypeString(field);
        field -= basedesc->getFieldCount();
    }
    static const char *fieldTypeStrings[] = {
        "int",
        "int",
        "int",
        "int",
        "int",
        "int",
        "int",
        "int",
    };
    return (field>=0 && field<8) ? fieldTypeStrings[field] : nullptr;
}

const char **AFDXMessageDescriptor::getFieldPropertyNames(int field) const
{
    omnetpp::cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount())
            return basedesc->getFieldPropertyNames(field);
        field -= basedesc->getFieldCount();
    }
    switch (field) {
        default: return nullptr;
    }
}

const char *AFDXMessageDescriptor::getFieldProperty(int field, const char *propertyname) const
{
    omnetpp::cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount())
            return basedesc->getFieldProperty(field, propertyname);
        field -= basedesc->getFieldCount();
    }
    switch (field) {
        default: return nullptr;
    }
}

int AFDXMessageDescriptor::getFieldArraySize(void *object, int field) const
{
    omnetpp::cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount())
            return basedesc->getFieldArraySize(object, field);
        field -= basedesc->getFieldCount();
    }
    AFDXMessage *pp = (AFDXMessage *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

const char *AFDXMessageDescriptor::getFieldDynamicTypeString(void *object, int field, int i) const
{
    omnetpp::cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount())
            return basedesc->getFieldDynamicTypeString(object,field,i);
        field -= basedesc->getFieldCount();
    }
    AFDXMessage *pp = (AFDXMessage *)object; (void)pp;
    switch (field) {
        default: return nullptr;
    }
}

std::string AFDXMessageDescriptor::getFieldValueAsString(void *object, int field, int i) const
{
    omnetpp::cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount())
            return basedesc->getFieldValueAsString(object,field,i);
        field -= basedesc->getFieldCount();
    }
    AFDXMessage *pp = (AFDXMessage *)object; (void)pp;
    switch (field) {
        case 0: return long2string(pp->getNetworkId());
        case 1: return long2string(pp->getEquipmentId());
        case 2: return long2string(pp->getInterfaceId());
        case 3: return long2string(pp->getVirtualLinkId());
        case 4: return long2string(pp->getSeqNum());
        case 5: return long2string(pp->getPartitionId());
        case 6: return long2string(pp->getUdpSrcPort());
        case 7: return long2string(pp->getUdpDestPort());
        default: return "";
    }
}

bool AFDXMessageDescriptor::setFieldValueAsString(void *object, int field, int i, const char *value) const
{
    omnetpp::cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount())
            return basedesc->setFieldValueAsString(object,field,i,value);
        field -= basedesc->getFieldCount();
    }
    AFDXMessage *pp = (AFDXMessage *)object; (void)pp;
    switch (field) {
        case 0: pp->setNetworkId(string2long(value)); return true;
        case 1: pp->setEquipmentId(string2long(value)); return true;
        case 2: pp->setInterfaceId(string2long(value)); return true;
        case 3: pp->setVirtualLinkId(string2long(value)); return true;
        case 4: pp->setSeqNum(string2long(value)); return true;
        case 5: pp->setPartitionId(string2long(value)); return true;
        case 6: pp->setUdpSrcPort(string2long(value)); return true;
        case 7: pp->setUdpDestPort(string2long(value)); return true;
        default: return false;
    }
}

const char *AFDXMessageDescriptor::getFieldStructName(int field) const
{
    omnetpp::cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount())
            return basedesc->getFieldStructName(field);
        field -= basedesc->getFieldCount();
    }
    switch (field) {
        default: return nullptr;
    };
}

void *AFDXMessageDescriptor::getFieldStructValuePointer(void *object, int field, int i) const
{
    omnetpp::cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount())
            return basedesc->getFieldStructValuePointer(object, field, i);
        field -= basedesc->getFieldCount();
    }
    AFDXMessage *pp = (AFDXMessage *)object; (void)pp;
    switch (field) {
        default: return nullptr;
    }
}

} // namespace afdx

