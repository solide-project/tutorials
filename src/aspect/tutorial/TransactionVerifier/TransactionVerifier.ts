import {
    ITransactionVerifier, allocate, entryPoint, execute, sys, TxVerifyInput
} from "@artela/aspect-libs";

class Aspect implements ITransactionVerifier {
    verifyTx(input: TxVerifyInput): Uint8Array {
        return sys.aspect.property.get<Uint8Array>('verifyAccount');
    }

    /**
     * isOwner is the governance account implemented by the Aspect, when any of the governance operation
     * (including upgrade, config, destroy) is made, isOwner method will be invoked to check
     * against the initiator's account to make sure it has the permission.
     *
     * @param ctx context of Aspect state
     * @param sender address of the operation initiator
     * @return true if check success, false if check fail
     */
    isOwner(sender: Uint8Array): bool {
        // always return false on isOwner can make the Aspect immutable
        return true;
    }
}

// 2.register aspect Instance
const aspect = new Aspect();
entryPoint.setAspect(aspect);

// 3.must export it
export {execute, allocate};