#include "SCC.h"
#include "Node.h"

void SCC::clear()
{
	mNodeList.clear();
	mNodeSet.clear();
}

void SCC::addNode(Node* X)
{
	mNodeSet.insert(X);
	mNodeList.push_back(X);
	X->setSCC(this);
}

void SCC::print(ostream& fptr)
{
	cerr << "\nNew SCC :  ";
	for(unsigned i =0;i<size();++i)
	{
		Node* currNode = getNode(i);
		cerr << " " << currNode->getLLVMNodeId();
		if(currNode->getLLVMValue() && 
				(currNode->getLLVMValue()->getName()).length() > 0)
			cerr << "("<<currNode->getLLVMValue()->getName()<<")";
	}
	cerr << "\n";

}
