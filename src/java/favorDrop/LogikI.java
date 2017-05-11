package favorDrop;

import javax.jws.WebMethod;
import javax.jws.WebService;

/**
 * Created by Rasmus on 12-04-2017.
 */

@WebService 
public interface LogikI {
  @WebMethod boolean login(String bruger, String adgangskode) throws Exception;
    @WebMethod Object getClientsA(String user, String adgangskode);
    @WebMethod Object getPartnersA(String user, String adgangskode);
    @WebMethod Object getCompletedOrdersLength(String user, String adgangskode);
    @WebMethod Object getOrdersNew(String user, String adgangskode);
    @WebMethod Object getOrdersInService(String user, String adgangskode);
    @WebMethod Object deleteorderNew(String user, String adgangskode, String OID);
    @WebMethod Object deleteorderInService(String user, String adgangskode, String OID);
}
