#ifndef SCC_H
#define SCC_H

#include "headers.h"

class Node;
class SCC
{
	public:
		SCC() { clear(); }
		~SCC() { clear(); }
		void clear();
		void addNode(Node* X);
		unsigned size() { return mNodeList.size(); }
		Node* getNode(unsigned idx) { return mNodeList[idx]; }
		
		void setSCCGraphNode(Node* X) { mSCCGraphNode = X; }
		Node* getSCCGraphNode() { return mSCCGraphNode; }

		bool contains(Node* X) { return (!NOTFOUND(mNodeSet, X)); }
		void print(ostream& fptr);
		vector<Node*> getNodes() { return mNodeList; }
	private:
		set<Node*> mNodeSet;
		vector<Node*> mNodeList;
		Node* mSCCGraphNode;
};

#endif
