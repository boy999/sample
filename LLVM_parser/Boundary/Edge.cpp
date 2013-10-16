#include "Edge.h"
#include "Node.h"
//Edge functions
Edge::Edge(std::string name, unsigned id)
{
	clear();
	mName = name;
	mPred = mSucc = 0;
	mId = id;
	//mCommVolume = 10;
	mEdgeType = 0;
	mIsBackEdge = false;

	mWeight = 0;
}

Node* Edge::getPred()
{
	return mPred;
}

Node* Edge::getSucc()
{
	return mSucc;
}

void Edge::addLoopIterDistanceCount(unsigned iterDist, unsigned count)
{
	mIterDist2Count[iterDist] = count;
}

double Edge::getAverageIterDistance()
{
	unsigned total = 0;
	unsigned denom = 0;
	map<unsigned, unsigned>::iterator mB = mIterDist2Count.begin(), mE = mIterDist2Count.end();
	for(;mB != mE;mB++)
	{
		total += (*mB).first;
		denom += (*mB).second;
	}

	if(denom > 0)
		return (double)total/denom;
	return 0;
}

void Edge::clear()
{
	mName.clear();
	mIterDist2Count.clear();
}

void Edge::copyData(Edge* X)
{
	mEdgeType = X->getEdgeType();
	mWeight = X->getEdgeWeight();
}
