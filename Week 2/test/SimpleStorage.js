const SimpleStorage = artifacts.require('SimpleStorage.sol');

contract('SimpleStorage',()=>{
    testAndReturn(100);
    testAndReturn(20);
    testAndReturn(70);
    testAndReturn(800);
    testAndReturn(100);
    testAndReturn(40);
    testAndReturn(700);
    testAndReturn(60);
    
});

function testAndReturn(a){
    it('Should Updatedat', async () => {
        const storage = await SimpleStorage.new();
        await storage.updateData(a);
        const data = await storage.readData();
        assert(data.toString()===a.toString());      
    });
    
}
