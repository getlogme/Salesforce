public class JSONFrameworkController{
    public List<Object> uaList{get;set;}
    public void init(){
        ServiceFacade sf=new ServiceFacade();
        Map<String, Object> resMap=sf.serviceCallout();
        System.debug('resMap ===> '+resMap);
        System.debug('Keys::::: '+resMap.keyset());
        Map<String, Object> ruaResMap=(Map<String, Object>)resMap.get('retrieveUnderwritingActivitiesResponse');
        System.debug('ruaResMap===> '+ruaResMap.keyset());
        List<Object> uas =(List<Object>)ruaResMap.get('underwritingActivities');
        System.debug('uas ===> '+uas);
        
        Map<String,Object> uasMap =(Map<String,Object>)ruaResMap.get('underwritingActivities');
        System.debug('uasMap ===> '+uasMap );
        System.debug('uasMap keys ===> '+uasMap.keyset());
        uaList=uas;
    } 
}