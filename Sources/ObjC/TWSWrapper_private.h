//
//  TWSWrapper_private.h
//  TWSAPI
//
//  Created by Matthew Giger on 10/3/21.
//


#import "EWrapper.h"
#import "TWSWrapperProtocols.h"

class TWSWrapperWrapper: public EWrapper {
	
	id<TWSServiceProtocol, TWSContractProtocol, TWSSnapshotDataProtocol, TWSOrdersProtocol, TWSAccountProtocol, TWSSearchProtocol> wrapper;
	
public:
	TWSWrapperWrapper(id<TWSServiceProtocol, TWSContractProtocol, TWSSnapshotDataProtocol, TWSOrdersProtocol, TWSAccountProtocol, TWSSearchProtocol> wrapper) :
		wrapper(wrapper)
	{
	}
	
#include "EWrapper_prototypes.h"
	
};

