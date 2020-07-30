
package ws;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.Action;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.11-b150120.1832
 * Generated source version: 2.2
 * 
 */
@WebService(name = "WS", targetNamespace = "http://WS/")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface WS {


    /**
     * 
     * @param name
     * @return
     *     returns java.lang.String
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "hello", targetNamespace = "http://WS/", className = "ws.Hello")
    @ResponseWrapper(localName = "helloResponse", targetNamespace = "http://WS/", className = "ws.HelloResponse")
    @Action(input = "http://WS/WS/helloRequest", output = "http://WS/WS/helloResponse")
    public String hello(
        @WebParam(name = "name", targetNamespace = "")
        String name);

    /**
     * 
     * @param rut
     * @param fechaNacimiento
     * @param correo
     * @param contrasena
     * @param nombreUsuario
     * @param nombreCompleto
     * @param telefono
     * @param rol
     * @return
     *     returns boolean
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "agregarUsuario", targetNamespace = "http://WS/", className = "ws.AgregarUsuario")
    @ResponseWrapper(localName = "agregarUsuarioResponse", targetNamespace = "http://WS/", className = "ws.AgregarUsuarioResponse")
    @Action(input = "http://WS/WS/agregarUsuarioRequest", output = "http://WS/WS/agregarUsuarioResponse")
    public boolean agregarUsuario(
        @WebParam(name = "rut", targetNamespace = "")
        String rut,
        @WebParam(name = "nombre_usuario", targetNamespace = "")
        String nombreUsuario,
        @WebParam(name = "contrasena", targetNamespace = "")
        String contrasena,
        @WebParam(name = "nombre_completo", targetNamespace = "")
        String nombreCompleto,
        @WebParam(name = "fecha_nacimiento", targetNamespace = "")
        String fechaNacimiento,
        @WebParam(name = "telefono", targetNamespace = "")
        String telefono,
        @WebParam(name = "correo", targetNamespace = "")
        String correo,
        @WebParam(name = "rol", targetNamespace = "")
        String rol);

}