#ifndef EDGE_H
#define EDGE_H

#include "headers.h"

/*typedef double double;*/
typedef unsigned VolumeType;

class Node;

class Edge
{
    private:
        std::string mName;
        unsigned mId;
        Node* mPred;
        Node* mSucc;
        unsigned mEdgeType;
        double mWeight;
        bool mIsBackEdge;
        bool mIsWeakEdge;
        bool mIsMemopEdge;

        map<unsigned, unsigned> mIterDist2Count;
        //		BoostEdge mBoostEdge; 
    public:
        Edge(std::string name, unsigned id);
        ~Edge() { clear(); }
        void clear();
        Node* getSucc();
        Node* getPred();
        std::string getName() { return mName; }
        void setName(string name ) { mName = name; }

        void setPred(Node* pred) { mPred =  pred; }
        void setSucc(Node* succ) { mSucc =  succ; }
        unsigned getId() { return mId; }
        /*void setCommunicationVolume(VolumeType t) { mCommVolume = t; }*/
        /*VolumeType getCommunicationVolume() { return mCommVolume; }*/

        void setEdgeType(unsigned type) { mEdgeType = type; }
        unsigned getEdgeType() { return mEdgeType; }

        void setWeight(double val) { mWeight = val; };
        void setEdgeWeight(double val) { mWeight = val; };
        double getWeight() { return mWeight; }
        double getEdgeWeight() { return mWeight; }
        void markBackEdge(bool val) { mIsBackEdge = val; }
        bool isBackEdge() { return mIsBackEdge; }

        void addLoopIterDistanceCount(unsigned loopIter, unsigned count);
        double getAverageIterDistance();
        void copyData(Edge* e);

        void markWeakEdge(bool val) { mIsWeakEdge = val; }
        bool isWeakEdge() { return mIsWeakEdge; }

        void markMemopEdge(bool val) { mIsMemopEdge = val; }
        bool isMemopEdge() { return mIsMemopEdge; }

        //		void setBoostEdge(BoostEdge e) { mBoostEdge = e; }
        //		BoostEdge getBoostEdge() { return mBoostEdge; }
};

#endif
